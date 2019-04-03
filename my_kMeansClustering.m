function [C, idx, SSE] = my_kMeansClustering(X, k, initialCentres, maxIter)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

converged=1;
sums=zeros(k,size(X,2));
count=zeros(k);
idx=zeros(1,size(X,1));

SSE=[];
cont=0;
errorsum=0;

while(cont<=maxIter)
    converged=1;
    %we iterate through every sample and every cluster centre to find
    %the cluster centre that is closest to the current instance
    %if we find one that is closer to this point, we change the cluster
    %that it belongs to
    
    %reset the sums for each cluster
    sums=zeros(k,size(X,2));
    count=zeros(k);
    errorsum=0;
    
    for i=1:size(X,1)             
        
        if(idx(i)==0)
           distCurrCluster=Inf;
        else
           distCurrCluster=my_euclid(initialCentres(idx(i),:),X(i,:));
        end
            
        for j=1:k
            dist=my_euclid(X(i,:),initialCentres(j,:));
            if dist<distCurrCluster
                distCurrCluster=dist;
                idx(i)=j; 
                converged=0;
            end
        end
        
        sums(idx(i),:)=sums(idx(i),:)+X(i,:);
        count(idx(i))=count(idx(i))+1;
        errorsum=errorsum+distCurrCluster;
    end
    
    %we calculate SSE of this state
    SSE=[SSE, errorsum/size(X,1)];
    
    %recentre the clusters
     
    for i=1:k
        initialCentres(i,:)=double(sums(i,:)./count(i));
    end
    
    if converged==1
        break
    end 
    cont=cont+1;
end

C=initialCentres;

end