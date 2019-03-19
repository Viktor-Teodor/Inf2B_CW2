function [EVecs, EVals] = comp_pca(X)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

Cov=calc_Cov(X);

[V,D]=eig(Cov);

for x=1:size(V,2)
   if V(1,x)<0
    V(:,x)=V(:,x)*(-1);
   end
end

[d,ind]=sort(diag(D),'descend');
Ds=D(ind,ind);
Vs=V(:,ind);

EVecs=Vs;
EVals=Ds;

end

