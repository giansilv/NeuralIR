% Table 4 MAP
map_table4_AP8889 = mean(ap_Table4_AP8889{:,:});
map_table4_AP8889 = array2table(map_table4_AP8889);
map_table4_AP8889.Properties.VariableNames = {'QLM', 'NVSM', 'W2V', 'W2Vsi'};

h_001_map_table4_AP8889 = ttest(ap_Table4_AP8889{:,4}, ap_Table4_AP8889{:,2}, 'Tail', 'both', 'Alpha', 0.01);
h_005_map_table4_AP8889 = ttest(ap_Table4_AP8889{:,4}, ap_Table4_AP8889{:,2}, 'Tail', 'both', 'Alpha', 0.05);
h_01_map_table4_AP8889 = ttest(ap_Table4_AP8889{:,4}, ap_Table4_AP8889{:,2}, 'Tail', 'both', 'Alpha', 0.1);

[p_map_table4_AP8889] = anova1(ap_Table4_AP8889{:,:});

map_table4_FT = mean(ap_Table4_FT{:,:});
map_table4_FT = array2table(map_table4_FT);
map_table4_FT.Properties.VariableNames = {'QLM', 'NVSM', 'W2V', 'W2Vsi'};

h_001_map_table4_FT = ttest(ap_Table4_FT{:,4}, ap_Table4_FT{:,2}, 'Tail', 'both', 'Alpha', 0.01);
h_005_map_table4_FT = ttest(ap_Table4_FT{:,4}, ap_Table4_FT{:,2}, 'Tail', 'both', 'Alpha', 0.05);
h_01_map_table4_FT = ttest(ap_Table4_FT{:,4}, ap_Table4_FT{:,2}, 'Tail', 'both', 'Alpha', 0.1);

[p_map_table4_FT] = anova1(ap_Table4_FT{:,:});

map_table4_LA = mean(ap_Table4_LA{:,:});
map_table4_LA = array2table(map_table4_LA);
map_table4_LA.Properties.VariableNames = {'QLM', 'NVSM', 'W2V', 'W2Vsi'};

h_001_map_table4_LA = ttest(ap_Table4_LA{:,4}, ap_Table4_LA{:,2}, 'Tail', 'both', 'Alpha', 0.01);
h_005_map_table4_LA = ttest(ap_Table4_LA{:,4}, ap_Table4_LA{:,2}, 'Tail', 'both', 'Alpha', 0.05);
h_01_map_table4_LA = ttest(ap_Table4_LA{:,4}, ap_Table4_LA{:,2}, 'Tail', 'both', 'Alpha', 0.1);

[p_map_table4_LA] = anova1(ap_Table4_LA{:,:});

map_table4_Robust04 = mean(ap_Table4_Robust04{:,:});
map_table4_Robust04 = array2table(map_table4_Robust04);
map_table4_Robust04.Properties.VariableNames = {'NVSM', 'QLM', 'W2V', 'W2Vsi'};

h_001_map_table4_Robust04 = ttest(ap_Table4_Robust04{:,1}, ap_Table4_Robust04{:,4}, 'Tail', 'both', 'Alpha', 0.01);
h_005_map_table4_Robust04 = ttest(ap_Table4_Robust04{:,1}, ap_Table4_Robust04{:,4}, 'Tail', 'both', 'Alpha', 0.05);
h_01_map_table4_Robust04 = ttest(ap_Table4_Robust04{:,1}, ap_Table4_Robust04{:,4}, 'Tail', 'both', 'Alpha', 0.1);

[p_map_table4_Robust04] = anova1(ap_Table4_Robust04{:,:});

map_table4_WSJ = mean(ap_Table4_WSJ{:,:});
map_table4_WSJ = array2table(map_table4_WSJ);
map_table4_WSJ.Properties.VariableNames = {'NVSM', 'W2V', 'W2Vsi', 'QLM'};

