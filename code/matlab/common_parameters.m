%% common_parameters
% 
% Sets up parameters common to the different scripts.
%
%% Information
% 
% * *Author*: <mailto:silvello@dei.unipd.it Gianmaria Silvello>
% * *Version*: 1.00
% * *Since*: 1.00
% * *Requirements*: MATTERS 1.0 or higher; Matlab 2013b or higher
% * *Copyright:* (C) 2019 <http://ims.dei.unipd.it/ Information 
% Management Systems> (IMS) research group, <http://www.dei.unipd.it/ 
% Department of Information Engineering> (DEI), <http://www.unipd.it/ 
% University of Padua>, Italy
% * *License:* <http://www.apache.org/licenses/LICENSE-2.0 Apache License, 
% Version 2.0>

%%
%{
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
      http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
%}

diary off;

%% General configuration

% if we are running on the cluster 
if (strcmpi(computer, 'GLNXA64'))
    addpath('/data/silvello/matters/core/')
    addpath('/data/silvello/matters/core/analysis/')
    addpath('/data/silvello/matters/core/io/')
    addpath('/data/silvello/matters/core/measure/')
    addpath('/data/silvello/matters/core/plot/')
    addpath('/data/silvello/matters/core/util/')
end;


DATA.path.base = '/Users/silvello/Dropbox/Papers/2019/IPM2019-MPS/data/';
EXPERIMENT.path.base =  DATA.path.base;
COLLECTIONS.path.base =  DATA.path.base;

COLLECTIONS.path.runSet =  sprintf('%1$s%2$s%3$s', EXPERIMENT.path.base, ...
    'runSets', filesep);

COLLECTIONS.path.pool =  sprintf('%1$s%2$s%3$s', EXPERIMENT.path.base, ...
    'poolFiles', filesep);

COLLECTIONS.path.measureSetDir =  sprintf('%1$s%2$s%3$s', EXPERIMENT.path.base, ...
    'measureSet', filesep);

% Label of the paper this experiment is for
EXPERIMENT.label.paper = 'IPM 2019 MPS';

% path of the runs
EXPERIMENT.path.runs = sprintf('%1$s%2$s%3$s', EXPERIMENT.path.base, 'runs', filesep);

EXPERIMENT.matlab.runsets = '/Users/silvello/Dropbox/Papers/2019/IPM2019-MPS/data/matlab/runSet/';
EXPERIMENT.matlab.pools = '/Users/silvello/Dropbox/Papers/2019/IPM2019-MPS/data/matlab/pools/';
EXPERIMENT.matlab.measures = '/Users/silvello/Dropbox/Papers/2019/IPM2019-MPS/data/matlab/measureSet/';

%% configuration of collections

COLLECTION.Table4_AP8889.id = 'Table4_AP8889';
COLLECTION.Table4_AP8889.runSetId = 'runSet_Table4_AP8889';
COLLECTION.Table4_AP8889.color = rgb('GreenYellow');
COLLECTION.Table4_AP8889.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.Table4_AP8889.RelevanceGrades = 0:1;
COLLECTION.Table4_AP8889.poolFile = 'AP8889'; 

COLLECTION.Table4_FT.id = 'Table4_FT';
COLLECTION.Table4_FT.runSetId = 'runSet_Table4_FT';
COLLECTION.Table4_FT.color = rgb('GreenYellow');
COLLECTION.Table4_FT.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.Table4_FT.RelevanceGrades = 0:1;
COLLECTION.Table4_FT.poolFile = 'FT';

COLLECTION.Table4_LA.id = 'Table4_LA';
COLLECTION.Table4_LA.runSetId = 'runSet_Table4_LA';
COLLECTION.Table4_LA.color = rgb('GreenYellow');
COLLECTION.Table4_LA.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.Table4_LA.RelevanceGrades = 0:1;
COLLECTION.Table4_LA.poolFile = 'LA';

