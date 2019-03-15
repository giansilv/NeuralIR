"""
This is the code to produce a valid input for DRMM
It requires two folders, one qrels file (space-separated, trec format), and a stoplist file (one word per line).
The first folder should contain the documents in the chosen collection (one file = one document, and file_name = doc_id)
The second folder should contain the queries to use (one file = one query, and file_name = query_id)
"""
import os
import string

from nltk import SnowballStemmer
from tqdm import tqdm
import numpy as np
import math
from whoosh.analysis import StemmingAnalyzer, StandardAnalyzer
from krovetzstemmer import Stemmer
from hazm import Stemmer as paStemmer
from pyspark import SparkContext, SparkConf

OS_PYTHON = r'/home/alberto/anaconda3/envs/tf/bin/python3'


def compute_folds(run_to_rerank, qrels_file_path):
    # gather all the queries with at least one relevant document
    q_names_to_keep = []
    for line in open(qrels_file_path):
        data = line.split()
        qname = data[0]
        if qname not in q_names_to_keep:
            q_names_to_keep.append(qname)

    q_names = q_names_to_keep
    # q_names = []
    # for line in open(run_to_rerank):
    #     data = line.split()
    #     q_name = data[0].strip()
    #     if q_name not in q_names_to_keep:
    #         continue
    #     q_name = q_name.replace('OHSU', '')
    #     if '-TEST' in q_name:
    #         q_name = q_name.replace('-TEST', '')
    #         q_name = q_name + '000'
    #     q_names.append(q_name)
    q_names = list(set(q_names))
    n_splits = 5
    splits_len = int(np.ceil(len(q_names) / n_splits))
    for k in range(n_splits):
        s = q_names[k * splits_len:min((k + 1) * splits_len, len(q_names))]
        # train_idx = [str(s[i]) for i in s]
        print('\t\t\tvecTrain[' + str(k) + ']={' + ','.join(s) + '};')
        k += 1


def print_idcg(qrels_file_path, output_file_path):
    rel_docs_cnt_by_qry = {}
    all_qnames = []
    for line in open(qrels_file_path, 'r'):
        data = line.split(' ')
        q_name = data[0]
        if q_name not in all_qnames:
            all_qnames.append(q_name)
        rel_j = data[3].strip()
        if int(rel_j) > 0:
            if q_name in rel_docs_cnt_by_qry.keys():
                rel_docs_cnt_by_qry[q_name] = rel_docs_cnt_by_qry[q_name] + 1
            else:
                rel_docs_cnt_by_qry[q_name] = 1

    out = open(output_file_path, 'w')
    for q_name, rdc in rel_docs_cnt_by_qry.items():
        sum_v = 0
        for i in range(0, rdc):
            sum_v += 1 / math.log10(i + 2)
        q_name = q_name.replace('OHSU', '')
        if '-TEST' in q_name:
            q_name = q_name.replace('-TEST', '')
            q_name = q_name + '000'
        line = str(q_name) + '\t' + str(sum_v) + '\n'
        # print(line)
        out.write(line)

    for q_name in all_qnames:
        if q_name not in rel_docs_cnt_by_qry.keys():
            q_name = q_name.replace('OHSU', '')
            if '-TEST' in q_name:
                q_name = q_name.replace('-TEST', '')
                q_name = q_name + '000'
                line = str(q_name) + '\t' + str(0) + '\n'
                out.write(line)
    out.close()


def tokenize(text, stemming=True, stoplist=[], remove_digits=False, lang='en'):
    translator = str.maketrans(string.punctuation, ' ' * len(string.punctuation))  # map punctuation to space
    text = text.translate(translator)
    text = text.lower()
    text = text.strip()
    table = str.maketrans({key: None for key in string.punctuation})
    text = text.translate(table)
    if stemming:
        if lang == 'en':
            stemmer = Stemmer()
        elif lang == 'it':
            stemmer = SnowballStemmer('italian')
        elif lang == 'de':
            stemmer = SnowballStemmer('german')
        elif lang == 'fa':
            stemmer = paStemmer()
        analyzer = StemmingAnalyzer(stoplist=stoplist, minsize=1, stemfn=stemmer.stem)
    else:
        analyzer = StandardAnalyzer(stoplist=stoplist, minsize=1)

    tokens = [token.text for token in analyzer(text)]
    if remove_digits:
        tokens = [word for word in tokens if not contains_digits(word) and 2 <= len(word)]
    return tokens


def contains_digits(token):
    for c in token:
        if c.isdigit():
            return True
    return False


def tokenize_collection(documents, stemming, stoplist, remove_digits=False):
    os.environ['PYSPARK_PYTHON'] = OS_PYTHON
    conf = SparkConf().setMaster('local[*]').set('spark.driver.memory', '25g').set('spark.driver.maxResultSize', '15g') \
        .set('spark.executor.memory', '25g')
    sc = SparkContext(conf=conf)
    tokenized_docs = sc.parallelize(documents). \
        map(lambda doc: tokenize(doc, stemming=stemming, stoplist=stoplist, remove_digits=remove_digits)).collect()
    sc.stop()
    return tokenized_docs


def read_files(input_folder):
    texts = []
    fnames = []
    for filename in tqdm(os.listdir(input_folder)):
        if filename.startswith('.') or os.path.isdir(os.path.join(input_folder, filename)):
            continue
        with open(os.path.join(input_folder, filename), 'r', encoding='utf-8', errors='ignore') as f:  # Reading file
            texts.append(f.read())
            filename = filename.split(r'.txt')[0]  # remove file extension when present
            fnames.append(filename)
    return texts, fnames


