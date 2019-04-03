function [SSEs]= task1_5(X, Ks)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

Cs={};
idxs={};
SSEs=[];
for k=Ks
    [C, idx, SSE]=my_kMeansClustering(X,k,X(1:k,:),100);
    Cs=[Cs C];
    idxs=[idxs idx];
    SSEs=[SSEs SSE];
end

end