COLLECTION.Table4_Robust04.id = 'Table4_Robust04';
COLLECTION.Table4_Robust04.runSetId = 'runSet_Table4_Robust04';
COLLECTION.Table4_Robust04.color = rgb('GreenYellow');
COLLECTION.Table4_Robust04.RelevanceDegrees = {'NotRelevant', 'Relevant', 'HighlyRelevant'};
COLLECTION.Table4_Robust04.RelevanceGrades = 0:2;
COLLECTION.Table4_Robust04.poolFile = 'Robust04';

COLLECTION.Table4_WSJ.id = 'Table4_WSJ';
COLLECTION.Table4_WSJ.runSetId = 'runSet_Table4_WSJ';
COLLECTION.Table4_WSJ.color = rgb('GreenYellow');
COLLECTION.Table4_WSJ.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.Table4_WSJ.RelevanceGrades = 0:1;
COLLECTION.Table4_WSJ.poolFile = 'WSJ';

COLLECTION.Table5_AP8889.id = 'Table6_AP8889';
COLLECTION.Table5_AP8889.runSetId = 'runSet_Table6_AP8889';
COLLECTION.Table5_AP8889.color = rgb('GreenYellow');
COLLECTION.Table5_AP8889.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.Table5_AP8889.RelevanceGrades = 0:1;
COLLECTION.Table5_AP8889.poolFile = 'AP8889'; 

COLLECTION.Table5_FT.id = 'Table6_FT';
COLLECTION.Table5_FT.runSetId = 'runSet_Table6_FT';
COLLECTION.Table5_FT.color = rgb('GreenYellow');
COLLECTION.Table5_FT.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.Table5_FT.RelevanceGrades = 0:1;
COLLECTION.Table5_FT.poolFile = 'FT';

COLLECTION.Table5_LA.id = 'Table6_LA';
COLLECTION.Table5_LA.runSetId = 'runSet_Table6_LA';
COLLECTION.Table5_LA.color = rgb('GreenYellow');
COLLECTION.Table5_LA.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.Table5_LA.RelevanceGrades = 0:1;
COLLECTION.Table5_LA.poolFile = 'LA';

COLLECTION.Table5_Robust04.id = 'Table6_Robust04';
COLLECTION.Table5_Robust04.runSetId = 'runSet_Table6_Robust04';
COLLECTION.Table5_Robust04.color = rgb('GreenYellow');
COLLECTION.Table5_Robust04.RelevanceDegrees = {'NotRelevant', 'Relevant', 'HighlyRelevant'};
COLLECTION.Table5_Robust04.RelevanceGrades = 0:2;
COLLECTION.Table5_Robust04.poolFile = 'Robust04';

COLLECTION.Table5_WSJ.id = 'Table6_WSJ';
COLLECTION.Table5_WSJ.runSetId = 'runSet_Table6_WSJ';
COLLECTION.Table5_WSJ.color = rgb('GreenYellow');
COLLECTION.Table5_WSJ.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.Table5_WSJ.RelevanceGrades = 0:1;
COLLECTION.Table5_WSJ.poolFile = 'WSJ';

COLLECTION.Table8_CLEF_DE.id = 'Table9_CLEF_DE';
COLLECTION.Table8_CLEF_DE.runSetId = 'runSet_Table9_CLEF_DE';
COLLECTION.Table8_CLEF_DE.color = rgb('GreenYellow');
COLLECTION.Table8_CLEF_DE.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.Table8_CLEF_DE.RelevanceGrades = 0:1;
COLLECTION.Table8_CLEF_DE.poolFile = 'CLEF_DE';

COLLECTION.Table8_CLEF_IT.id = 'Table9_CLEF_IT';
COLLECTION.Table8_CLEF_IT.runSetId = 'runSet_Table9_CLEF_IT';
COLLECTION.Table8_CLEF_IT.color = rgb('GreenYellow');
COLLECTION.Table8_CLEF_IT.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.Table8_CLEF_IT.RelevanceGrades = 0:1;
COLLECTION.Table8_CLEF_IT.poolFile = 'CLEF_IT';

