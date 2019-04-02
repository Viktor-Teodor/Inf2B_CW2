function [Cov] = calc_Cov(M)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

MM = bsxfun(@minus,M,calc_means(M));
Cov= MM'*MM/(size(M,1)-1);

end



