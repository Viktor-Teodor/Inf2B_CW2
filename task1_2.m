 function M = task1_2(X, Y)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

M=zeros(11,784);
Isum=zeros(10,784);
count=zeros(10);
%totalsum=zeros(1,784);

for i=1:size(X,1)
    Isum(Y(i)+1,:)= Isum(Y(i)+1,:)+X(i,:);
   % totalsum=totalsum+X(i,:);
    count(Y(i)+1)=count(Y(i)+1)+1;
end

for i=1:10
    M(i,:)=double(double(Isum(i,:))./double(count(i)));
end


M(11,:)=calc_means(X);

sol=[];

for i=1:11
    aux=toMatrix(M(i,:));
    aux=mat2gray(aux);
    sol=[sol,aux];
end

sol=montage(sol);
imshow(sol);
save('task1 2 M.mat','M');

end

