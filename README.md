# NeuralIR
## Content

Content of the directories:
- **code**: this folder contains the Matlab code for running the analyses and reproducing the experimental evaluation. It requires the [MATTERS library](http://matters.dei.unipd.it/). This folder also contains the source code of NVSM (Python) and DRMM (Python).
- **data**: the runs, pools and measure files produced by the experimental evaluation (Matlab) and all the plots used in the paper. 

NVSM and DRMM source code and settings


NVSM: 

NVSM requires the following directory tree with the following folder names (example with Robust04 collection): 
	- root: nvsm.py, nvsm_ny.py, indexing.py, utils.py, utils_ny.py, indri_stopwords.txt, stoplist-##.txt
		- corpus: robust04
			- robust04: robust04, splits, queries, qrels 
				- robust04: contains document collection
				- splits: contains validation.txt and test.txt - which refer to queries ids used for validation and test, respectively
				- queries: contains queries for target collection
				- qrels: contains qrels for target collection

		- trec_eval: folder containing trec_eval from NIST TREC
