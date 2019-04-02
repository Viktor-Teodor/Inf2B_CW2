function Dmap = task1_7(ClusterCentres, M, evecs, evals,posVec, nbins)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

Dmap=zeros(nbins);

PCA1=evecs(:,1);
PCA2=evecs(:,2);

meanPCA1= sum(PCA1)/size(PCA1,2);
meanPCA2= sum(PCA2)/size(PCA2,2);

varPCA1= (PCA1-meanPCA1)/size(PCA1,2);
varPCA2= (PCA2-meanPCA2)/size(PCA2,2);


PCA1Min=(meanPCA1-5*varPCA1).*PCA1;
PCA1Max=(meanPCA1+ 5*varPCA1).*PCA1;

PCA2Min=(meanPCA2-5*varPCA2).*PCA2;
PCA2Max=(meanPCA2+5*varPCA2).*PCA2;

V=[PCA1 PCA2];
X=zeros(nbins*nbins,784);

min=inf;
index=0;

for i=1:nbins
    for j=1:nbins
        initialIndex=[i j];
        initialIndex=V'\initialIndex;
        initialIndex=initialIndex+posVec;
       min=inf;
       index=0;
        for k=size(ClusterCentres,1)
           if min<my_euclid(initialIndex,ClusterCentre(k))
            min=my_euclid(initialIndex,ClusterCentres(k));
            index=k;
           end
        end
       Dmap(i,j)=index;
    end
end

figure;

% This function will draw the decision boundaries
Xplot=[PCA1_min PCA1_max];
Yplot=[PCA2_min PCA2_max];

[CC,h] = contourf(Xplot(:), Yplot(:), reshape(Dmap, nbins, nbins));

set(h,'LineColor','none');


end
