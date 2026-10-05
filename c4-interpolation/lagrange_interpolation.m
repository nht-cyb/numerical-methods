clc
clear
x=input('Nhap cac gia tri diem roi rac x vao mot mang: \n');
%x= [6.54 6.58 6.59 6.61 6.64];
% Write the values of independent variable x.
y=input('Nhap cac gia tri diem roi rac y vao mot mang: \n');
%y =[2.8156 2.8182 2.8189 2.8202 2.8222]; 
% Write the values of dependent variable y.
xf=input('Nhap gia tri vi tri x ma ta can tim f(x): ');
n=length(x); % Number of terms of X or Y
L=zeros(1,n);
% For Lagrange's function.
%Formula: f(x)?[(x-x2)(x-x3)...(x-xn)]/[(x1-x2)(x1-x3)...(x1-xn)]*y1
% +[(x-x1)(x-x3)...(x-xn)]/[(x2-x1)(x2-x3)...(x2-xn)]*y2
%+.....+[(x-x1)(x-x2)...(x-x(n-1))]/[(xn-x1)(xn-x2)...(xn-x(n-1))]*yn
p=1;q=1;
for r=1:n %Finding Lagrangian coefficients.
    for k=1:n
       if r~=k
        p= p*(xf-x(k));
        q=q*(x(r)-x(k));        
       end      
    end
     L(1,r)=p/q*y(r);
     p=1;q=1;
end
sol=0;
for r=1:n %Finding final result.
   sol=sol+L(1,r); 
end
fprintf('Gia tri tim duoc cua f(%1.2f) = %2.4f \n',xf,sol);
