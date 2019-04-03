[Xtrn, Ytrn, Xtst, Ytst] = load_my_data_set("C:\Users\Victor\Documents\GitHub\Inf2B_CW2");
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
 
%task1_1(Xtrn,Ytrn);
%M=task1_2(Xtrn,Ytrn);
%[vectors,values]=comp_pca(Xtrn);
%[vectors, values,variance,mins]=task1_3(Xtrn);
%task1_4(vectors);

test_KMeans=[2 9;
    4 13;
    7 8;
    1 2;
    1 1;
    3 1;
    5 2;
    5 4;
    4 5;
    7 6;
    6 6;
    8 4;
    10 5;
    10 0;];
KMeans=3;
KMeans_Centre=zeros(10,784);
Centres=[4 13;
        1 1;
        10 0];
Ks = [1,2];

%SSEs=task1_5(Xtrn, Ks);
%[C,idx,SSE]=my_kMeansClustering(Xtrn,10,Xtrn(1:10,:),10);
%[C,idx,SSE]=my_kMeansClustering(test_KMeans,3,Centres,100);
%task1_7(C,Xtrn,vectors,values,calc_means(Xtrn),200);
%task1_6(C);


%Dmap = task1_7(C,M, vectors,values, mean(Xtrn), 200);
%task1_1(Xtrn,Ytrn)
%silhouette(Xtrn,idx);

%Ks = [1,3,5,10,20];
%task2_1(Xtrn, Ytrn, Xtst, Ytst, Ks);
%Ks=[1 2 3 4];
%[Ypreds] = run_knn_classifier(test_KMeans(1:10,:), [1 1 1 2 2 2 2 2 2 3], test_KMeans(11:14,:), Ks)
%[Ypreds] = run_knn_classifier(Xtrn,Ytrn, Xtst,[1])

task2_1(test_KMeans(1:10,:), [1 1 1 2 2 2 2 2 2 3], test_KMeans(11:14,:),[3 3 3 3], Ks);
