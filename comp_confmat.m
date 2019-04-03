function [CM, acc] = comp_confmat(Ytrues, Ypreds, K)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

CM=zeros(K);

for i=1:size(Ytrues,1)
    CM(Ytrues(i),Ypreds(i))=CM(Ytrues(i),Ypreds(i))+1;
end

acc=sum(diag(CM))/(sum(sum(CM))-sum(diag(CM)));
end

