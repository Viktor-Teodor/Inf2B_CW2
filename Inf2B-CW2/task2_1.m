function task2_1(Xtrain, Ytrain, Xtest, Ytest, Ks)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

cm=zeros(10,10,size(Ks,2));

Ypreds=run_knn_classifier(Xtrain,Ytrain,Xtest,Ks);


acc=zeros(1,size(Ks,2));



for k=1:size(Ks,2)
    [cm(:,:,k),acc(k)]=comp_confmat(Ytest, Ypreds(:,Ks(k)), 10);
end

for i=1:size(Ks,2)
    K=Ks(i)
    N=size(Xtest,1)
    total=sum(sum(cm(:,:,i)));
    dg=sum(diag(cm(:,:,i)));
    Nerrs=total-dg
    acc(i)
end

end

