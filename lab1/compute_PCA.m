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
y = data - x;


% now data is zero mean data.
data = y;
% finding the covariance of zero mean data
C = cov(data);
[vec,val] = eig(C);

W = [];
% not sure if one column represents an eigen vector or a row.
% also are they already sorted? and we can just take first 10 rows/cols?

% this is first 10 columns: eigen vectors 1-10
% W(:,1:D) = vec(:,1:D);

%this is last ten columns: eigen vectors 1241-1250 
W = vec(:,M-D+1:M);
pca_model.components = W;
 
% first 10 columns : eigen values 1-10
% lambda(:,1:D) = val(:,1:D);
% lambda = diag(lambda);

%last 10 columns: eigen values 1241-1250
lambda = val([M-D+1:M],[M-D+1:M]);
lambda = diag(lambda);

% calculatinf variance each component based on the eigen values.
for i = 1:D
    pca_model.variance(i) = lambda(i) / sum(lambda);
end
    

    



% check that everything is OK
assert(all(size(pca_model.components) == [M, D]));
assert(all(size(pca_model.mean) == [1, M]));
assert(all(size(pca_model.variance) == [1, D]));




