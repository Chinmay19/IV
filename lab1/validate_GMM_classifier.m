% Train a Linear SVM with different parameters C, and for each trained
% model evaluate its performance on both the training and the testing data.
% The function returns a struct with the evaluation results for each
% parameter C.
function results = validate_GMM_classifier(K, train_labels, train_features, test_labels, test_features)

results = [];

% try out all of the given values of C
n = numel(K);
for p = 1:n
    k = K(p);
    fprintf('----------------------------------------------\n');
    fprintf('step %d / %d : K = %d\n', p, n, k);
    fprintf('----------------------------------------------\n');
    clear gmm_classifier;
    % train model
    gmm_classifier = train_GMM(train_labels, train_features, k);

    % evaluate on train data
    dval_on_train = evaluate_GMM(gmm_classifier, train_features);
    err_train = mean(((dval_on_train > .5)*2-1) ~= train_labels);
    
    % evaluate on test data
    dval_on_test = evaluate_GMM(gmm_classifier, test_features);
    err_test = mean(((dval_on_test > .5)*2-1) ~= test_labels);
    
    res = struct;
    res.K = k;
    res.model = gmm_classifier;
    res.dval_on_train = dval_on_train;
    res.dval_on_test = dval_on_test;
    res.err_train = err_train;
    res.err_test = err_test;
    
    % store result
    results = [results, res];
end
end