COLLECTION.Table8_CLEF_FA.id = 'Table9_CLEF_FA';
COLLECTION.Table8_CLEF_FA.runSetId = 'runSet_Table9_CLEF_FA';
COLLECTION.Table8_CLEF_FA.color = rgb('GreenYellow');
COLLECTION.Table8_CLEF_FA.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.Table8_CLEF_FA.RelevanceGrades = 0:1;
COLLECTION.Table8_CLEF_FA.poolFile = 'CLEF_FA';

COLLECTION.Table8_OSHUMED.id = 'Table8_OSHUMED';
COLLECTION.Table8_OSHUMED.runSetId = 'runSet_Table8_OSHUMED';
COLLECTION.Table8_OSHUMED.color = rgb('GreenYellow');
COLLECTION.Table8_OSHUMED.RelevanceDegrees = {'NotRelevant', 'Relevant', 'HighlyRelevant'};
COLLECTION.Table8_OSHUMED.RelevanceGrades = 0:2;
COLLECTION.Table8_OSHUMED.poolFile = 'OSHUMED';

COLLECTION.Table8_WT2G.id = 'Table8_WT2G';
COLLECTION.Table8_WT2G.runSetId = 'runSet_Table8_WT2G';
COLLECTION.Table8_WT2G.color = rgb('GreenYellow');
COLLECTION.Table8_WT2G.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.Table8_WT2G.RelevanceGrades = 0:1;
COLLECTION.Table8_WT2G.poolFile = 'WT2G';

COLLECTION.Table4_NY.id = 'Table4_NY';
COLLECTION.Table4_NY.runSetId = 'runSet_Table4_NY';
COLLECTION.Table4_NY.color = rgb('GreenYellow');
COLLECTION.Table4_NY.RelevanceDegrees = {'NotRelevant', 'Relevant', 'HighlyRelevant'};
COLLECTION.Table4_NY.RelevanceGrades = 0:2;
COLLECTION.Table4_NY.poolFile = 'NY';

COLLECTION.Table5_NY.id = 'Table6_NY';
COLLECTION.Table5_NY.runSetId = 'runSet_Table6_NY';
COLLECTION.Table5_NY.color = rgb('GreenYellow');
COLLECTION.Table5_NY.RelevanceDegrees = {'NotRelevant', 'Relevant', 'HighlyRelevant'};
COLLECTION.Table5_NY.RelevanceGrades = 0:2;
COLLECTION.Table5_NY.poolFile = 'NY';

COLLECTIONS.path.runs = @(collectionID) sprintf('%1$s%2$s%3$s%4$s%5$s', EXPERIMENT.path.base, 'runSets', filesep, COLLECTION.(collectionID).id, filesep);

COLLECTIONS.path.qrels = @(collectionID) sprintf('%1$s%2$s%3$s%4$s%5$s', COLLECTIONS.path.base, 'poolFiles', filesep, COLLECTION.(collectionID).poolFile, '.qrel');

COLLECTIONS.path.runSetDir = @(collectionID) sprintf('%1$s', EXPERIMENT.matlab.runsets);

COLLECTIONS.path.poolDir = @(collectionID) sprintf('%1$s', EXPERIMENT.matlab.pools);

COLLECTIONS.path.runSet = @(collectionID) sprintf('%1$s%2$s%3$s%4$s', EXPERIMENT.matlab.runsets, filesep, COLLECTION.(collectionID).id, '.mat');

COLLECTIONS.path.pool = @(collectionID) sprintf('%1$s%2$s%3$s%4$s', EXPERIMENT.matlab.pools, filesep, COLLECTION.(collectionID).id, '.mat');

COLLECTIONS.identifiers.pool = @(collectionID)  sprintf('%1$s%2$s', 'pool_', COLLECTION.(collectionID).poolFile);

