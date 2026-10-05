%==========================================================================
% Phuong phap diem sai - False Position Method
%
%   x = false_position_method(f,x0)
%   [x,k] = false_position_method(__)
%   [x,k,x_all] = false_position_method(__)
%--------------------------------------------------------------------------
% ------
% INPUT:
% ------
%   f       - (1×1 function_handle) univariate, scalar-valued function, 
%             f(x) (f : ℝ → ℝ)
%   x0      - (1×1 double) initial guess for root
%   opts    - (OPTIONAL) (1×1 struct) solver options
%       • k_max      - (1×1 double) maximimum number of iterations 
%                      (defaults to 200)
%       • return_all - (1×1 logical) returns estimates at all iterations if
%                      set to "true"
%       • TOL        - (1×1 double) tolerance (defaults to 10⁻¹⁰)
%
% -------
% OUTPUT:
% -------
%   x       - (1×1 double) root of f(x)
%   k       - (1×1 double) number of solver iterations
%   x_all   - (1×(k+1) double) root estimates at all iterations
%
%==========================================================================
function [x,k,x_all] = false_position_method(f,p0,p1)
    % ----------------------------------
    % Sets (or defaults) solver options.
    % ----------------------------------
    
    % sets maximum number of iterations (defaults to 200)
        k_max = 200;
    % sets tolerance (defaults to 10⁻¹⁰)
        TOL = 1e-6;  
    % --------------
    % False Position method.
    % --------------
    % returns initial guess if it is a root of f(x)
    x0 = p1 - f(p1)*(p1 - p0)/(f(p1)-f(p0));
    if f(x0) == 0
        x = x0;
        k = 1;
        x_all = x; 
        return
    end
    
    % root estimates at first and second iterations
    x_prev = p0;
    x_curr = p1;
    % function evaluation at first iteration
    f_prev = f(p0);
    f_curr = f(p1);
    % preallocates array and stores estimate at 1st iteration
        x_all = zeros(1,k_max+1);
        x_all(1) = x_prev;
    % iteration
    for k = 2:k_max
        % stores results in arrays
        x_all(k) = x_curr;
        
        % updates root estimate
        x_next = x_curr - f_curr*(x_curr - x_prev)/(f_curr-f_prev);
 
        % terminates solver if converged
        if (abs(x_next-x_curr) < TOL)
            break;
        end
        
        f_next = f(x_next);
        % stores next and current root estimates for next iteration
        if f_next*f_curr < 0
            x_prev = x_curr;
            f_prev = f_curr;
        end
        x_curr = x_next;
        f_curr = f_next;
    end
    
    % converged root
    x = x_next;
    
    % stores converged result and trims array
        x_all(k+1) = x;
        x_all = x_all(1:(k+1));
end