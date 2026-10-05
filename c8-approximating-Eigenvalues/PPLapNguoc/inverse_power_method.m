function [lambda, v, nl] = inverse_power_method(A)
%--------------------------------------------------------------------------------
% Ham nay thuc hien tim tri rieng va vector rieng tuong ung bang pp lap nguoc
% Inputs:
%   A        - Ma tran vuong dau vao
%   tol      - Muc do sai so cho phep
%   max_iter - So vong lap lon nhat
% Outputs:
%   lambda   - Tri rieng nho nhat tinh duoc
%   v        - Vector rieng tuong ung voi gia tri tren
%---------------------------------------------------------------------------------
        max_iter = 200;
        tol = 1e-2;

n = size(A, 1);                                % Lay kich thuoc ma tran A
v = rand(n, 1);                                % Khoi tao vector ngau nhien
v = v / norm(v);                               % Chuan hoa vector tren
nl = zeros(1,max_iter+1);

% Thuc hien phuong phap lap nguoc
for k = 1:max_iter
    w = (A \ v);                               % Giai A * w = v
    v_new = w / norm(w);                       % Chuan hoa vector v
    % Kiem tra sai so hoi tu
    if norm(v_new - v) < tol
        break;
    end
    v = v_new;                                 % Cap nhat vector rieng v
end

% Tinh tri rieng tuong ung
lambda = v' * A * v;
% Chuan hoa vector v
v = v / norm(v);
end