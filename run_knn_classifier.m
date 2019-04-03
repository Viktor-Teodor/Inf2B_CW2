function [Ypreds] = run_knn_classifier(Xtrain, Ytrain, Xtest, Ks)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

XX=zeros(1,size(Xtrain,1));

for i=1:size(Xtrain,1)
    XX(i)=Xtrain(i,:)*Xtrain(i,:)';
end

YY=zeros(1,size(Xtest,1));

for i=1:size(Xtest,1)
    YY(i)=Xtest(i,:)*Xtest(i,:)';
end

first=repmat(XX,size(YY,2),1);
second=repmat(YY,size(XX,2),1)';
middle=(2*Xtrain*Xtest')';

DI=first-middle+second;
DI=DI';

Ypreds=zeros(size(Xtest,1),size(Ks,2));

for k=Ks
    for i=1:size(Xtest,1)
        [sbst,idx]=sort(DI(:,i));
        aux=Ytrain(idx(1:k));
        Ypreds(i,k)=mode(aux);
    end
end


end

