% -----------Thuc hien tinh lap 20 lan-------------------------------

A=input('Nhap ma tran dau vao A : \n');
%[1 3 -1;3 2 4;-1 4 10];               % Dien ma tran vao day
x=input('Nhap vector rieng khoi tao ban dau: \n');
% [1;1;1];                             % Nhap vector rieng ban dau x0.

m1 = 1;
y = A*x; 
m2 = max(abs(y));
count = 0;

% Tinh tri rieng lon nhat va vector rieng tương ung cua no.
while (count<20)
   y=A*x; 
   m2=max(abs(y));
   x=y/m2;
   m1=m2;
   count = count + 1;
   fprintf('Tri rieng lon nhat lan thu %.0f la %2.6f \n', count, m1);
   fprintf('y[%.0f] = \n', count);
   disp(y);
   disp('Vector rieng tuong ung x la');
   disp(x);
end