h_001_map_table4_WSJ = ttest(ap_Table4_WSJ{:,1}, ap_Table4_WSJ{:,3}, 'Tail', 'both', 'Alpha', 0.01);
h_005_map_table4_WSJ = ttest(ap_Table4_WSJ{:,1}, ap_Table4_WSJ{:,3}, 'Tail', 'both', 'Alpha', 0.05);
h_01_map_table4_WSJ = ttest(ap_Table4_WSJ{:,1}, ap_Table4_WSJ{:,3}, 'Tail', 'both', 'Alpha', 0.1);

[p_map_table4_WSJ] = anova1(ap_Table4_WSJ{:,:});

map_table4_NY= mean(ap_Table4_NY{:,:});
map_table4_NY = array2table(map_table4_NY);
map_table4_NY.Properties.VariableNames = {'NVSM', 'QLM', 'W2V', 'W2Vsi'};

h_001_map_table4_NY = ttest(ap_Table4_NY{:,1}, ap_Table4_NY{:,4}, 'Tail', 'both', 'Alpha', 0.01);
h_005_map_table4_NY = ttest(ap_Table4_NY{:,1}, ap_Table4_NY{:,4}, 'Tail', 'both', 'Alpha', 0.05);
h_01_map_table4_NY = ttest(ap_Table4_NY{:,1}, ap_Table4_NY{:,4}, 'Tail', 'both', 'Alpha', 0.1);

% Table 4 nDCG

mndcg_table4_NY= mean(ndcg_Table4_NY{:,:});
mndcg_table4_NY = array2table(mndcg_table4_NY);
mndcg_table4_NY.Properties.VariableNames = {'NVSM', 'QLM', 'W2V', 'W2Vsi'};

h_001_mndcg_table4_NY = ttest(ndcg_Table4_NY{:,1}, ndcg_Table4_NY{:,4}, 'Tail', 'both', 'Alpha', 0.01);
h_005_mndcg_table4_NY = ttest(ndcg_Table4_NY{:,1}, ndcg_Table4_NY{:,4}, 'Tail', 'both', 'Alpha', 0.05);
h_01_mndcg_table4_NY = ttest(ndcg_Table4_NY{:,1}, ndcg_Table4_NY{:,4}, 'Tail', 'both', 'Alpha', 0.1);

mndcg_table4_AP8889 = mean(ndcg_Table4_AP8889{:,:});
mndcg_table4_AP8889 = array2table(mndcg_table4_AP8889);
mndcg_table4_AP8889.Properties.VariableNames = {'QLM', 'NVSM', 'W2V', 'W2Vsi'};

h_001_mndcg_table4_AP8889 = ttest(ndcg_Table4_AP8889{:,4}, ndcg_Table4_AP8889{:,2}, 'Tail', 'both', 'Alpha', 0.01);
h_005_mndcg_table4_AP8889 = ttest(ndcg_Table4_AP8889{:,4}, ndcg_Table4_AP8889{:,2}, 'Tail', 'both', 'Alpha', 0.05);
h_01_mndcg_table4_AP8889 = ttest(ndcg_Table4_AP8889{:,4}, ndcg_Table4_AP8889{:,2}, 'Tail', 'both', 'Alpha', 0.1);

[p_mndcg_table4_AP8889] = anova1(ndcg_Table4_AP8889{:,:});

mndcg_table4_FT = mean(ndcg_Table4_FT{:,:});
mndcg_table4_FT = array2table(mndcg_table4_FT);
mndcg_table4_FT.Properties.VariableNames = {'QLM', 'NVSM', 'W2V', 'W2Vsi'};

h_001_mndcg_table4_FT = ttest(ndcg_Table4_FT{:,4}, ndcg_Table4_FT{:,2}, 'Tail', 'both', 'Alpha', 0.01);
h_005_mndcg_table4_FT = ttest(ndcg_Table4_FT{:,4}, ndcg_Table4_FT{:,2}, 'Tail', 'both', 'Alpha', 0.05);
h_01_mndcg_table4_FT = ttest(ndcg_Table4_FT{:,4}, ndcg_Table4_FT{:,2}, 'Tail', 'both', 'Alpha', 0.1);

[p_mndcg_table4_FT] = anova1(ndcg_Table4_FT{:,:});

