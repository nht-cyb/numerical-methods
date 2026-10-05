A=input('Nhap he so ma tran A: \n');
%A= [7 -3 1; 2 9 -3; 5 4 11] 

% Write the coefficient matrix, A. where  the system: AX=B.
B=input('Nhap vector B: \n');
%B = [21; 37; 15] % Write the constants matrix, B
%A=LU so LUX=B. Let UX=Y, then LY=B. 

%Find Y first and then find X by Gauss elimination.
[L,U]=doolittle(A);
%Find A=L*U (Product of lower and upper triangular matrices)
disp('Ma tran tam giac duoi L la')
disp(L);
disp('Ma tran tam giac tren U la')
disp(U);

P = [ L B ]; % constructing the new augmented matrix P 
[row,col] = size(P);
 
for m=1:row 
   a=P(m,m);
   if a==0
       disp('Khong the ap dung LUD');
       return
   end
   P(m,:)= P(m,:)/a;
end
s=0;
for m=1:row-1 %Finding the solution Y
    for k=row-m:row-1        
        s=s+P(m+1,col-k-1)* P(col-k-1,col);
        P(m+1,col)= P(m+1,col)- s; 
        s=0;        
    end
end  

Y= P(:,col);
disp('Nghiem Y tim duoc la ');
disp(Y);
Q=[U Y]; % constructing the new augmented matrix Q
for m=1:row 
   b=Q(m,m);
   if b==0
       disp('Khong the ap dung LUD');
       return
   end
   Q(m,:)= Q(m,:)/b;
end
s=0;
for m=row:-1:2 %Finding the final solutions
    for k=m+1:col
        s=s+Q(m-1,k-1)* Q(k-1,col);
        Q(m-1,col)= Q(m-1,col)- s; 
        s=0;
    end
end 

X= Q(:,col);
disp('Nghiem X cua he phuong trinh la');
disp(X);
%fprintf('%1.5f \n', X);  