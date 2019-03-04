%**************************************************************************
% Performs the Tukey T test with two-way ANOVA, applying the
% Tague-Sutcliffe transformation, if requested.
%
% @param experimentNames - char matrix where each row is the name of
%                          an experiment.
% @param experimentData  - double matrix where each row contains the
%                          data of an experiment and columns are the topics
%                          against which experiments are compared.
% @param metricName      - the name of the metric under evaluation.
% @param alpha           - the significance level to be used in the test.
% @param checkNormality  - if true both the Lilliefors and the Jarque-Bera
%                          tests for normality are performed; if false no
%                          normalty test is performed. If it is true and
%                          the experiments are not normal, then the
%                          Tague-Sutcliffe data transformation is applied.
% @param tit             -  a string with the title of the plot
% @param file            - The name of the file where the plot has to be
%                          saved. The function saves the plot in the
%                          following formats:
%                          + pdf with name FILE.pdf
%                          + png with name FILE.png at 300 dpi
% @return lillie         - a two element vector containing the results of  
%                          the Lilliefors test for normaliy for each
%                          experiment. The first element is the number of
%                          normal experiments found, while the second
%                          element is the number of normal experiments
%                          found after applying the Tague-Sutcliffe data
%                          transformation. If the transformation is not
%                          applied the second element is NaN.
% @return jb               - a two element vector containing the results of  
%                          the Jarque-Bera test for normaliy for each
%                          experiment. The first element is the number of
%                          normal experiments found, while the second
%                          element is the number of normal experiments
%                          found after applying the Tague-Sutcliffe data
%                          transformation. If the transformation is not
%                          applied the second element is NaN.
% @return tagueSutcliffe - a logical value indicating whether the 
%                          Tague-Sutcliffe data transformation for non
%                          normal data has been applied. This
%                          transformation is applied only if either the
%                          Lilliefors or the Jarque-Bera test rejects the
%                          normality hypothesis for any experiment.
% @return groups         - the groups resulting from the Tukey T test. It
%                          is a cell array where each cell contain a
%                          different group. The first cell is the best
%                          performing group; the last cell is the worst
%                          performing group. Each cell contains a char
%                          matrix where each row is the name of one
%                          experiment, according to experimentData; row are
%                          ordered in descending order of performances.
%                          Note that groups may overlap.
%
% See also ANOVA2, MULTCOMPARE
%
%
%**************************************************************************
%** AUTHOR:   Nicola Ferro (ferro@dei.unipd.it)
%** VERSION:  1.00
%** CREATED:  2005/04/20
%** MODIFIED: 2006/08/31
%**************************************************************************


