clc
clear

A=input('Nhap ma tran dau vao A : \n');
%[1 3 -1;3 2 4;-1 4 10];               % Dien ma tran vao day
x=input('Nhap vector rieng khoi tao ban dau: \n');
% [1;1;1];                             % Nhap vector rieng ban dau x0.
epsilon=input('Nhap muc do sai so cho phep: \n');
% Muc do sai so cho phep. VD: 0.001 | 0.0001 ...

m1=1;
y=A*x; 
m2=max(abs(y));
err=abs(m1-m2);

% Tinh tri rieng lon nhat va vector rieng tương ung cua no.
while err>epsilon  
   y=A*x; 
   m2=max(abs(y));
   x=y/m2;
   err=abs(m1-m2);
   m1=m2;
end

fprintf('\n Tri rieng lon nhat la %2.5f \n',m1);
disp('Vector rieng tuong ung la:');
disp(x);
%fprintf('\n %2.5f',u);