mndcg_table4_LA = mean(ndcg_Table4_LA{:,:});
mndcg_table4_LA = array2table(mndcg_table4_LA);
mndcg_table4_LA.Properties.VariableNames = {'QLM', 'NVSM', 'W2V', 'W2Vsi'};

h_001_mndcg_table4_LA = ttest(ndcg_Table4_LA{:,4}, ndcg_Table4_LA{:,2}, 'Tail', 'both', 'Alpha', 0.01);
h_005_mndcg_table4_LA = ttest(ndcg_Table4_LA{:,4}, ndcg_Table4_LA{:,2}, 'Tail', 'both', 'Alpha', 0.05);
h_01_mndcg_table4_LA = ttest(ndcg_Table4_LA{:,4}, ndcg_Table4_LA{:,2}, 'Tail', 'both', 'Alpha', 0.1);

[p_mndcg_table4_LA] = anova1(ndcg_Table4_LA{:,:});

mndcg_table4_Robust04 = mean(ndcg_Table4_Robust04{:,:});
mndcg_table4_Robust04 = array2table(mndcg_table4_Robust04);
mndcg_table4_Robust04.Properties.VariableNames = {'NVSM', 'QLM', 'W2V', 'W2Vsi'};

h_001_mndcg_table4_Robust04 = ttest(ndcg_Table4_Robust04{:,4}, ndcg_Table4_Robust04{:,1}, 'Tail', 'both', 'Alpha', 0.01);
h_005_mndcg_table4_Robust04 = ttest(ndcg_Table4_Robust04{:,4}, ndcg_Table4_Robust04{:,1}, 'Tail', 'both', 'Alpha', 0.05);
h_01_mndcg_table4_Robust04 = ttest(ndcg_Table4_Robust04{:,4}, ndcg_Table4_Robust04{:,1}, 'Tail', 'both', 'Alpha', 0.1);

[p_mndcg_table4_Robust04] = anova1(ndcg_Table4_Robust04{:,:});

mndcg_table4_WSJ = mean(ndcg_Table4_WSJ{:,:});
mndcg_table4_WSJ = array2table(mndcg_table4_WSJ);
mndcg_table4_WSJ.Properties.VariableNames = {'NVSM', 'W2V', 'W2Vsi', 'QLM'};

h_001_mndcg_table4_WSJ = ttest(ndcg_Table4_WSJ{:,1}, ndcg_Table4_WSJ{:,3}, 'Tail', 'both', 'Alpha', 0.01);
h_005_mndcg_table4_WSJ = ttest(ndcg_Table4_WSJ{:,1}, ndcg_Table4_WSJ{:,3}, 'Tail', 'both', 'Alpha', 0.05);
h_01_mndcg_table4_WSJ = ttest(ndcg_Table4_WSJ{:,1}, ndcg_Table4_WSJ{:,3}, 'Tail', 'both', 'Alpha', 0.1);

[p_mndcg_table4_WSJ] = anova1(ndcg_Table4_WSJ{:,:});

% Table 4 p10

mp10_table4_AP8889 = mean(p10_Table4_AP8889{:,:});
mp10_table4_AP8889 = array2table(mp10_table4_AP8889);
mp10_table4_AP8889.Properties.VariableNames = {'QLM', 'NVSM', 'W2V', 'W2Vsi'};

h_001_mp10_table4_AP8889 = ttest(p10_Table4_AP8889{:,4}, p10_Table4_AP8889{:,2}, 'Tail', 'both', 'Alpha', 0.01);
h_005_mp10_table4_AP8889 = ttest(p10_Table4_AP8889{:,4}, p10_Table4_AP8889{:,2}, 'Tail', 'both', 'Alpha', 0.05);
h_01_mp10_table4_AP8889 = ttest(p10_Table4_AP8889{:,4}, p10_Table4_AP8889{:,2}, 'Tail', 'both', 'Alpha', 0.1);

[p_mp10_table4_AP8889] = anova1(p10_Table4_AP8889{:,:});

