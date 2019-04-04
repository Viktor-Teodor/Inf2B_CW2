%
%
function Dmap = task1_7(C, M, EVecs, EVals, posVec, nbins)
% Input:
%  MAT_ClusterCentres: MAT filename of cluster centre matrix
%  MAT_M     : MAT filename of mean vectors of (K+1)-by-D, where K is
%              the number of classes (which is 10 for the MNIST data)
%  MAT_evecs : MAT filename of eigenvector matrix of D-by-D
%  MAT_evals : MAT filename of eigenvalue vector of D-by-1
%  posVec    : 1-by-D vector (double) to specify the position of the plane
%  nbins     : scalar (integer) to specify the number of bins for each PCA axis
% Output
%  Dmap  : nbins-by-nbins matrix (uint8) - each element represents
%	   the cluster number that the point belongs to.

%load(MAT_ClusterCentres, 'C');
%load(MAT_M, 'M')
%temp = load(MAT_evals);
%EVals = temp.values;
%temp1 = load(MAT_evecs)
%EVecs = temp1.vectors;

sizeMean = size(M);

Mx = (M(sizeMean(1),:) - posVec) * EVecs(:,1);
My = (M(sizeMean(1),:) - posVec) * EVecs(:,2);

sizeC = size(C);
std_x = sqrt(EVals(1));
std_y = sqrt(EVals(2));

Xplot = linspace(Mx - 5 * std_x, Mx + 5 * std_x, nbins)';
Yplot = linspace(My - 5 * std_y, My + 5 * std_y, nbins)';

% Obtain the grid vectors for the two dimensions

[Xv, Yv] = meshgrid(Xplot, Yplot);
gridX = [Xv(:), Yv(:)]; % Concatenate to get a 2-D point.
Dmap = length(Xv(:));

X = ((EVecs(:,1:2) * gridX') + posVec')'; 
k = size(C,1);

Dist = zeros(k, size(X, 1));

for j = 1:k
    Dist(j, :) = square_dist(X, C(j, :));
end

[Ds, idx] = min(Dist);
if(size(idx, 2)~=1)
    Dmap = reshape(idx, nbins, nbins);
else
    Dmap = ones(nbins*nbins,1);
    Dmap(1,1) = Dmap(1,1) + 0.01;
end


figure;
% This function will draw the decision boundaries
cmap = [0.80369089, 0.61814689, 0.46674357;
        0.81411766, 0.58274512, 0.54901962;
        0.58339103, 0.62000771, 0.79337179;
        0.83529413, 0.5584314 , 0.77098041;
        0.77493273, 0.69831605, 0.54108421;
        0.72078433, 0.84784315, 0.30039217;
        0.96988851, 0.85064207, 0.19683199;
        0.93882353, 0.80156864, 0.4219608;
        0.83652442, 0.74771243, 0.61853136;
        0.7019608 , 0.7019608 , 0.7019608];

[~,h] = contourf(Xplot(:), Yplot(:), reshape(Dmap, length(Xplot), length(Yplot)));
set(h,'LineColor','none');
colormap(cmap);

end