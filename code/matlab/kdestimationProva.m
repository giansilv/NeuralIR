
xi = -0.1:0.01:1.1;
b =  0.015;
    
   
pdf_ap_Table4_AP8889_QLM = kdEstimation(ap_Table4_AP8889{:,1}, xi, b);
pdf_ap_Table4_AP8889_NVSM = kdEstimation(ap_Table4_AP8889{:,2}, xi, b);

pdf_ap_Table4_FT_QLM = kdEstimation(ap_Table4_FT{:,1}, xi, b);
pdf_ap_Table4_FT_NVSM = kdEstimation(ap_Table4_FT{:,2}, xi, b);

pdf_ap_Table4_LA_QLM = kdEstimation(ap_Table4_LA{:,1}, xi, b);
pdf_ap_Table4_LA_NVSM = kdEstimation(ap_Table4_LA{:,2}, xi, b);

pdf_ap_Table4_NY_QLM = kdEstimation(ap_Table4_NY{:,2}, xi, b);
pdf_ap_Table4_NY_NVSM = kdEstimation(ap_Table4_NY{:,1}, xi, b);

pdf_ap_Table4_Robust04_QLM = kdEstimation(ap_Table4_Robust04{:,2}, xi, b);
pdf_ap_Table4_Robust04_NVSM = kdEstimation(ap_Table4_Robust04{:,1}, xi, b);

pdf_ap_Table4_WSJ_QLM = kdEstimation(ap_Table4_WSJ{:,4}, xi, b);
pdf_ap_Table4_WSJ_NVSM = kdEstimation(ap_Table4_WSJ{:,1}, xi, b);



figure
subplot(2,3,1)
    plot(xi, pdf_ap_Table4_AP8889_QLM, 'Linewidth', 2);
    hold on
    plot(xi, pdf_ap_Table4_AP8889_NVSM, 'Linewidth', 2);
     xlim([0 1]);
    legend('QLM', 'NVSM');
    title('Probability density function of AP88-89 (AP)')
    
subplot(2,3,2)
    plot(xi, pdf_ap_Table4_FT_QLM, 'Linewidth', 2);
    hold on
    plot(xi, pdf_ap_Table4_FT_NVSM, 'Linewidth', 2);
     xlim([0 1]);
    legend('QLM', 'NVSM');
    title('Probability density function of FT (AP)')   
subplot(2,3,3)
    plot(xi, pdf_ap_Table4_LA_QLM, 'Linewidth', 2);
    hold on
    plot(xi, pdf_ap_Table4_LA_NVSM, 'Linewidth', 2);
     xlim([0 1]);
    legend('QLM', 'NVSM');
    title('Probability density function of LA (AP)') 
    
subplot(2,3,4)
    plot(xi, pdf_ap_Table4_NY_QLM, 'Linewidth', 2);
    hold on
    plot(xi, pdf_ap_Table4_NY_NVSM, 'Linewidth', 2);
     xlim([0 1]);
    legend('QLM', 'NVSM');
    title('Probability density function of NY (AP)') 
    
subplot(2,3,5)
    plot(xi, pdf_ap_Table4_Robust04_QLM, 'Linewidth', 2);
    hold on
    plot(xi, pdf_ap_Table4_Robust04_NVSM, 'Linewidth', 2);
     xlim([0 1]);
    legend('QLM', 'NVSM');
    title('Probability density function of Robust 2004 (AP)') 
subplot(2,3,6)
    plot(xi, pdf_ap_Table4_WSJ_QLM, 'Linewidth', 2);
    hold on
    plot(xi, pdf_ap_Table4_WSJ_NVSM, 'Linewidth', 2);
     xlim([0 1]);
    legend('QLM', 'NVSM');
    title('Probability density function of WSJ (AP)') 
    
   
    % Generalization
    
   
pdf_ap_Table8_WT2G_BM25 = kdEstimation(ap_Table8_WT2G{:,3}, xi, b);
pdf_ap_Table8_WT2G_NVSM = kdEstimation(ap_Table8_WT2G{:,2}, xi, b);

pdf_ap_Table8_OSHUMED_BM25 = kdEstimation(ap_Table8_OSHUMED{:,3}, xi, b);
pdf_ap_Table8_OSHUMED_NVSM = kdEstimation(ap_Table8_OSHUMED{:,2}, xi, b);

pdf_ap_Table8_CLEF_IT_BM25 = kdEstimation(ap_Table8_CLEF_IT{:,6}, xi, b);
pdf_ap_Table8_CLEF_IT_NVSM = kdEstimation(ap_Table8_CLEF_IT{:,2}, xi, b);

pdf_ap_Table8_CLEF_DE_BM25 = kdEstimation(ap_Table8_CLEF_DE{:,6}, xi, b);
pdf_ap_Table8_CLEF_DE_NVSM = kdEstimation(ap_Table8_CLEF_DE{:,2}, xi, b);

pdf_ap_Table8_CLEF_FA_BM25 = kdEstimation(ap_Table8_CLEF_FA{:,6}, xi, b);
pdf_ap_Table8_CLEF_FA_NVSM = kdEstimation(ap_Table8_CLEF_FA{:,2}, xi, b);




figure
subplot(2,3,1)
    plot(xi, pdf_ap_Table8_WT2G_BM25, 'Linewidth', 2);
    hold on
    plot(xi, pdf_ap_Table8_WT2G_NVSM, 'Linewidth', 2);
     xlim([0 1]);
    legend('BM25', 'NVSM');
    title('Probability density function of WT2g (AP)')
    
subplot(2,3,2)
    plot(xi, pdf_ap_Table8_OSHUMED_BM25, 'Linewidth', 2);
    hold on
    plot(xi, pdf_ap_Table8_OSHUMED_NVSM, 'Linewidth', 2);
     xlim([0 1]);
    legend('BM25', 'NVSM');
    title('Probability density function of OSHUMED (AP)')   
subplot(2,3,4)
    plot(xi, pdf_ap_Table8_CLEF_IT_BM25, 'Linewidth', 2);
    hold on
    plot(xi, pdf_ap_Table8_CLEF_IT_NVSM, 'Linewidth', 2);
     xlim([0 1]);
    legend('BM25', 'NVSM');
    title('Probability density function of CLEF IT (AP)') 
    
subplot(2,3,5)
    plot(xi, pdf_ap_Table8_CLEF_DE_BM25, 'Linewidth', 2);
    hold on
    plot(xi, pdf_ap_Table8_CLEF_DE_NVSM, 'Linewidth', 2);
     xlim([0 1]);
    legend('BM25', 'NVSM');
    title('Probability density function of CLEF DE (AP)') 
    
subplot(2,3,6)
    plot(xi, pdf_ap_Table8_CLEF_FA_BM25, 'Linewidth', 2);
    hold on
    plot(xi, pdf_ap_Table8_CLEF_FA_NVSM, 'Linewidth', 2);
     xlim([0 1]);
    legend('BM25', 'NVSM');
    title('Probability density function of CLEF FA (AP)') 

    