function [lillie, jb, tagueSutcliffe, groups] =  tukeyTTest(experimentNames, experimentData, metricName, alpha, tit, file)

    % transpose for later processing
    experimentData = experimentData.';
    
    % Default is not applying the Tague-Sutcliffe data transformation
    tagueSutcliffe = false;

    % contains the numer of normal experiments before and after the
    % Tague-Sutcliffe data transformation, if applied, according to the
    % Lilliefors test for normality
    lillie = [0 NaN];        

    % contains the numer of normal experiments before and after the
    % Tague-Sutcliffe data transformation, if applied, according to the
    % Jarque-Bera test for normality   
    jb = [0 NaN];


    % Check for normality and decide whether applying the Tague-Sutcliffe 
    % data transformation

    % Performs Lilliefors test for normality and count the number of
    % non-normal experiments
    for i = 1 : size(experimentData, 2)
        lillie(1,1) = lillie(1,1) + lillietest(experimentData(:, i), alpha);
    end

    % Performs Jarque-Bera test for normality and count the number of
    % non-normal experiments
    for i = 1 : size(experimentData, 2)
        jb(1,1) = jb(1,1) + jbtest(experimentData(:, i), alpha);
    end
    
    % if there is any non-normal experiment, apply the Tague-Sutcliffe data
    % transformation
    if ( lillie(1, 1) > 0 || jb(1,1) > 0 ) 
        tagueSutcliffe = true;
    end

    % Apply Tague-Sutcliffe data transformation, if needed
    if(tagueSutcliffe == true)

        experimentData = asin(sqrt(experimentData));
    
        % Performs Lilliefors test for normality on transformed data and 
        % count the number of non-normal experiments
        lillie(1, 2) = 0;
        for i = 1 : size(experimentData, 2)
            lillie(1, 2) = lillie(1, 2) + lillietest(experimentData(:, i), alpha);
        end

        % Performs Jarque-Bera test for normality on transformed data and 
        % count the number of non-normal experiments
        jb(1, 2) = 0;
        for i = 1 : size(experimentData, 2)
            jb(1, 2) = jb(1, 2) + jbtest(experimentData(:, i), alpha);
        end
    
    end
    
    % count how many normal experiments there are before and after
    % transformation
    lillie = [size(experimentData, 2) size(experimentData, 2)] - lillie;
    jb = [size(experimentData, 2) size(experimentData, 2)] - jb;

    % sort experiments by mean of data in descending order
    [dummy, indexes] = sort(mean(experimentData), 'descend');

    % swaps experiments names and data to match the ordering
    experimentData = experimentData(: , indexes);
    experimentNames = experimentNames(indexes, :);


    % compute two-way ANOVA
    [p, table, stats] = anova2(experimentData, 1, 'off');

    % compute Tukey T test
    hf = figure('Visible','off');
    [comparison, means, h, gnames] = multcompare(stats, 'ctype', 'hsd', 'estimate', 'column', 'alpha', alpha);

    % get the potential groups with duplicates. They are the rows of
    % comparison where the third colum is negative. 
    % Keep only the first two columns of these rows: the first column is
    % the index of the top experiment in the group; the second colum is the
    % index of the bottom experiment in the group.
    % The index of the top experiment may contain duplicates.
    dummy = comparison(find(comparison(:, 3) <= 0), 1:2);

    if(isempty(dummy)) % all the experiments belongs to different groups
        groupIndex = [1:size(experimentNames,1); 1:size(experimentNames,1)].';
    else
        
        % for each top experiment find the index biggest group, eliminating
        % duplicates
        dummyGroups = [];
        for i = 1:max(dummy(:,2))
            dummyGroups = [dummyGroups; dummy(max(find(dummy(:, 1) == i)), 1:2 )];
        end

        % find the unique group indices for the bottom experiments.
        dummy = unique(dummyGroups(:, 2));

        % each row is a group: the first element is the index of the top
        % experiment of the group; the second element is the index of the bottom
        % experiment of the group.
        groupIndex = [];
        for i = 1:length(dummy)
            groupIndex = [groupIndex; dummyGroups(min(find(dummyGroups(:, 2) == dummy(i))), 1:2  )];
        end


        % look for groups of isolated elements
        for i = 1:size(experimentNames, 1)
            if isempty(find(groupIndex(:, 1) <= i))

                % the first element is isolated
                if isempty(max(groupIndex(find(groupIndex(:, 2) < i))))
                    groupIndex = [[i i]; groupIndex];
                    continue;
                end

                %max(groupIndex(find(groupIndex(:, 2) < i)))

                [r c] = ind2sub(size(groupIndex), find(groupIndex(:, 1) == max(groupIndex(find(groupIndex(:, 2) < i)))))

                if(r == size(groupIndex, 1))  % after the last row there's nothing to add
                    groupIndex = [groupIndex(begin:r, :); [i i]];
                else
                    groupIndex = [groupIndex(begin:r, :); [i i]; groupIndex(r+1:end, :)];
                end

            end
        end
    end
    
    % move from group indices to groups of experiment names.
    groups = cell(1, size(groupIndex, 1));
    for i = 1:size(groupIndex, 1)
        groups(i) = { experimentNames(groupIndex(i, 1):groupIndex(i, 2), :) };
    end


    % captions
    set(gca,'YTickLabel', cellstr(experimentNames(end:-1:1, :)));
    title([tit ' - Tukey T test with "top group" highlighted'])
    ylabel('Models')

    if(tagueSutcliffe == true)
        xlabel(['arcsin(sqrt(' metricName '))'])
    else
        xlabel(metricName)
    end

    % arrange line styles and markers
    for j=1:size(experimentData, 2)
        lh = findobj(h, 'UserData',-j, 'Type','line');
        if (isempty(lh))
            continue;
        end

        if (j == 1)
            set(lh, 'Color', 'b', 'LineWidth', 3.0);
        else
            if (comparison(j-1,1) == 1 & comparison(j-1,3) < 0 )
                set(lh, 'Color', 'b', 'LineWidth', 3.0);
            else
                set(lh, 'Color', 'k', 'LineWidth', 1);
            end
        end

        lh = findobj(h, 'UserData',j, 'Type','line');
        if (~isempty(lh))
            if (j == 1)
                set(lh, 'Color', 'b', 'LineWidth', 3.0, 'MarkerFaceColor', 'b');
            else
                if (comparison(j-1,1) == 1 & comparison(j-1,3) < 0 )
                    set(lh, 'Color', 'b', 'LineWidth', 2.0, 'MarkerFaceColor', 'b');
                else
                    set(lh, 'Color', 'k', 'LineWidth', 1, 'MarkerFaceColor', 'k');
                end
            end
        end
    end

    lh = findobj(h, 'Type', 'line', '-and', 'LineStyle', ':');
    if (~isempty(lh))
        set(lh, 'Color', 'k', 'LineStyle', '--');
    end

    % number of experiments
    dummy = size(experimentNames, 1);
        
    
    
    fig_pos = hf.PaperPosition;
    hf.PaperSize = [fig_pos(3) fig_pos(4)];
    
    if dummy > 200  % more than 200 experiments: use A0
        set(hf, 'PaperOrientation', 'portrait', 'PaperType','A0', 'PaperUnits', 'normalized', 'PaperPositionMode', 'manual', 'PaperPosition', [0.01, 0.01, 0.99, 0.99])
    elseif dummy > 100  % more than 100 experiments: use A1
        set(hf, 'PaperOrientation', 'portrait', 'PaperType','A1', 'PaperUnits', 'normalized', 'PaperPositionMode', 'manual', 'PaperPosition', [0.01, 0.01, 0.99, 0.99])
    elseif dummy > 50  % more than 50 experiments: use A2
        set(hf, 'PaperOrientation', 'portrait', 'PaperType','A2', 'PaperUnits', 'normalized', 'PaperPositionMode', 'manual', 'PaperPosition', [0.01, 0.01, 0.99, 0.99])
    elseif dummy > 30   % more than 30 experiments: use A3
        set(hf, 'PaperOrientation', 'portrait', 'PaperType','A3', 'PaperUnits', 'normalized', 'PaperPositionMode', 'manual', 'PaperPosition', [0.01, 0.01, 0.99, 0.99])
    elseif dummy > 10   % more than 10 experiments: use A4
        set(hf, 'PaperOrientation', 'portrait', 'PaperType','A4', 'PaperUnits', 'normalized', 'PaperPositionMode', 'manual', 'PaperPosition', [0.01, 0.01, 0.99, 0.99])
    end
    
    % print the plot
    print('-dpdf', '-r300', [file '.pdf']);
    %print('-dpng', '-r300', [file '.png']); 

    close(hf)
end
