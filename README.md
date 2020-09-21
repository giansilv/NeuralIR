# NeuralIR
## Content

Content of the directories:
- **code**: this folder contains the Matlab code for running the analyses and reproducing the experimental evaluation. It requires the [MATTERS library](http://matters.dei.unipd.it/). This folder also contains the source code of NVSM (Python) and DRMM (Python).
- **data**: the runs, pools and measure files produced by the experimental evaluation (Matlab) and all the plots used in the paper. 
- **figure**:  the plots used in the paper (pdf + Omnigraffle sources and .mat figures). 
- **DRMM_repro**: contains the code to prepare the input for DRMM algorithm. 

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

DRMM: 

The code to compute the input data for DRMM algorithm is contained in the DRMM_repro directory. It can be run on the included data (cranfield collection) in the DRMM_repro/data directory after extracting to the same folder the data in the processed_corpus.zip archive.


## Reference
1. Stefano Marchesin, Alberto Purpura, Gianmaria Silvllo: Focal Elements of Neural Information Retrieval Models. An Outlook through a Reproducibility Study. IP&M 2019. In press (https://doi.org/10.1016/j.ipm.2019.102109) 
2. Christophe Van Gysel, Maarten de Rijke, Evangelos Kanoulas: Neural Vector Spaces for Unsupervised Information Retrieval. ACM Trans. Inf. Syst. 36(4): 38:1-38:25 (2018). (https://dl.acm.org/citation.cfm?doid=3211967.3196826)
3. Jiafeng Guo, Yixing Fan, Qingyao Ai, W. Bruce Croft: A Deep Relevance Matching Model for Ad-hoc Retrieval. CIKM 2016: 55-64. (https://dl.acm.org/citation.cfm?doid=2983323.2983769)
