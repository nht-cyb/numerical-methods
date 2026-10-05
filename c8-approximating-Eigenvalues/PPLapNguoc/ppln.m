% -----------Thuc hien tinh lap 20 lan-------------------------------

A=input('Nhap ma tran dau vao A : \n');
%[1 3 -1;3 2 4;-1 4 10];                            % Dien ma tran vao day
x=input('Nhap vector rieng khoi tao ban dau: \n');
% [1;1;1];                                          % Nhap vector rieng ban dau x0.

m1 = 1;
y = A\x; 
m2 = max(abs(y));
count = 0;
R=0;
C=0;

% Tinh tri rieng nho nhat va vector rieng tương ung cua no.
while (count<20)                                    % thuc hien lap 20 lan
   y=A\x;                                           % giai Ay=x tim y
   m2=max(abs(y));                                  % xac dinh phan tu co GTTD lon nhat
   [R,C]=find(y==m2 | y==-m2)                       % xac dinh dau cua tri rieng
   s=sign(y(R,C));
   x=s*y/m2;                                        % chuan hoa x
   m1=s*m2;      
   count = count + 1;
   fprintf('Tri rieng nho nhat lan thu %.0f la %2.6f \n', count, 1/m1);
   fprintf('y[%.0f] = \n', count);
   disp(y);
   disp('Vector rieng tuong ung x la');
   disp(x);
end