  
function [ U1, U2, U3, S ] = HOSVD( A )
     
      % HOSVD A = S x_1 U1 x_2 U2 x_3 U3
      % IN: tensor A
      % OUT: orthogonal matrices U1, U2, U3
      %      core tensor S

      [U1,S1,V1] = svd (unfold (A,1));
      [U2,S2,V2] = svd (unfold (A,2));
      [U3,S3,V3] = svd (unfold (A,3));
      S = nmodeproduct (nmodeproduct (nmodeproduct (A, U1',1), U2', 2 ), U3', 3 );

  end

