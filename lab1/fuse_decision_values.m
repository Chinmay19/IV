% Fuse decision values from two classifiers, using MEAN and MAX methods
%
% Input:
%  - dval1 : N decision values from classifier 1
%  - dval2 : N decision values from classifier 2
%
% Output:
%  - dval_fuse_mean : N averaged decision values
%  - dval_fuse_max  : N decision values, picking the descision value of the
%                     classifier with the largest ABSOLUTE (!) value.
%
function [dval_fuse_mean, dval_fuse_max] = fuse_decision_values(dval1, dval2)
dval_fuse_mean=[];
dval_fuse_max=[];

% ----------------------
for i = 1:size(dval1,1)
    dval_fuse_mean(i) = mean([dval1(i), dval2(i)]);
    if(abs(dval1(i)) > abs(dval2(i)))
        dval_fuse_max(i) = abs(dval1(i));
    else dval_fuse_max(i) = abs(dval2(i));
    end
end
% ----------------------


end