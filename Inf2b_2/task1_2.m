 function M = task1_2(X, Y)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

M=zeros(11,784);
Isum=zeros(10,784);
count=zeros(10);
totalsum=zeros(1,784);

for i=1:size(X)
    Isum(Y(i)+1,:)= Isum(Y(i)+1,:)+X(i,:);
    count(Y(i)+1)=count(Y(i)+1)+1;
end

for i=1:10
    M(i,:)=double(double(Isum(i,:))./double(count(i)));
    totalsum=totalsum+(Isum(i,:));
end


aux=double(size(X,1));
M(11,:)=double(totalsum)./aux;

sol={};

for i=1:11
    aux=toMatrix(M(i,:));
    aux=mat2gray(aux);
    sol=[sol,aux];
end

sol=montage(sol);
sol
save('task1 2 M.mat','M');

end
