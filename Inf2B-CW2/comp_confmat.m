function [CM, acc] = comp_confmat(Ytrues, Ypreds, K)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

CM=zeros(K);

for i=1:size(Ytrues,1)
    CM(Ytrues(i)+1,Ypreds(i)+1)=CM(Ytrues(i)+1,Ypreds(i)+1)+1;
end

acc=sum(diag(CM))/size(Ytrues,1);

end

