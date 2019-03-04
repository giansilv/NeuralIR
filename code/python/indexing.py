import glob
import os
import re
import xml.etree.ElementTree as ETree

from tqdm import tqdm
from whoosh import index
from whoosh.analysis import StandardAnalyzer
from whoosh.fields import *
from whoosh.formats import Positions


def set_schema(stopwords_path=None):
    """define schema to index collection"""
    if stopwords_path:
        # use custom stop list
        with open(stopwords_path, 'r') as f:
            stop_words = [stop.strip() for stop in f]
        # standard analyzer: regex tokenizer, lowercase filter, stopwords removal
        analyzer = StandardAnalyzer(stoplist=stop_words)  # minsize: minimum token size to be indexed (default: 2)
    else:
        # use whoosh default stop list
        analyzer = StandardAnalyzer()  # minsize: minimum token size to be indexed (default: 2)
    # create schema
    schema = Schema(docno=ID(stored=True), text=TEXT(analyzer, vector=Positions()))
    return schema


def indexing(corpus_path, index_path, schema, corpus_name):
    """create index for given corpus"""
    if not os.path.exists(index_path):
        print('creating index folder')
        os.mkdir(index_path)
    if index.exists_in(index_path):
        print('index exists - clearing previous index')  # @smarchesin: TODO modify to make it an interactive choice
    # create index
    ix = index.create_in(index_path, schema)
    # create index writer
    writer = ix.writer()
    # load corpus
    print('loading corpus')
    if 'clef' in corpus_name:  # get corpus as in clef format
        corpus = get_clef_corpus(corpus_path)
    elif 'wt2g' in corpus_name:  # get corpus as wt2g format
        corpus = get_wt2g_corpus(corpus_path)
        # regex to find DOCNO tag
        docno_tag = re.compile(r'<DOCNO>(.*?)</DOCNO>')
        # regex to remove all tags from text
        clean_tags = re.compile(r'<.*?>')
    else:  # get corpus as in trec format
        corpus = get_trec_corpus(corpus_path)
    # loop over documents in corpus
    print('adding docs to index')
    for docs in tqdm(corpus):
        if 'wt2g' in corpus_name:  # inconsistent html/trec-style docs require different parsing
            # split docs by <DOC> tags
            docs = docs.split('</DOC>')[:-1]
            # loop through each document
            for doc in tqdm(docs):
                # get docno 
                docno = u'' + re.findall(docno_tag, doc)[0].strip()
                # get text without tags
                text = u'' + re.sub(clean_tags, '', doc)
                # add doc to index
                writer.add_document(docno=docno, text=text)
        else:
            # parse xml doc structure
            root = ETree.fromstring(docs)
            # loop through each document
            for doc in tqdm(root):
                text = u''
                docno = u''
                # loop through each element (tag, value)
                for elem in doc:
                    if elem.tag == 'DOCNO':
                        # store doc id
                        docno += elem.text.strip()
                    # check if elem has children
                    if len(elem) == 0:  # elem does not contain children
                        if elem.text:
                            text += elem.text.strip() + ' '
                    else:  # elem does contain children
                        text += get_text_recursively(elem, text)
                # add doc to index
                writer.add_document(docno=docno, text=text)
    # commit documents
    print('committing docs to index')
    writer.commit()
    print('indexing finished')
    return True


def get_trec_corpus(corpus_path):
    """convert trec style corpus into valid xml"""
    corpus = list()
    docs_path = glob.glob(corpus_path + '/**/*.txt', recursive=True)
    for path in tqdm(docs_path):
        with open(path, 'r', encoding='utf-8', errors='ignore') as f:  # read file
            xml = f.read()
        # convert into true xml
        xml = '<ROOT>' + xml + '</ROOT>'
        # fix not well-formed tokens
        xml = xml.replace('&', '&amp;')
        # required for Robust04 - FBIS 
        xml = re.sub(r"<F P=\d+>", "F", xml)
        xml = re.sub(r"</F>", "F", xml)
        xml = re.sub(r"<FIG.*?>", "FIG", xml)
        xml = re.sub(r"</FIG>", "FIG", xml)
        xml = re.sub(r"<3>", "3", xml)
        xml = re.sub(r"</3>", "3", xml)
        corpus.append(xml)
    return corpus


def get_clef_corpus(corpus_path):
    """read clef style corpus"""
    corpus = list()
    docs_path = glob.glob(corpus_path + '/**/*.xml', recursive=True)
    for path in tqdm(docs_path):
        with open(path, 'r', encoding='utf-8', errors='ignore') as f:  # read file
            xml = f.read()
        # convert into true xml
        xml = '<ROOT>' + xml + '</ROOT>'
        corpus.append(xml)
    return corpus
 

def get_wt2g_corpus(corpus_path):
    """read wt2g corpus"""
    corpus = list()
    docs_path = glob.glob(corpus_path + '/**/B*', recursive=True)
    for path in tqdm(docs_path):
        with open(path, 'r', encoding='utf-8', errors='ignore') as f:  # read file
            html = f.read()
        corpus.append(html)
    return corpus

def get_text_recursively(root, text):
    """recursively iterate over xml element tree"""
    for elem in root:
        if len(elem) == 0:  # elem does not contain children
            if elem.text:
                text += elem.text.strip() + ' '
        else:  # element does contain children
            # recursively obtain children contents
            text = get_text_recursively(elem, text)
    return text


def main(data_folder, index_folder, corpus_name, stoplist_path=None):
    os.chdir(os.path.dirname(os.path.realpath('__file__')))
    # set schema
    schema = set_schema(stoplist_path)
    # index collection
    indexing(data_folder, index_folder, schema, corpus_name)
    return True
