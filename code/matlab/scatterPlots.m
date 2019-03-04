% AP AP88-89

figure();
hf = plot([0,1],[0,1], 'r');
hold on;
hf = scatter(ap_Table4_AP8889{:,1}, ap_Table4_AP8889{:,2}, 'filled', 'k');


axis([0 1 0 1]);
grid on;
xlabel('QLM', 'FontSize', 20);
ylabel('NVSM', 'FontSize', 20);


title('AP88-89 - Topic-based analysis (Average Precision)', 'FontSize', 18);

dx = 0.008; dy = 0.008; % displacement so the text does not overlay the data points
text(ap_Table4_AP8889{:,1}+dx, ap_Table4_AP8889{:,2}+dy, ap_Table4_AP8889.Properties.RowNames, 'Color', 'b', 'FontSize', 10);

print('-dpdf', '-r300', ['/Users/silvello/Dropbox/Papers/2019/IPM2019-MPS/data/plots/scatter_ap_Table4_AP8889' '.pdf']);


hold off;
close;

% FT
figure();
hf = plot([0,1],[0,1], 'r');
hold on;
hf = scatter(ap_Table4_FT{:,1}, ap_Table4_FT{:,2}, 'filled', 'k');


axis([0 1 0 1]);
grid on;
xlabel('QLM', 'FontSize', 20);
ylabel('NVSM', 'FontSize', 20);


title('Financial Times - Topic-based analysis (Average Precision)', 'FontSize', 18);

dx = 0.008; dy = 0.008; % displacement so the text does not overlay the data points
text(ap_Table4_FT{:,1}+dx, ap_Table4_FT{:,2}+dy, ap_Table4_FT.Properties.RowNames, 'Color', 'b', 'FontSize', 10);

print('-dpdf', '-r300', ['/Users/silvello/Dropbox/Papers/2019/IPM2019-MPS/data/plots/scatter_ap_Table4_FT' '.pdf']);


hold off;
close;

% LA

figure();
hf = plot([0,1],[0,1], 'r');
hold on;
hf = scatter(ap_Table4_LA{:,1}, ap_Table4_LA{:,2}, 'filled', 'k');


axis([0 1 0 1]);
grid on;
xlabel('QLM', 'FontSize', 20);
ylabel('NVSM', 'FontSize', 20);


title('LA Times - Topic-based analysis (Average Precision)', 'FontSize', 18);

dx = 0.008; dy = 0.008; % displacement so the text does not overlay the data points
text(ap_Table4_LA{:,1}+dx, ap_Table4_LA{:,2}+dy, ap_Table4_LA.Properties.RowNames, 'Color', 'b', 'FontSize', 10);

print('-dpdf', '-r300', ['/Users/silvello/Dropbox/Papers/2019/IPM2019-MPS/data/plots/scatter_ap_Table4_LA' '.pdf']);


hold off;
close;

% WSJ

figure();
hf = plot([0,1],[0,1], 'r');
hold on;
hf = scatter(ap_Table4_WSJ{:,4}, ap_Table4_WSJ{:,1}, 'filled', 'k');


axis([0 1 0 1]);
grid on;
xlabel('QLM', 'FontSize', 20);
ylabel('NVSM', 'FontSize', 20);


title('Wall Street Journal - Topic-based analysis (Average Precision)', 'FontSize', 18);

dx = 0.008; dy = 0.008; % displacement so the text does not overlay the data points
text(ap_Table4_WSJ{:,4}+dx, ap_Table4_WSJ{:,1}+dy, ap_Table4_WSJ.Properties.RowNames, 'Color', 'b', 'FontSize', 10);

print('-dpdf', '-r300', ['/Users/silvello/Dropbox/Papers/2019/IPM2019-MPS/data/plots/scatter_ap_Table4_WSJ' '.pdf']);


hold off;
close;

% Robust04

figure();
hf = plot([0,1],[0,1], 'r');
hold on;
hf = scatter(ap_Table4_Robust04{:,2}, ap_Table4_Robust04{:,1}, 'filled', 'k');


axis([0 1 0 1]);
grid on;
xlabel('QLM', 'FontSize', 20);
ylabel('NVSM', 'FontSize', 20);


title('Robust 2004 - Topic-based analysis (Average Precision)', 'FontSize', 18);

dx = 0.008; dy = 0.008; % displacement so the text does not overlay the data points
text(ap_Table4_Robust04{:,2}+dx, ap_Table4_Robust04{:,1}+dy, ap_Table4_Robust04.Properties.RowNames, 'Color', 'b', 'FontSize', 10);

print('-dpdf', '-r300', ['/Users/silvello/Dropbox/Papers/2019/IPM2019-MPS/data/plots/scatter_ap_Table4_Robust04' '.pdf']);


hold off;
close;

% WT2G

figure();
hf = plot([0,1],[0,1], 'r');
hold on;
hf = scatter(ap_Table8_WT2G{:,3}, ap_Table8_WT2G{:,2}, 'filled', 'k');


axis([0 1 0 1]);
grid on;
xlabel('BM25', 'FontSize', 20);
ylabel('NVSM', 'FontSize', 20);


title('WT2g - Topic-based analysis (Average Precision)', 'FontSize', 18);

