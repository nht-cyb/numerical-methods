%==========================================================================
% Phuong phap chia doi thuc hien tim nghiem cua phuong trinh
%
%   x = bisection_method(f,a,b)
%   x = bisection_method(f,a,b,opts)
%   [x,k] = bisection_method(__)
%   [x,k,x_all] = bisection_method(__)
%--------------------------------------------------------------------------
% ------
% INPUT:
% ------
%   f       - (1×1 function_handle) univariate, scalar-valued function, 
%             f(x) (f : ℝ → ℝ)
%   a       - (1×1 double) gioi han duoi cua khoang chua nghiem
%   b       - (1×1 double) gioi han tren cua khoang chua nghiem
%   opts    - (OPTIONAL) (1×1 struct) phuong an lua chon phuong phap giai
%       • k_max      - (1×1 double) thuc hien trong so vong lap k
%                      (mac dinh 200 vong)
%       • return_all - (1×1 logical) tra ve tat ca vong lap can thuc hien 
%                      neu dat bien nay la 'true'
%       • TOL        - (1×1 double) sai so cho phep tolerance(mac dinh 10⁻¹⁰)
%
% -------
% OUTPUT:
% -------
%   x       - (1×1 double) nghiem cua phuong trinh f(x)
%   k       - (1×1 double) so vong lap can thuc hien de giai phuong trinh
%   x_all   - (1×(k+1) double) nghiem uoc tinh tai moi vong lap
%
%==========================================================================
function [x,k,x_all] = bisection_method(f,a,b)
    
    k_max = 200;
    TOL = 1e-10;
 
    % -----------------
    % Bisection method.
    % -----------------
    
    % nghiem uoc tinh tai vong lap dau tien
    c = (a+b)/2;
    
    % tra ve neu dung la nghiem cua f(x)
    if f(c) == 0
        x = c;
        k = 1;
        x_all = x;
        return
    end
    
    % kiem tra gia tri cua f(x) tai c
    fa = f(a);
    fc = f(c);
    
    % them nghiem uoc luong vao mang
    x_all = zeros(1,k_max+1);
    
    % thuc hien lap
    for k = 1:k_max
        % luu ket qua vao mang
        x_all(k) = c;
        % cap nhat diem giua
        if fc == 0
            break;
        elseif (fa*fc > 0)
            a = c;
            fa = fc;
        else
            b = c;
        end
        % cap nhat nghiem uoc tinh
        c = (a+b)/2;
        % ngat vong lap neu dam bao sai so
        if ((b-a) < TOL)
            break;
        end
        % tinh gia tri ham f(x) tai vi tri nghiem uoc luong
        fc = f(c);
    end
    % tra ve nghiem cuoi cung
    x = c;
    % tra ve mang chua cac nghiem thanh phan
    x_all(k+1) = x;
    x_all = x_all(1:(k+1));
end