    function [val] = test2 (testzip, dtest, B, rank)

    br = 2007;
    for k = 1:br
    Z = testzip(:,k); 
    [m ,~] = size(Z);
    m = sqrt(m);
    Z = reshape (Z,m,m)';
    Z = Z./norm(Z);
    koef = zeros(rank,10);
    for num = 0:9
        for i = 1:rank
            koef (i,num+1) = trace (B(:,:,i,num+1)'*Z);
        end
    end

    ZZ = zeros(m,m,10);
    for num = 0:9
        for i = 1:rank
           ZZ(:,:,num+1) = ZZ(:,:,num+1) + B(:,:,i,num+1)*koef(i,num+1); 
        end
         ZZ(:,:,num+1) = ZZ(:,:,num+1)./norm(ZZ(:,:,num+1));
         R(num+1) = norm (Z - ZZ(:,:,num+1));
    end
        un_num = find (R == min(R)) - 1; 
        class_nums(k) = un_num;

    end

    count = 0;
    for k = 1:br
       if (class_nums (k) == dtest (k))
           count = count + 1;
       end
    end

    val = count / br;

    end

