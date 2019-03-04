import os
import glob
import math
import re
import string
import gensim
import subprocess
import itertools
import numpy as np
import xml.etree.ElementTree as ET

from collections import Counter
from functools import reduce
from textwrap import wrap
from whoosh.analysis import StandardAnalyzer, SimpleAnalyzer
from sklearn.metrics.pairwise import cosine_similarity
from tqdm import tqdm


class Utils(object):
    """utils functions for neural vector space models"""

    def __init__(self, seed):
        """set random seed, initialize term dict"""
        np.random.seed(seed)
        self.term_dict = {}

    def process_corpus(self, corpus_path, stoplist=None, remove_digits=True):
        """read corpus and process it as a list of lists"""
        corpus = glob.glob(corpus_path + '/**/*.xml', recursive=True)
        # standard analyzer: regex tokenizer, lowercase filter, stopwords removal
        if stoplist:
            # use custom stoplist
            with open(stoplist, 'r') as sl:
                stop_words = [stop.strip() for stop in sl]
            analyzer = StandardAnalyzer(stoplist=stop_words, minsize=2)  # minsize: minimum token size to be considered (defualt: 2)
        else:  # use whoosh default stop list
            analyzer = StandardAnalyzer(minsize=2)
        proc_corpus = []
        doc_ids = []
        # loop over docs 
        for path in tqdm(corpus): 
            with open(path, 'r', encoding='utf-8', errors='ignore') as f:  # read file
                xml = f.read()
            # remove preface information 
            xml = re.sub(r"<\?xml(.+?)\?>", "", xml)
            xml = re.sub(r"<!DOCTYPE(.+?)>", "", xml)
            # strip potential '\n' commands left
            xml = xml.strip()      
            # convert into true xml
            xml = '<ROOT>' + xml + '</ROOT>'
            # parse xml doc structure
            root = ET.fromstring(xml)
            # loop through each doc
            for doc in tqdm(root):
                text = u''
                docno = u''
                # loop thorugh each element (tag, value)
                for elem in doc:
                    if elem.tag == 'head':  # get docno
                        docno = elem.find('docdata').find('doc-id').get('id-string').strip()
                        doc_ids.append(docno)
                    # check if elem has children
                    if len(elem) == 0:  # elem does not contain children
                        if elem.text:
                            text += elem.text.strip() + ' '
                    else:  # elem does contain children
                        text += self.get_text_recursively(elem, text)
                # tokenize doc
                if remove_digits:  # remove terms containing digits before term dictionary creation
                    doc_tokens = [token.text for token in analyzer(text) if not self.has_digit(token.text)]
                else:
                    doc_tokens = [token.text for token in analyzer(text)]
                # append to processed corpus
                proc_corpus.append(doc_tokens)
        # return processed corpus and list of doc ids
        return proc_corpus, doc_ids

    def get_text_recursively(self, root, text):
        """recursively iterate over xml element tree"""
        for elem in root:
            if len(elem) == 0:  # elem does not contain children
                if elem.text:
                    text += elem.text.strip() + ' '
            else:  # element does contain children
                # recursively obtain children contents
                text = self.get_text_recursively(elem, text)
        return text

    def has_digit(self, term):
        """check whether input term contains digits"""
        return any(char.isdigit() for char in term)

    def corpus_statistics(self, corpus):
        """compute and print corpus statistics"""
        corpus_size = len(corpus)
        # compute documents lengths
        docs_length = np.array([len(doc) for doc in corpus])
        # compute corpus length
        corpus_length = [term for doc in corpus for term in doc]
        # print statistics
        print('corpus size: {}'.format(corpus_size))
        print('maximum length: {}'.format(np.max(docs_length)))
        print('minimum length: {}'.format(np.min(docs_length)))
        print('average length: {}'.format(np.mean(docs_length)))
        print('median length: {}'.format(np.median(docs_length)))
        print('std length: {}'.format(np.std(docs_length)))
        print('all terms: {}'.format(len(corpus_length)))
        return True

    def build_term_dictionary(self, proc_corpus, dict_size=65536, oov=False, min_doc_freq=2, max_doc_freq=0.5):
        """create term dictionary"""
        term_dict = gensim.corpora.Dictionary(proc_corpus)
        # filter terms with doc frequency lower than min_doc_freq and greater than max_doc_freq
        term_dict.filter_extremes(no_below=min_doc_freq, no_above=max_doc_freq, keep_n=dict_size)
        # assign dict {str: int} to self.term_dict
        self.term_dict = term_dict.token2id
        if oov:  # include out of vocabulary token
            self.term_dict["__UNK__"] = len(self.term_dict)
        return True

    def get_term_dictionary(self):
        """get term dictionary"""
        return self.term_dict

    def update_term_dictionary(self, term):
        """update term dictionary"""
        if term in self.term_dict:  # term already in term_dict
            return True
        else:  # update term_dict
            self.term_dict[term] = len(self.term_dict)
            return True

    def corpus2idx(self, proc_corpus, oov=False):
        """convert documents into list of indices"""
        enc_corpus = []
        # encode corpus
        for doc in proc_corpus:  
            enc_doc = []          
            for term in doc:
                if term in self.term_dict:
                    enc_doc.append(self.term_dict[term])
                else:
                    if oov:  # store oov index
                        enc_doc.append(self.term_dict['__UNK__'])
                    else:  # skip term
                        continue
            # store processed doc in corpus
            enc_corpus.append(enc_doc)
        return enc_corpus

    def compute_num_batches(self, corpus, batch_size, ngram_size):
        """compute number of batch iterations per epoch"""
        docs_length = [len(doc) for doc in corpus]
        # compute number of batches
        num_batches = math.ceil(sum([max(doc_length - ngram_size + 1, 0) for doc_length in docs_length]) / batch_size)
        return num_batches

    def generate_batch_data(self, corpus, allowed_docs, batch_size, ngram_size, neg_samples):
        """generate a batch of data for given corpus (optimized)"""
        corpus_size = len(corpus)
        # select random documents from allowed documents (i.e. documents with len(doc) >= ngram_size)
        rand_docs_idx = np.random.choice(allowed_docs, size=batch_size)
        # compute documents length
        docs_length = [len(corpus[rand_doc_idx]) for rand_doc_idx in rand_docs_idx]
        # store position of last prefixes + 1 (one above the highest prefix available)
        last_prefixes = [doc_length - ngram_size + 1 for doc_length in docs_length]
        # sample random prefixes lower than or equal to last_prefixes
        prefixes = [np.random.randint(last_prefix) for last_prefix in last_prefixes]
        # slices = prefixes + ngram_size
        ngrams = [corpus[rand_doc_idx][prefix:prefix+ngram_size] for rand_doc_idx, prefix in zip(rand_docs_idx, prefixes)]
        # generate negative labels - discrete uniform distribution
        negative_labels = np.random.randint(corpus_size, size=[batch_size, neg_samples])
        # convert batch data to numpy array
        ngrams = np.array(ngrams)
        # return batch data in the form: (ngrams, true labels, negative labels)
        return ngrams, rand_docs_idx, negative_labels

    def get_allowed_docs(self, corpus, ngram_size):
        """return list of allowed documents indexes for the given ngram size"""
        allowed_docs = list()
        del_docs = list()
        # loop over documents and store doc indexes when len(doc) >= ngram_size
        for idx, doc in enumerate(corpus):
            if len(doc) >= ngram_size:
                allowed_docs.append(idx)
            else:
                del_docs.append(idx)
        print('deleted {} docs'.format(len(del_docs)))
        return np.array(allowed_docs)

    def read_ohsu_queries(self, query_path):
        """read query file and return a dict[id] = {title: <string>, desc: <string>}"""
        with open(query_path, 'r') as qf:
            q = qf.read()
        q = [query.split('\n') for query in q.split('\n\n') if query]
        # loop through each query and fill dict
        qdict = dict()
        for query in q:
            qid = query[1].split()[-1]
            qdict[qid] = dict()
            qdict[qid]['title'] = query[2].split('<title>')[1].strip()
            qdict[qid]['desc'] = query[4]
        return qdict

    def read_trec_queries(self, query_path):  # TODO: add description field 
        """read query file and return a dict[id] = query"""
        qdict = dict()
        with open(query_path, 'r') as qf:
            xml = qf.read()
        # convert into true xml
        xml = '<ROOT>' + xml + '</ROOT>'
        root = ET.fromstring(xml)
        # loop through each query
        for q in root:
            qid = q.find('num').text.strip()
            qdict[qid] = {}
            qdict[qid]['title'] = q.find('title').text.strip()
            qdict[qid]['desc'] = q.find('desc').text.strip()
        return qdict

    def read_clef_queries(self, query_path):  # TODO: add description field 
        """read query file and return a dict[id] = query"""
        qdict = dict()
        with open(query_path, 'r') as qf:
            xml = qf.read()
        root = ET.fromstring(xml)
        # loop through each query
        for q in root:
            qid = q.find('identifier').text.strip()
            qdict[qid] = {}
            qdict[qid]['title'] = q.find('title').text.strip()
            qdict[qid]['desc'] = q.find('description').text.strip()
        return qdict

    def tokenize_query(self, q):
        """lowerize and tokenize query"""
        analyzer = SimpleAnalyzer()
        return [token.text for token in analyzer(q)]

    def query2idx(self, q, qid, oov=False):
        """convert query terms to indices"""
        query_idx = list()
        for term in q: 
            if term in self.term_dict:
                query_idx.append(self.term_dict[term])
            else:
                if oov:  # keep term as __UNK__ token
                    query_idx.append(self.term_dict['__UNK__'])
                else:  # skip term
                    continue
        if not query_idx:
            print('query {} does not contain terms'.format(qid))
            return None
        else:
            return np.array(query_idx)

    def query_projection(self, query_idx, word_embs, proj_weights):
        """convert list of indices into dense vector of size [1, doc_embs]"""
        if query_idx is None:
            return None
        else:
            return np.matmul(proj_weights, np.mean(word_embs[query_idx], axis=0))

    def prepare_query(self, qid, qtext, word_embs, proj_weights, oov=False):
        """transform query into dense vector of size [1, doc_embs]"""
        query_tokens = self.tokenize_query(qtext)
        query_idx = self.query2idx(query_tokens, qid, oov)
        query_proj = self.query_projection(query_idx, word_embs, proj_weights)
        return query_proj

    def perform_search(self, doc_labels, docs, query_ids, queries, ranking_folder, ranking_name):
        """perform search over docs given queries"""
        doc_labels = np.array(doc_labels)
        # compute similarities
        print('compute similarities between docs and queries')
        similarities = cosine_similarity(docs, queries)
        # open file to write results
        rf = open(ranking_folder + '/' + ranking_name + '.run', 'w')
        # write results in ranking file
        for i in tqdm(range(similarities.shape[1])):
            rank = np.argsort(-similarities[:, i])[:1000]
            docs_rank = doc_labels[rank]
            qid = query_ids[i]
            # verify whether qid is an integer
            if qid.isdigit():  # cast to integer - this operation avoids storing topic ids as '059' instead of '59'
                qid = str(int(qid))  # convert to int and then back to str
            for j in range(len(docs_rank)):
                # write into .run file
                rf.write('%s\t%d\t%s\t%d\t%f\t%s\n' % (qid, 0, docs_rank[j], j, similarities[rank[j]][i], ranking_name))
        rf.close()
        return True

    def get_averaged_measure_score(self, run_path, qrel_path, measure):
        """return averaged measure score over topics"""
        if "P_" in measure:
            cmd = "./trec_eval/trec_eval -m " + measure.split('_')[0] + " " + qrel_path + " " + run_path
        elif "ndcg_cut" in measure:
            cmd = "./trec_eval/trec_eval -m " + measure.split('_')[0] + '_' + measure.split('_')[1] + " " + qrel_path + " " + run_path
        else:
            cmd = "./trec_eval/trec_eval -m " + measure + " " + qrel_path + " " + run_path
        process = subprocess.run(cmd.split(), stdout=subprocess.PIPE)
        result = process.stdout.decode('utf-8').split('\n')
        qscore = np.array([score.split('\t')[-1] for score in result 
                 if score.split('\t')[0].strip() == measure])
        qscore = qscore.astype(np.float)[0]
        return qscore

    def evaluate_rankings(self, ranking_folder, ranking_name, qrels_folder, qrels_name):
        """evaluate rankings performed by neural models"""
        print('evaluate model ranking')
        MAP = self.get_averaged_measure_score(ranking_folder + '/' + ranking_name + '.run', qrels_folder + '/' + qrels_name + '.qrel', 'map')
        NDCG = self.get_averaged_measure_score(ranking_folder + '/' + ranking_name + '.run', qrels_folder + '/' + qrels_name + '.qrel', 'ndcg_cut_100')
        P_10 = self.get_averaged_measure_score(ranking_folder + '/' + ranking_name + '.run', qrels_folder + '/' + qrels_name + '.qrel', 'P_10')
        print('MAP: ' + str(MAP), 'NDCG: ' + str(NDCG), 'P@10: ' + str(P_10))
        return MAP