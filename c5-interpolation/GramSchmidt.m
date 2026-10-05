syms x

% xac dinh so bac cua da thuc
n = 4;
P = x.^(0:n);

Q(1) = P(1);
Q(1) = Q(1)/sqrt(int(P(1)^2,[1,3]));

% kiem tra Q(1) da duoc chuan hoa hay chua
sqrt(int(Q(1)^2,[1,3]));

% Ap dung Gram-Schmidt bang vong lap
for i = 2:n
    Q(i) = P(i);
    for j = 1:i-1
      Q(i) = Q(i) - Q(j)*int(Q(i)*Q(j),[1,3]);
    end
    Q(i) = Q(i)/sqrt(int(Q(i)^2,[1,3]));
end

int(Q(3)^2,[1,3]);

fprintf('Ham xap xi bac 0 tim duoc tren khoang [1,3] la\n f(x) = ');
disp(vpa(Q(1),4))

fprintf('Ham xap xi bac 1 tim duoc tren khoang [1,3] la\n f(x) = ');
disp(vpa(Q(2),4))

fprintf('Ham xap xi bac 2 tim duoc tren khoang [1,3] la\n f(x) = ');
disp(vpa(Q(3),4))

fprintf('Ham xap xi bac 3 tim duoc tren khoang [1,3] la\n f(x) = ');
disp(vpa(Q(4),4))