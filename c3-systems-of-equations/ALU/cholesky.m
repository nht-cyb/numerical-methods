function L = cholesky(A)
    [~, n] = size(A);
    % Check for symmetry fo the Matrix
    t = issymmetric(A);
    if t == 0
        fprintf('\nMa tran khong doi xung.\nKhong the thuc hien thuat toan.');
        return
    end
    % Check for singular/ ill-conditioned Matrix
    r = rank(A);
    if r < n
        fprintf('\nRank deficient matrix. Full cholesky decomposition not possible.\n');
        return
    end
    % Initialization
    L = zeros(n,n);
    for j = 1:n
        sum = 0;
        for k = 1:j-1
            sum = sum + (L(j,k))^2;
        end
        L(j,j) = sqrt(A(j,j)-sum);
        for i = j+1:n
            sum = 0;
            for k = 1:j-1
                 sum = sum + L(i,k)*L(j,k);
            end
        L(i,j) = (A(i,j)-sum)/L(j,j);
        end
    end  
end
    
    