dx = 0.008; dy = 0.008; % displacement so the text does not overlay the data points
text(ap_Table8_WT2G{:,3}+dx, ap_Table8_WT2G{:,2}+dy, ap_Table8_WT2G.Properties.RowNames, 'Color', 'b', 'FontSize', 10);

print('-dpdf', '-r300', ['/Users/silvello/Dropbox/Papers/2019/IPM2019-MPS/data/plots/scatter_ap_Table8_WT2G' '.pdf']);


hold off;
close;

% OSHUMED

figure();
hf = plot([0,1],[0,1], 'r');
hold on;
hf = scatter(ap_Table8_OSHUMED{:,3}, ap_Table8_OSHUMED{:,2}, 'filled', 'k');


axis([0 1 0 1]);
grid on;
xlabel('BM25', 'FontSize', 20);
ylabel('NVSM', 'FontSize', 20);


title('OSHUMED - Topic-based analysis (Average Precision)', 'FontSize', 18);

dx = 0.008; dy = 0.008; % displacement so the text does not overlay the data points
text(ap_Table8_OSHUMED{:,3}+dx, ap_Table8_OSHUMED{:,2}+dy, ap_Table8_OSHUMED.Properties.RowNames, 'Color', 'b', 'FontSize', 10);

print('-dpdf', '-r300', ['/Users/silvello/Dropbox/Papers/2019/IPM2019-MPS/data/plots/scatter_ap_Table8_OSHUMED' '.pdf']);


hold off;
close;

% CLEF_IT

figure();
hf = plot([0,1],[0,1], 'r');
hold on;
hf = scatter(ap_Table8_CLEF_IT{:,2}, ap_Table8_CLEF_IT{:,6}, 'filled', 'k');


axis([0 1 0 1]);
grid on;
xlabel('BM25', 'FontSize', 20);
ylabel('NVSM', 'FontSize', 20);


title('CLEF IT - Topic-based analysis (Average Precision)', 'FontSize', 18);

dx = 0.008; dy = 0.008; % displacement so the text does not overlay the data points
text(ap_Table8_CLEF_IT{:,2}+dx, ap_Table8_CLEF_IT{:,6}+dy, ap_Table8_CLEF_IT.Properties.RowNames, 'Color', 'b', 'FontSize', 10);

print('-dpdf', '-r300', ['/Users/silvello/Dropbox/Papers/2019/IPM2019-MPS/data/plots/scatter_ap_Table8_CLEF_IT' '.pdf']);


hold off;
close;

% CLEF_DE

figure();
hf = plot([0,1],[0,1], 'r');
hold on;
hf = scatter(ap_Table8_CLEF_DE{:,2}, ap_Table8_CLEF_DE{:,6}, 'filled', 'k');


axis([0 1 0 1]);
grid on;
xlabel('BM25', 'FontSize', 20);
ylabel('NVSM', 'FontSize', 20);


title('CLEF DE - Topic-based analysis (Average Precision)', 'FontSize', 18);

dx = 0.008; dy = 0.008; % displacement so the text does not overlay the data points
text(ap_Table8_CLEF_DE{:,2}+dx, ap_Table8_CLEF_DE{:,6}+dy, ap_Table8_CLEF_DE.Properties.RowNames, 'Color', 'b', 'FontSize', 10);

print('-dpdf', '-r300', ['/Users/silvello/Dropbox/Papers/2019/IPM2019-MPS/data/plots/scatter_ap_Table8_CLEF_DE' '.pdf']);


hold off;
close;

% CLEF_FA

figure();
hf = plot([0,1],[0,1], 'r');
hold on;
hf = scatter(ap_Table8_CLEF_FA{:,2}, ap_Table8_CLEF_FA{:,6}, 'filled', 'k');


axis([0 1 0 1]);
grid on;
xlabel('BM25', 'FontSize', 20);
ylabel('NVSM', 'FontSize', 20);


title('CLEF FA - Topic-based analysis (Average Precision)', 'FontSize', 18);

dx = 0.008; dy = 0.008; % displacement so the text does not overlay the data points
text(ap_Table8_CLEF_FA{:,2}+dx, ap_Table8_CLEF_FA{:,6}+dy, ap_Table8_CLEF_FA.Properties.RowNames, 'Color', 'b', 'FontSize', 10);

print('-dpdf', '-r300', ['/Users/silvello/Dropbox/Papers/2019/IPM2019-MPS/data/plots/scatter_ap_Table8_CLEF_FA' '.pdf']);


hold off;
close;

% NY

hf = figure();
plot([0,1],[0,1], 'r');
hold on;
scatter(ap_Table4_NY{:,2}, ap_Table4_NY{:,1}, 'filled', 'k');


axis([0 1 0 1]);
grid on;
xlabel('QLM', 'FontSize', 20);
ylabel('NVSM', 'FontSize', 20);


title('NY Times - Topic-based analysis (Average Precision)', 'FontSize', 18);

dx = 0.008; dy = 0.008; % displacement so the text does not overlay the data points
text(ap_Table4_NY{:,2}+dx, ap_Table4_NY{:,1}+dy, ap_Table4_NY.Properties.RowNames, 'Color', 'b', 'FontSize', 10);
    
print('-dpdf', '-r300', ['/Users/silvello/Dropbox/Papers/2019/IPM2019-MPS/data/plots/scatter_ap_Table4_NY' '.pdf']);


hold off;
close;
