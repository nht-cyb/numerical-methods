format long            
% tinh toan den sai so 15 so sau dau phay                                        

Matrix=input('Nhap ma tran vuong dau vao \n Matrix A:');                    % Nhap dau vao la 1 ma tran tu ban phim                           
Tolerance=input('Nhap sai so cho phep \n Tolerance:');                      % Nhap sai so cho phep
[n m]=size(Matrix);          % Kiem tra kich thuoc ma tran          
                                       
if(m==n)                     % Neu dung ma tran vuong thi khoi tao va tiep tuc
    I=eye(n,n); 
    x = rand(n, 1);          % Tao vector bat dau ngau nhien
else                         % Neu khong phai ma tran vuong, bao loi va ket thuc
    disp("Ban nhap ma tran khong phai ma tran vuong, vui long nhap lai.")
    return;
end  

error=inf;                   % Thiet lap sai so ban dau 
ii=0;                        % bien ii dem so vong lap
q = 1;                       % thiet lap q ban dau

fprintf('i.    Tri rieng        [-----------------Vector rieng------------------] \n');
% In de muc ten cot ket qua truoc vong lap
% bat dau lap cho den khi sai so nho hon gia tri sai so cho phep
while error>Tolerance
    ii=ii+1;                 % tang bien dem vong lap                         
    q = (x' * Matrix * x)/(x' * x);                      
    y = ((Matrix - q * I) \ x);  

    max_value=max(abs(y));                % tinh gia tri lon nhat                                      
    x=y/max_value;                        % tinh vector rieng     
    
    % Tim tri rieng bang cong thuc Rayleigh
    eigenvalue1=(x' * Matrix * x)/(x' * x);             % Rayleigh Quotient
    
    fprintf('%d     %11.15f' , ii, eigenvalue1);
    for k = 1:n
        fprintf('  %11.15f ', x(k));
    end
    fprintf('\n') ;                     
    % Chuan bi cho vong lap moi
    if ii>1
        error=abs(eigenvalue1-eigenvalue0);
        % kiem tra sai so
    end
    eigenvalue0=eigenvalue1;
    % thay the gia tri cu bang gia tri moi
end
fprintf('Tri rieng sau %d vong lap la: %11.15f \n',ii, eigenvalue1);
fprintf('Vector rieng tuong ung la: \n');
disp(x);