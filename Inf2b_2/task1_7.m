function Dmap = task1_7(ClusterCentres, M, evecs, evals,posVec, nbins)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

Dmap=zeros(nbins);

PCA1=evecs(1,:);
PCA2=evecs(2,:);

meanPCA1= sum(PCA1)/size(PCA1);
meanPCA2= sum(PCA2)/size(PCA2);

varPCA1= (PCA1-meanPCA1)/size(PCA1);
varPCA2= (PCA1-meanPCA2)/size(PCA2);


PCA1Min=(meanPCA1-5*varPCA1)*PCA1;
PCA1Max=(meanPCA1+ 5*varPCA1)*PCA1;

PCA2Min=(meanPCA2-5*varPCA2)*PCA2;
PCA2Max=(meanPCA2+5*varPCA2)*PCA2;

V=[PCA1 PCA2];
X=zeros(nbins*nbins,784);
o=1;

for i=1:nbins
    for j=1:nbins
        intialIndex=[i j];
        initialIndex=V'\initialIndex;
        initialIndex=initialIndex+posVec;
        X(o)=initialIndex;
        o=o+1;
    end
end

o=o-1;

[C, idx, SSE] = my_kMeansClustering(X, size(ClusterCentres), ClustersCentres, maxIter);

for i=1:nbins
    for j=1:nbins
        Dmap(i,j)=idx((i-1)*nbins+j);
    end
end


end

