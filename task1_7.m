function Dmap = task1_7(ClusterCentres, M, evecs, evals,posVec, nbins)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


size(ClusterCentres)
size(M)
PCA1=evecs(:,1);
PCA2=evecs(:,2);
totalMean=M(end,:);

V=[PCA1 PCA2];

meanPCA= V'*(totalMean-posVec)';


PCA1Min=meanPCA(1)-5*evals(1);
PCA1Max=meanPCA(1)+5*evals(1);

PCA2Min=meanPCA(2)-5*evals(2);
PCA2Max=meanPCA(2)+5*evals(2);

cmap = [0.80369089, 0.61814689, 0.46674357;
0.81411766, 0.58274512, 0.54901962;
0.58339103, 0.62000771, 0.79337179;
0.83529413, 0.5584314 , 0.77098041;
0.77493273, 0.69831605, 0.54108421;
0.72078433, 0.84784315, 0.30039217;
0.96988851, 0.85064207, 0.19683199;
0.93882353, 0.80156864, 0.4219608 ;
0.83652442, 0.74771243, 0.61853136;
0.7019608 , 0.7019608 , 0.7019608];




X=zeros(nbins*nbins,784);
min=inf;
index=0;



figure;

% This function will draw the decision boundaries
Xplot = linspace(PCA1Min,PCA1Max, nbins)';
Yplot = linspace(PCA2Min,PCA2Max, nbins)';
[Xv Yv] = meshgrid(Xplot, Yplot);
gridX = [Xv(:), Yv(:)]; % Concatenate to get a 2-D point.
Dmap = zeros(1,length(Xv(:)));

for i=1:length(gridX)
        initialIndex=[gridX(i,1);gridX(i,2)];
        initialIndex=V'\initialIndex;
        initialIndex=initialIndex'+posVec;

        min=inf;
       index=0;
        for k=1:size(ClusterCentres,1)
            val=my_euclid(initialIndex,ClusterCentres(k,:));
           if min>val
            min=val;
            index=k;
           end
        end
       Dmap(i)=index;
    end

Dmap=reshape(Dmap, nbins, nbins);


[CC,h] = contourf(Xplot(:), Yplot(:), Dmap);

set(h,'LineColor','none');
colormap(cmap); hold on;


end
