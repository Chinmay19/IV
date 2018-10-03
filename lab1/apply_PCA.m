% Project data on a PCA space obtained through compute_PCA
% Input:
%  - pca : pca struct from compute_PCA
%  - data : N x M matrix of N samples in the original feature space
% Output:
%  - pca_data : N x D matrix with the N samples projected
%               to the D-dimensional PCA space
%
% SEE ALSO compute_PCA, backproject_PCA

function pca_data = apply_PCA(pca, data)

% do PCA transform
% ----------------------
%  YOUR CODE GOES HERE! 
% ----------------------
% write this equation properly.
% pcd_data = W(traspose)* (data-mean)

[N, M] = size(data);
y=[]; x= [];

% shoud I overwrite pca.mean???
x = mean(data,1);
y = data - x;

pca_data = y*(pca.components) ;