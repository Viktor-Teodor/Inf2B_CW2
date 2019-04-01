function [means] = calc_means(X)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

col_sum=sum(X);
means=double(col_sum)./size(X,1);

end

