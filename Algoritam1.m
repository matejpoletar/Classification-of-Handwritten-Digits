    %%
    % Algoritam
    %===================TRAINING FAZA===============
    %

    clear all; close all; clc;
    load('dtest.mat')
    load('testzip.mat')
    load('dzip.mat')
    load('azip.mat')

    for num = 0:9
       k = find (dzip == num); 
       A = azip (:, k);
       [m ,n] = size(A);
       m = sqrt(m);
       if (num == 0) 
           A_num = zeros(m,m,n,10);
       end
       for i = 1:n
        A_num (:,:,i, num+1) = reshape(A(:,i),m,m)';
       end

       %HOSVD
       [U1(:,:,num+1), U2(:,:,num+1),U(:,:,num+1),S(:,:,:,num+1)] = HOSVD (A_num(:,:,:,num+1));
       B(:,:,:,num+1) = nmodeproduct (nmodeproduct (S(:,:,:,num+1), U1(:,:,num+1),1), U2(:,:,num+1), 2);
    end