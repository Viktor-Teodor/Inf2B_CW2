function [sol] = toMatrix(x)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

sol=zeros(28,28);

for i=1:28
    for j=1:28
       sol(i,j)=x((i-1)*28+j);
    end
end
end