def print_query_data_file(output_path, q_names, tokenized_queries):
    out = open(output_path, 'w')
    for i in range(len(tokenized_queries)):
        q_name = q_names[i]
        q_name = q_name.replace('OHSU', '')
        if '-TEST' in q_name:
            q_name = q_name.replace('-TEST', '')
            q_name = q_name + '000'

        terms = '\t'.join(tokenized_queries[i])
        terms = terms.strip()
        line = q_name + '\t' + terms + '\n'
        out.write(line)
    out.close()


def load_sw(spath):
    retval = []
    for line in open(spath):
        retval.append(line.strip())
    return retval


def compute_docs_contents(tokenized_docs):
    os.environ['PYSPARK_PYTHON'] = OS_PYTHON
    conf = SparkConf().setMaster('local[*]').set('spark.driver.memory', '25g').set('spark.driver.maxResultSize', '15g') \
        .set('spark.executor.memory', '25g')
    sc = SparkContext(conf=conf)
    doc_contents = sc.parallelize(tokenized_docs).map(lambda doc: compute_d_contents(doc)).collect()
    sc.stop()
    return doc_contents


def compute_d_contents(tokenized_doc):
    distinct_words = set(tokenized_doc)
    doc_content = []
    for w in distinct_words:
        doc_content.append((w, tokenized_doc.count(w)))
    return doc_content


def build_inv_index(docs):
    inverted_idx = {}
    for doc_id in tqdm(range(len(docs))):
        d = docs[doc_id]
        set_w_in_doc = set(d)
        for w in set_w_in_doc:
            if w in inverted_idx.keys():
                inverted_idx[w].append((doc_id, d.count(w)))
            else:
                inverted_idx[w] = [(doc_id, d.count(w))]
    return inverted_idx


def compute_idf(inv_idx, doc_n):
    words = sorted(list(inv_idx.keys()))
    d_freqs = {}
    c_freqs = {}
    for k in tqdm(words):
        v = inv_idx[k]
        df = len(v)
        d_freqs[k] = df
        c_freqs[k] = sum([c[1] for c in v])

    idf_scores = {}
    for w in words:
        idf_scores[w] = np.log((1 + doc_n) / (d_freqs[w] + 1))

    return idf_scores, d_freqs, c_freqs


def compute_collection_docset_term_stats(docs_main_folder, document_texts=None, d_names=None):
    if document_texts is None:
        document_texts, d_names = read_files(docs_main_folder)
    tokenized_docs = tokenize_collection(document_texts, stemming=True, stoplist=[])
    d_contents = compute_docs_contents(tokenized_docs)
    d_lengths = [len(d) for d in tokenized_docs]

    ii = build_inv_index(tokenized_docs)
    idf_scores, d_freqs, c_freqs = compute_idf(ii, len(tokenized_docs))

    return d_names, d_lengths, d_contents, idf_scores, d_freqs, c_freqs, tokenized_docs


def print_collection_in_w2v_format(output_path, tokenized_docs):
    out = open(output_path, 'w')
    for d in tokenized_docs:
        line = ' '.join(d)
        line = line.strip()
        out.write(line + '\n')
    out.close()


def print_docset_file(output_path, d_names, d_lengths, d_contents):
    out = open(output_path, 'w')
    for i in tqdm(range(len(d_names))):
        name = d_names[i]
        length = d_lengths[i]
        content = ''
        for c in d_contents[i]:
            word = c[0]
            cnt = c[1]
            content += word + ':' + str(cnt) + ' '
        content = content.strip()
        line = name + '\t' + str(length) + '\t' + content + '\n'
        out.write(line)
    out.close()


def print_df_cf_file(output_path, dfs, cfs):
    out = open(output_path, 'w')
    keys = dfs.keys()
    for k in keys:
        line = k + '\t' + str(dfs[k]) + '\t' + str(cfs[k]) + '\n'
        out.write(line)
    out.close()


def run():
    collection = 'cranfield'

    models_folder = collection + '/'
    docset_path = models_folder + collection + '.docset.txt'
    dfs_cfs_path = models_folder + collection + '.df.cf.txt'
    query_data_path_title = models_folder + collection + '.title.krovetz.txt'
    collection_w2v_format = models_folder + collection + '.w2v.input.txt'
    queries_idcg_path = models_folder + collection + '.queries.idcg.txt'

    run_to_rerank_path_title = ''
    qrels_file_path = 'data/processed_corpus/cranfield_space_sep.qrel'
    queries_main_folder_title = 'data/processed_corpus/topics'
    docs_main_folder = 'data/processed_corpus/corpus'
    sw_path = 'data/indri_stoplist_eng.txt'

    compute_folds(run_to_rerank_path_title, qrels_file_path)
    print_idcg(qrels_file_path, queries_idcg_path)
    queries_text, q_names = read_files(queries_main_folder_title)
    tokenized_queries_title = tokenize_collection(queries_text, stemming=True, stoplist=[])
    print_query_data_file(query_data_path_title, q_names, tokenized_queries_title)

    document_texts, d_names = read_files(docs_main_folder)
    tokenized_docs_filtered = tokenize_collection(document_texts, stemming=True, stoplist=load_sw(sw_path),
                                                  remove_digits=True)

    d_names, d_lengths, d_contents, idf_scores, d_freqs, c_freqs, tokenized_docs = \
        compute_collection_docset_term_stats(docs_main_folder, document_texts, d_names)

    print_collection_in_w2v_format(collection_w2v_format + '_filtered', tokenized_docs_filtered)
    print_docset_file(docset_path, d_names, d_lengths, d_contents)
    print_df_cf_file(dfs_cfs_path, d_freqs, c_freqs)


if __name__ == '__main__':
    run()