mp10_table4_FT = mean(p10_Table4_FT{:,:});
mp10_table4_FT = array2table(mp10_table4_FT);
mp10_table4_FT.Properties.VariableNames = {'QLM', 'NVSM', 'W2V', 'W2Vsi'};

h_001_mp10_table4_FT = ttest(p10_Table4_FT{:,4}, p10_Table4_FT{:,2}, 'Tail', 'both', 'Alpha', 0.01);
h_005_mp10_table4_FT = ttest(p10_Table4_FT{:,4}, p10_Table4_FT{:,2}, 'Tail', 'both', 'Alpha', 0.05);
h_01_mp10_table4_FT = ttest(p10_Table4_FT{:,4}, p10_Table4_FT{:,2}, 'Tail', 'both', 'Alpha', 0.1);

[p_mp10_table4_FT] = anova1(p10_Table4_FT{:,:});

mp10_table4_LA = mean(p10_Table4_LA{:,:});
mp10_table4_LA = array2table(mp10_table4_LA);
mp10_table4_LA.Properties.VariableNames = {'QLM', 'NVSM', 'W2V', 'W2Vsi'};

h_001_mp10_table4_LA = ttest(p10_Table4_LA{:,4}, p10_Table4_LA{:,2}, 'Tail', 'both', 'Alpha', 0.01);
h_005_mp10_table4_LA = ttest(p10_Table4_LA{:,4}, p10_Table4_LA{:,2}, 'Tail', 'both', 'Alpha', 0.05);
h_01_mp10_table4_LA = ttest(p10_Table4_LA{:,4}, p10_Table4_LA{:,2}, 'Tail', 'both', 'Alpha', 0.1);

[p_mp10_table4_LA] = anova1(p10_Table4_LA{:,:});

mp10_table4_Robust04 = mean(p10_Table4_Robust04{:,:});
mp10_table4_Robust04 = array2table(mp10_table4_Robust04);
mp10_table4_Robust04.Properties.VariableNames = {'NVSM', 'QLM', 'W2V', 'W2Vsi'};

h_001_mp10_table4_Robust04 = ttest(p10_Table4_Robust04{:,1}, p10_Table4_Robust04{:,4}, 'Tail', 'both', 'Alpha', 0.01);
h_005_mp10_table4_Robust04 = ttest(p10_Table4_Robust04{:,1}, p10_Table4_Robust04{:,4}, 'Tail', 'both', 'Alpha', 0.05);
h_01_mp10_table4_Robust04 = ttest(p10_Table4_Robust04{:,1}, p10_Table4_Robust04{:,4}, 'Tail', 'both', 'Alpha', 0.1);

[p_mp10_table4_Robust04] = anova1(p10_Table4_Robust04{:,:});

mp10_table4_WSJ = mean(p10_Table4_WSJ{:,:});
mp10_table4_WSJ = array2table(mp10_table4_WSJ);
mp10_table4_WSJ.Properties.VariableNames = {'NVSM', 'W2V', 'W2Vsi', 'QLM'};

h_001_mp10_table4_WSJ = ttest(p10_Table4_WSJ{:,1}, p10_Table4_WSJ{:,3}, 'Tail', 'both', 'Alpha', 0.01);
h_005_mp10_table4_WSJ = ttest(p10_Table4_WSJ{:,1}, p10_Table4_WSJ{:,3}, 'Tail', 'both', 'Alpha', 0.05);
h_01_mp10_table4_WSJ = ttest(p10_Table4_WSJ{:,1}, p10_Table4_WSJ{:,3}, 'Tail', 'both', 'Alpha', 0.1);

[p_mp10_table4_WSJ] = anova1(p10_Table4_WSJ{:,:});

mp10_table4_NY= mean(p10_Table4_NY{:,:});
mp10_table4_NY = array2table(mp10_table4_NY);
mp10_table4_NY.Properties.VariableNames = {'NVSM', 'QLM', 'W2V', 'W2Vsi'};

