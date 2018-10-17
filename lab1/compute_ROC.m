% roc = compute_ROC (labels, decision_vals)
%
% Compute ROC curves.
%
%   LabelSet:       Column vector of n true labels {1,-1}, 1 = target class
%   DecisionValues: Column vector of n classifier decision values
%
%   Output: roc - nx2 matrix : [false pos rate, true pos rate]
%


function roc = compute_ROC(labels, decision_vals)

% labels of target class
TargetLabels = (labels == 1);

if (sum(TargetLabels) == 0)
    error ('no target labels (id 1) found');
end

% Remember that:
%   True Positive Rate (TPR) = # of true positives / # of positives
%   False Positive Rate (FPR)  = # of false positives / # of negatives
%
% To compute the ROC curves, one needs to:
%  1. count the number of positive samples P (i.e. true label is +1)
%  2. count the number of negative samples N (i.e. true label is -1)
%  for the i-th possible decision thresholds
%    3. count the number of true positives,
%        i.e. samples with decision value above the threshold, which
%        also have a true label of +1
%    4. count the number of false positives,
%        i.e. samples with decision value above the threshold, which
%        also have a true label of -1
%    5. compute the TPR and FPR
%    6. set the [FPR, TPR] as the i-th row in the output matrix.

roc = zeros(15,2);
% ----------------------
x = 1;
for j = -7:0.1:7
    thresh = j;
    count_pos = 0;
    count_neg = 0;
    count_TP = 0;
    count_FP = 0;

    for i = 1:size(labels,1)
        if (labels(i) > 0)
            count_pos = count_pos + 1;
        elseif (labels(i) < 0);
            count_neg = count_neg + 1;
        end
        if (labels(i) > 0 && decision_vals(i) > thresh)
            count_TP = count_TP + 1;
        elseif(labels(i) < 0 && decision_vals(i) > thresh);
            count_FP = count_FP + 1;
        end    
    end
    roc(x,1) = count_FP / count_neg;
    roc(x,2) = count_TP / count_pos;
    x= x+1;
end
% ----------------------

