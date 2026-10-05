%==========================================================================
%   Phuong phap diem bat dong - lap don
%
%   c = fixed_point_iteration(f,x0)
%   c = fixed_point_iteration(f,x0,opts)
%   [c,k] = fixed_point_iteration(__)
%   [c,k,c_all] = fixed_point_iteration(__)
%
%--------------------------------------------------------------------------
% ------
% INPUT:
% ------
%   f       - (1×1 function_handle) ham can tim nghiem, f(x) (f : ℝ → ℝ)
%   x0      - (1×1 double) khoi tao gtri diem bat dau
%   opts    - (OPTIONAL) (1×1 struct) solver options
%       • k_max      - (1×1 double) maximimum number of iterations 
%                      (defaults to 200)
%       • TOL        - (1×1 double) tolerance (OPTIONAL 3rd argument, defaults to 10⁻²)
%
% -------
% OUTPUT:
% -------
%   c       - (1×1 double) diem co dinh cua f(x)
%   k       - (1×1 double) so vong lap can thuc hien
%   c_all   - (1×(k+1) double) tat ca cac diem co dinh tim duoc
%
%==========================================================================
function [c,k,c_all] = fixed_point_iteration(f,x0,TOL)
        k_max = 200;
        if nargin < 3, TOL = 1e-2; end
    % ----------------------
    % Fixed-point iteration.
    % ----------------------
    % tra ve neu diem doan dau tien la diem bat dong cua f(x)
    if f(x0) == x0
        c = x0;
        k = 1;
        c_all = x0;
        return
    end
    
    % diem co dinh uoc luong sau vong lap dau tien
    x_curr = x0;
    % tao mang luu gia tri nghiem
    c_all = zeros(1,k_max+1);
     
    % thuc hien lap
    for k = 1:k_max
        % luu ket qua vao mang
        c_all(k) = x_curr;       
        % cap nhat diem co dinh uoc tinh duoc
        x_next = f(x_curr);
        % thoat vong lap neu hoi tu
        if (abs(x_next-x_curr) < TOL)
            break;
        end
        % luu gia tri diem co dinh cho vong lap tiep theo
        x_curr = x_next;
    end
    
    % diem co dinh cuoi cung
    c = x_next;
    % luu gia tri nghiem thanh phan
    c_all(k+1) = c;
    c_all = c_all(1:(k+1));   
end