COLLECTIONS.identifiers.measureId = @(collectionID, measureShortName)  sprintf('%1$s%2$s%3$s', measureShortName, '_', collectionID);

COLLECTIONS.path.measureSet = @(collectionID, measureShortName) sprintf('%1$s%2$s%3$s%4$s', EXPERIMENT.matlab.measures,  filesep, COLLECTIONS.identifiers.measureId(collectionID, measureShortName), '.mat');

COLLECTIONS.path.measureSetDir = @(collectionID) sprintf('%1$s', EXPERIMENT.matlab.measures);


%% COMMANDS
% import a pool from file
EXPERIMENT.command.importPool = @(collectionID) importPoolFromFileTRECFormat('FileName', COLLECTIONS.path.qrels(collectionID), 'Identifier', COLLECTIONS.identifiers.pool(collectionID), 'RelevanceDegrees', COLLECTION.(collectionID).RelevanceDegrees, 'RelevanceGrades', COLLECTION.(collectionID).RelevanceGrades, 'Delimiter', 'tab',  'Verbose', false);

% import a runSet from a directory containing the run files as text files
EXPERIMENT.command.importRunSet = @(collectionID) importRunsFromDirectoryTRECFormat('Path', COLLECTIONS.path.runs(collectionID), 'Identifier', COLLECTION.(collectionID).runSetId, 'DocumentOrdering', 'TrecEvalLexDesc', 'SinglePrecision', true, 'Verbose', false, 'Delimiter', 'space');

% save a measureSet in the right path
EXPERIMENT.command.saveMeasureSet = @(collectionID, measureShortName) sersave(COLLECTIONS.path.measureSet(collectionID, measureShortName), COLLECTIONS.identifiers.measureId(collectionID, measureShortName));

% load a pool 
EXPERIMENT.command.loadPool = @(collectionID) serload(COLLECTIONS.path.pool(collectionID));

% load a runset 
EXPERIMENT.command.loadRunSet = @(collectionID) serload(COLLECTIONS.path.runSet(collectionID));

% load a measureSet 
EXPERIMENT.command.loadMeasureSet = @(collectionID, measureShortName) serload(COLLECTIONS.path.measureSet(collectionID, measureShortName));

%% Configuration for measures


EXPERIMENT.measure.ap.shortName = 'ap';
EXPERIMENT.measure.ap.name = 'AP';
EXPERIMENT.measure.ap.fullName = 'Average Precision (AP)';
EXPERIMENT.measure.ap.command = @(pool, runSet, shortNameSuffix) averagePrecision(pool, runSet, 'ShortNameSuffix', shortNameSuffix);

EXPERIMENT.measure.p10.shortName = 'p10';
EXPERIMENT.measure.p10.name = 'P10';
EXPERIMENT.measure.p10.fullName = 'Precision@10';
EXPERIMENT.measure.p10.cutoffs = 10;
EXPERIMENT.measure.p10.command = @(pool, runSet, shortNameSuffix) precision(pool, runSet, 'ShortNameSuffix', shortNameSuffix, 'CutOffs', EXPERIMENT.measure.p10.cutoffs);

EXPERIMENT.measure.ndcg.shortName = 'ndcg';
EXPERIMENT.measure.ndcg.name = 'nDCG';
EXPERIMENT.measure.ndcg.fullName = 'Normalized Discounted Cumulated Gain (nDCG)';
EXPERIMENT.measure.ndcg.cutoffs = 100;
EXPERIMENT.measure.ndcg.command = @(pool, runSet, shortNameSuffix) discountedCumulatedGain(pool, runSet, 'ShortNameSuffix', shortNameSuffix, 'CutOffs', EXPERIMENT.measure.ndcg.cutoffs, 'Normalize', true, 'FixNumberRetrievedDocuments', 1000, 'FixedNumberRetrievedDocumentsPaddingStrategy', 'NotRelevant');
