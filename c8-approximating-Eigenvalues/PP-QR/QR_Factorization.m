function [Q, R] = QR_Factorization(A)
[m, n] = size(A);
Q = zeros(m,n);
R = zeros(n,n);
for i=1:n
  Q(:, i) = A(:, i);
end
for i=1:n
  R(i,i) = norm(Q(:,i),2);
  Q(:,i) = Q(:,i)/R(i,i);
  for j = (i+1):n
    R(i,j) = Q(:,i)'*Q(:,j);
    Q(:,j) = Q(:,j) - R(i,j)*Q(:,i);
  end
end
end
