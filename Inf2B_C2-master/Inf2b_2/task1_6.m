function task1_6(MAT_ClusterCentres)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

sol={};
C=MAT_ClusterCentres;
for c=1:size(C,1)
    img=mat2gray(toMatrix(C(c,:)));
    sol=[sol img];
end

montage(sol);
sol;

end

