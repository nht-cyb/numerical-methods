function [x, it] = jacobi_method(A, b)
%%%%%%%% jacobi method %%%%%%%%
% varifying size of matrix and vector
s=size(A); % gets no of rows & columns in A
rows=s(1); % number of rows in A
cols=s(2); % number of columns in A
S=zeros(size(A));
for i=1:cols;
    S(i,i)=A(i,i);
end
S
T=S-A
x=ones(size(b))
xnew=ones(size(b));
for it=1:10
    for i=1:cols
        xnew(i)=b(i);
        for j=1:rows
            xnew(i)=xnew(i)+T(i,j)*x(j);
        end
        xnew(i)=xnew(i)/S(i,i);
    end
    x=xnew;
    disp('iteration ')
    it
    x
    pause
end;