function [SSE] = calc_error(X,idx,initialCentres)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

sums=zeros(size(initialCentres,1));

for i=1:size(X,1)
    sums(idx(i))=sums(idx(i))+my_euclid(X(i,:),initialCentres(idx(i),:));
end

SSE=sums/size(X,1);

end

