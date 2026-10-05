clc;
close all;
A= [ 5 -2 9; -2 10 -2; 0 -2 15] % Write the coefficient matrix, A. where  the system: AX=B.
B = [18; -60; 128] % Write the constants matrix, B
P= [A B]; % constructing the new augmented matrix P 
[row col] = size(P); % Calculating the size of augmented matrix, P   

for i = 1:row-1 % Finding zeros of lower triangular matrix.
    if P(i,i) == 0 % checking wheather diagonal elements are all zeros or not
        disp(' Gauss elimination method can not applicale. Rearrange the equations!!!') %Diagonal element zero. Hence pivote can't be calculated.
        return
    end
    a=P(i,i);  
    P(i,:)= P(i,:)/a;
    for j=i+1:row     
        P(j,:)= P(j,:)- P(j,i)* P(i,:);
    end
end
a=P(row,row);  
P(row,:)= P(row,:)/a;
for i=row:-1:2   % Finding zeros of the upper triangular matrix.
    for j=i-1:-1:1    
        P(j,:)= P(j,:)- P(j,i)* P(i,:);
    end
end 
disp('The required solution is:')
P(:,col)