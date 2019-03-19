[Xtrn, Ytrn, Xtst, Ytst] = load_my_data_set("C:\Users\Victor\Desktop\Inf2b_2");
Xtrn=double(Xtrn)./255.0;
Xtst=double(Xtst)./255.0;

A=toMatrix(Xtrn(1,:));
B=toMatrix(Xtrn(2,:));


J = mat2gray(A);
K = mat2gray(B);
%task1_1(Xtrn,Ytrn);
%task1_2(Xtrn,Ytrn);
mat=[3 7 4 9 9 7;
     7 5 5 3 8 8;
     7 5 5 0 8 4;
     5 6 8 5 9 8;
    5 8 8 8 10 9;
     7 7 8 4 7 8];
 
%[vectors,values]=comp_pca(Xtrn);
%[vectors, values,variance,mins]=task1_3(Xtrn);
img=mat2gray(toMatrix(vectors(1,:)));
imshow(img);
%task1_4(vectors)