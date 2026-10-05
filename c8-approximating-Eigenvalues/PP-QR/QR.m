D = diag([4 3 2 1]);
rand('seed',0);
format long
S=rand(4); 
S = (S - .5)*2;
A = S*D/S 
% A_0 = A = S*D*S^{-1}
for i=1:19
    [Q,R] = QR_Factorization(A); 
    A = R*Q
    lambda = A(1,1)
end
[Q,R] = QR_Factorization(A); 
B = R*Q
fprintf('Toc do hoi tu: ');
B./A                        % A(20)./A(19)