h_001_mp10_table4_NY = ttest(p10_Table4_NY{:,1}, p10_Table4_NY{:,4}, 'Tail', 'both', 'Alpha', 0.01);
h_005_mp10_table4_NY = ttest(p10_Table4_NY{:,1}, p10_Table4_NY{:,4}, 'Tail', 'both', 'Alpha', 0.05);
h_01_mp10_table4_NY = ttest(p10_Table4_NY{:,1}, p10_Table4_NY{:,4}, 'Tail', 'both', 'Alpha', 0.1);


% % Table 6 MAP
% map_table6_AP8889 = mean(ap_Table6_AP8889{:,:});
% map_table6_AP8889 = array2table(map_table6_AP8889);
% map_table6_AP8889.Properties.VariableNames = {'BM25', 'DRMM', 'DFR', 'QLM', 'TFIDF', 'NVSM', 'W2V', 'W2Vsi'};
% 
% h_001_map_table6_AP8889 = ttest(ap_Table6_AP8889{:,4}, ap_Table6_AP8889{:,2}, 'Tail', 'both', 'Alpha', 0.01);
% h_005_map_table6_AP8889 = ttest(ap_Table6_AP8889{:,4}, ap_Table6_AP8889{:,2}, 'Tail', 'both', 'Alpha', 0.05);
% h_01_map_table6_AP8889 = ttest(ap_Table6_AP8889{:,4}, ap_Table6_AP8889{:,2}, 'Tail', 'both', 'Alpha', 0.1);
% 
% [p_map_table6_AP8889] = anova1(ap_Table6_AP8889{:,:});
% 
% 
% map_table6_FT = mean(ap_Table6_FT{:,:});
% map_table6_FT = array2table(map_table6_FT);
% map_table6_FT.Properties.VariableNames = {'BM25', 'DRMM', 'DFR', 'QLM', 'TFIDF', 'NVSM', 'W2V', 'W2Vsi'};
% 
% h_001_map_table6_FT = ttest(ap_Table6_FT{:,4}, ap_Table6_FT{:,2}, 'Tail', 'both', 'Alpha', 0.01);
% h_005_map_table6_FT = ttest(ap_Table6_FT{:,4}, ap_Table6_FT{:,2}, 'Tail', 'both', 'Alpha', 0.05);
% h_01_map_table6_FT = ttest(ap_Table6_FT{:,4}, ap_Table6_FT{:,2}, 'Tail', 'both', 'Alpha', 0.1);
% 
% [p_map_table6_FT] = anova1(ap_Table6_FT{:,:});
% 
% map_table6_LA = mean(ap_Table6_LA{:,:});
% map_table6_LA = array2table(map_table6_LA);
% map_table6_LA.Properties.VariableNames = {'BM25', 'DRMM', 'DFR', 'QLM', 'TFIDF', 'NVSM', 'W2V', 'W2Vsi'};
% 
% h_001_map_table6_LA = ttest(ap_Table6_LA{:,4}, ap_Table6_LA{:,2}, 'Tail', 'both', 'Alpha', 0.01);
% h_005_map_table6_LA = ttest(ap_Table6_LA{:,4}, ap_Table6_LA{:,2}, 'Tail', 'both', 'Alpha', 0.05);
% h_01_map_table6_LA = ttest(ap_Table6_LA{:,4}, ap_Table6_LA{:,2}, 'Tail', 'both', 'Alpha', 0.1);
% 
% [p_map_table6_LA] = anova1(ap_Table6_LA{:,:});
% 
% map_table6_Robust04 = mean(ap_Table6_Robust04{:,:});
% map_table6_Robust04 = array2table(map_table6_Robust04);
% map_table6_Robust04.Properties.VariableNames = {'NVSM', 'BM25', 'DRMM', 'D', 'TFIDF', 'NVSM', 'W2V', 'W2Vsi'};
% 
% h_001_map_table6_Robust04 = ttest(ap_Table6_Robust04{:,4}, ap_Table6_Robust04{:,2}, 'Tail', 'both', 'Alpha', 0.01);
% h_005_map_table6_Robust04 = ttest(ap_Table6_Robust04{:,4}, ap_Table6_Robust04{:,2}, 'Tail', 'both', 'Alpha', 0.05);
% h_01_map_table6_Robust04 = ttest(ap_Table6_Robust04{:,4}, ap_Table6_Robust04{:,2}, 'Tail', 'both', 'Alpha', 0.1);
% 
% [p_map_table6_Robust04] = anova1(ap_Table6_Robust04{:,:});
% 
% map_table6_WSJ = mean(ap_Table6_WSJ{:,:});
% map_table6_WSJ = array2table(map_table6_WSJ);
% map_table6_WSJ.Properties.VariableNames = {'BM25', 'DRMM', 'DFR', 'QLM', 'TFIDF', 'NVSM', 'W2V', 'W2Vsi'};
% 
% h_001_map_table6_WSJ = ttest(ap_Table6_WSJ{:,4}, ap_Table6_WSJ{:,2}, 'Tail', 'both', 'Alpha', 0.01);
% h_005_map_table6_WSJ = ttest(ap_Table6_WSJ{:,4}, ap_Table6_WSJ{:,2}, 'Tail', 'both', 'Alpha', 0.05);
% h_01_map_table6_WSJ = ttest(ap_Table6_WSJ{:,4}, ap_Table6_WSJ{:,2}, 'Tail', 'both', 'Alpha', 0.1);
% 
% [p_map_table6_WSJ] = anova1(ap_Table6_WSJ{:,:});
% 
% % Table 6 NDCG
% mndcg_table6_AP8889 = mean(ndcg_Table6_AP8889{:,:});
% mndcg_table6_AP8889 = array2table(mndcg_table6_AP8889);
% mndcg_table6_AP8889.Properties.VariableNames = {'BM25', 'DRMM', 'DFR', 'QLM', 'TFIDF', 'NVSM', 'W2V', 'W2Vsi'};
% 
% h_001_mndcg_table6_AP8889 = ttest(ndcg_Table6_AP8889{:,4}, ndcg_Table6_AP8889{:,2}, 'Tail', 'both', 'Alpha', 0.01);
% h_005_mndcg_table6_AP8889 = ttest(ndcg_Table6_AP8889{:,4}, ndcg_Table6_AP8889{:,2}, 'Tail', 'both', 'Alpha', 0.05);
% h_01_mndcg_table6_AP8889 = ttest(ndcg_Table6_AP8889{:,4}, ndcg_Table6_AP8889{:,2}, 'Tail', 'both', 'Alpha', 0.1);
% 
% [p_mndcg_table6_AP8889] = anova1(ndcg_Table6_AP8889{:,:});
% 
% mndcg_table6_FT = mean(ndcg_Table6_FT{:,:});
% mndcg_table6_FT = array2table(mndcg_table6_FT);
% mndcg_table6_FT.Properties.VariableNames = {'BM25', 'DRMM', 'DFR', 'QLM', 'TFIDF', 'NVSM', 'W2V', 'W2Vsi'};
% 
% h_001_mndcg_table6_FT = ttest(ndcg_Table6_FT{:,4}, ndcg_Table6_FT{:,2}, 'Tail', 'both', 'Alpha', 0.01);
% h_005_mndcg_table6_FT = ttest(ndcg_Table6_FT{:,4}, ndcg_Table6_FT{:,2}, 'Tail', 'both', 'Alpha', 0.05);
% h_01_mndcg_table6_FT = ttest(ndcg_Table6_FT{:,4}, ndcg_Table6_FT{:,2}, 'Tail', 'both', 'Alpha', 0.1);
% 
% [p_mndcg_table6_FT] = anova1(ndcg_Table6_FT{:,:});
% 
% mndcg_table6_LA = mean(ndcg_Table6_LA{:,:});
% mndcg_table6_LA = array2table(mndcg_table6_LA);
% mndcg_table6_LA.Properties.VariableNames = {'BM25', 'DRMM', 'DFR', 'QLM', 'TFIDF', 'NVSM', 'W2V', 'W2Vsi'};
% 
% h_001_mndcg_table6_LA = ttest(ndcg_Table6_LA{:,4}, ndcg_Table6_LA{:,2}, 'Tail', 'both', 'Alpha', 0.01);
% h_005_mndcg_table6_LA = ttest(ndcg_Table6_LA{:,4}, ndcg_Table6_LA{:,2}, 'Tail', 'both', 'Alpha', 0.05);
% h_01_mndcg_table6_LA = ttest(ndcg_Table6_LA{:,4}, ndcg_Table6_LA{:,2}, 'Tail', 'both', 'Alpha', 0.1);
% 
% [p_mndcg_table6_LA] = anova1(ndcg_Table6_LA{:,:});
% 
% mndcg_table6_Robust04 = mean(ndcg_Table6_Robust04{:,:});
% mndcg_table6_Robust04 = array2table(mndcg_table6_Robust04);
% mndcg_table6_Robust04.Properties.VariableNames = {'BM25', 'DRMM', 'DFR', 'QLM', 'TFIDF', 'NVSM', 'W2V', 'W2Vsi'};
% 
% h_001_mndcg_table6_Robust04 = ttest(ndcg_Table6_Robust04{:,4}, ndcg_Table6_Robust04{:,2}, 'Tail', 'both', 'Alpha', 0.01);
% h_005_mndcg_table6_Robust04 = ttest(ndcg_Table6_Robust04{:,4}, ndcg_Table6_Robust04{:,2}, 'Tail', 'both', 'Alpha', 0.05);
% h_01_mndcg_table6_Robust04 = ttest(ndcg_Table6_Robust04{:,4}, ndcg_Table6_Robust04{:,2}, 'Tail', 'both', 'Alpha', 0.1);
% 
% [p_mndcg_table6_Robust04] = anova1(ndcg_Table6_Robust04{:,:});
% 
% mndcg_table6_WSJ = mean(ndcg_Table6_WSJ{:,:});
% mndcg_table6_WSJ = array2table(mndcg_table6_WSJ);
% mndcg_table6_WSJ.Properties.VariableNames = {'BM25', 'DRMM', 'DFR', 'QLM', 'TFIDF', 'NVSM', 'W2V', 'W2Vsi'};
% 
% h_001_mndcg_table6_WSJ = ttest(ndcg_Table6_WSJ{:,4}, ndcg_Table6_WSJ{:,2}, 'Tail', 'both', 'Alpha', 0.01);
% h_005_mndcg_table6_WSJ = ttest(ndcg_Table6_WSJ{:,4}, ndcg_Table6_WSJ{:,2}, 'Tail', 'both', 'Alpha', 0.05);
% h_01_mndcg_table6_WSJ = ttest(ndcg_Table6_WSJ{:,4}, ndcg_Table6_WSJ{:,2}, 'Tail', 'both', 'Alpha', 0.1);
% 
% [p_mndcg_table6_WSJ] = anova1(ndcg_Table6_WSJ{:,:});
% 
% % Table 6 p10
% mp10_table6_AP8889 = mean(p10_Table6_AP8889{:,:});
% mp10_table6_AP8889 = array2table(mp10_table6_AP8889);
% mp10_table6_AP8889.Properties.VariableNames = {'BM25', 'DRMM', 'DFR', 'QLM', 'TFIDF', 'NVSM', 'W2V', 'W2Vsi'};
% 
% h_001_mp10_table6_AP8889 = ttest(p10_Table6_AP8889{:,4}, p10_Table6_AP8889{:,2}, 'Tail', 'both', 'Alpha', 0.01);
% h_005_mp10_table6_AP8889 = ttest(p10_Table6_AP8889{:,4}, p10_Table6_AP8889{:,2}, 'Tail', 'both', 'Alpha', 0.05);
% h_01_mp10_table6_AP8889 = ttest(p10_Table6_AP8889{:,4}, p10_Table6_AP8889{:,2}, 'Tail', 'both', 'Alpha', 0.1);
% 
% [p_mp10_table6_AP8889] = anova1(p10_Table6_AP8889{:,:});
% 
% mp10_table6_FT = mean(p10_Table6_FT{:,:});
% mp10_table6_FT = array2table(mp10_table6_FT);
% mp10_table6_FT.Properties.VariableNames = {'BM25', 'DRMM', 'DFR', 'QLM', 'TFIDF', 'NVSM', 'W2V', 'W2Vsi'};
% 
% h_001_mp10_table6_FT = ttest(p10_Table6_FT{:,4}, p10_Table6_FT{:,2}, 'Tail', 'both', 'Alpha', 0.01);
% h_005_mp10_table6_FT = ttest(p10_Table6_FT{:,4}, p10_Table6_FT{:,2}, 'Tail', 'both', 'Alpha', 0.05);
% h_01_mp10_table6_FT = ttest(p10_Table6_FT{:,4}, p10_Table6_FT{:,2}, 'Tail', 'both', 'Alpha', 0.1);
% 
% [p_mp10_table6_FT] = anova1(p10_Table6_FT{:,:});
% 
% mp10_table6_LA = mean(p10_Table6_LA{:,:});
% mp10_table6_LA = array2table(mp10_table6_LA);
% mp10_table6_LA.Properties.VariableNames = {'BM25', 'DRMM', 'DFR', 'QLM', 'TFIDF', 'NVSM', 'W2V', 'W2Vsi'};
% 
% h_001_mp10_table6_LA = ttest(p10_Table6_LA{:,4}, p10_Table6_LA{:,2}, 'Tail', 'both', 'Alpha', 0.01);
% h_005_mp10_table6_LA = ttest(p10_Table6_LA{:,4}, p10_Table6_LA{:,2}, 'Tail', 'both', 'Alpha', 0.05);
% h_01_mp10_table6_LA = ttest(p10_Table6_LA{:,4}, p10_Table6_LA{:,2}, 'Tail', 'both', 'Alpha', 0.1);
% 
% [p_mp10_table6_LA] = anova1(p10_Table6_LA{:,:});
% 
% mp10_table6_Robust04 = mean(p10_Table6_Robust04{:,:});
% mp10_table6_Robust04 = array2table(mp10_table6_Robust04);
% mp10_table6_Robust04.Properties.VariableNames = {'BM25', 'DRMM', 'DFR', 'QLM', 'TFIDF', 'NVSM', 'W2V', 'W2Vsi'};
% 
% h_001_mp10_table6_Robust04 = ttest(p10_Table6_Robust04{:,4}, p10_Table6_Robust04{:,2}, 'Tail', 'both', 'Alpha', 0.01);
% h_005_mp10_table6_Robust04 = ttest(p10_Table6_Robust04{:,4}, p10_Table6_Robust04{:,2}, 'Tail', 'both', 'Alpha', 0.05);
% h_01_mp10_table6_Robust04 = ttest(p10_Table6_Robust04{:,4}, p10_Table6_Robust04{:,2}, 'Tail', 'both', 'Alpha', 0.1);
% 
% [p_mp10_table6_Robust04] = anova1(p10_Table6_Robust04{:,:});
% 
% mp10_table6_WSJ = mean(p10_Table6_WSJ{:,:});
% mp10_table6_WSJ = array2table(mp10_table6_WSJ);
% mp10_table6_WSJ.Properties.VariableNames = {'BM25', 'DRMM', 'DFR', 'QLM', 'TFIDF', 'NVSM', 'W2V', 'W2Vsi'};
% 
% h_001_mp10_table6_WSJ = ttest(p10_Table6_WSJ{:,4}, p10_Table6_WSJ{:,2}, 'Tail', 'both', 'Alpha', 0.01);
% h_005_mp10_table6_WSJ = ttest(p10_Table6_WSJ{:,4}, p10_Table6_WSJ{:,2}, 'Tail', 'both', 'Alpha', 0.05);
% h_01_mp10_table6_WSJ = ttest(p10_Table6_WSJ{:,4}, p10_Table6_WSJ{:,2}, 'Tail', 'both', 'Alpha', 0.1);
% 
% [p_mp10_table6_WSJ] = anova1(p10_Table6_WSJ{:,:});

