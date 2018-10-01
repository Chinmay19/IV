% Compute a D-dimensional PCA space from N samples
%
% pca = compute_PCA(data)
% pca = compute_PCA(data, D)
%
% Input:
% - data : an N x M matrix containing N samples in an M dimensional feature space
% - D: the number of PCA components to retain (optional)
%
% Output: 
% - pca  : struct with the following fields
%   - components : MxD matrix containing the M-d basis vectors of the D PCA
%            dimensions.
%   - mean       : 1xM mean feature vector of the input data
%   - variance   : 1xD vector
%                d-th entry is a number between 0 and 1 that tells the 
%                fraction of variance maintained in the d-th PCA dimension 
%
% SEE ALSO apply_PCA, backproject_PCA

function pca_model = compute_PCA(data, D)

[N, M] = size(data);

% Define default argument (use 'HELP NARGIN' if you do not understand this)
% By default, retain all dimensions in the provided data
if nargin < 2; D = M; end

pca_model = struct;
pca_model.components = [];
pca_model.mean = [];
pca_model.variance = [];

% ----------------------
%  YOUR CODE GOES HERE! 
% ----------------------

pca_model.mean = mean(data,1);

% subtracting mean from the data to find out the zero mean MxN data.
y=[]; x= [];
x = mean(data,1);
for i = 1:M
    y(:, i) = data(:,i) - x(:,i);
end

% now data is zero mean data.
data = y;
% finding the covariance of zero mean data
C = cov(data);
[Vec,Val] = eig(C);



    



% check that everything is OK
assert(all(size(pca_model.components) == [M, D]));
assert(all(size(pca_model.mean) == [1, M]));
assert(all(size(pca_model.variance) == [1, D]));




