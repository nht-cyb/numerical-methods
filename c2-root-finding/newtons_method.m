%==========================================================================
% Phuong phap Newton
%
%   x = newtons_method(f,df,x0)
%   [x,k] = newtons_method(__)
%   [x,k,x_all] = newtons_method(__)
%--------------------------------------------------------------------------
% ------
% INPUT:
% ------
%   f       - (1×1 function_handle) univariate, scalar-valued function, 
%             f(x) (f : ℝ → ℝ)
%   df      - (1×1 function_handle) derivative of f(x) (f' : ℝ → ℝ)
%   x0      - (1×1 double) initial guess for root
%       • k_max      - (1×1 double) maximimum number of iterations 
%                      (defaults to 200)
%       • TOL        - (1×1 double) tolerance (defaults to 10⁻¹⁰)
% -------
% OUTPUT:
% -------
%   x       - (1×1 double) root of f(x)
%   k       - (1×1 double) number of solver iterations
%   x_all   - (1×(k+1) double) root estimates at all iterations
%==========================================================================
function [x,k,x_all] = newtons_method(f,df,x0)
    % ----------------------------------
    % Sets (or defaults) solver options.
    % ----------------------------------
    
    % sets maximum number of iterations (defaults to 200)
        k_max = 200;
    % sets tolerance (defaults to 10⁻¹⁰)
        TOL = 1e-10;
    % ----------------
    % Newton's method.
    % ----------------
    % returns initial guess if it is a root of f(x)
    if f(x0) == 0
        x = x0;
        k = 1;
        x_all = x;
        return
    end
  
    % root estimate at first iteration
    x_curr = x0;
    x_all = zeros(1,k_max+1);
    
    % iteration
    for k = 1:k_max
        x_all(k) = x_curr;
                
        % evaluates derivative at current root estimate
        df_curr = df(x_curr);
        
        % perturbs current root estimate if derivative is 0
        if df_curr == 0
            if x_curr ~= 0
                x_curr = x_curr*(1+100*TOL*abs(x_curr));
            else
                x_curr = 100*TOL;
            end
        end
        % updates root estimate
        x_next = x_curr-f(x_curr)/df_curr;
        % terminates solver if converged
        if (abs(x_next-x_curr) < TOL)
            break;
        end
        % stores updated root estimate for next iteration
        x_curr = x_next;
    end
    
    % converged root
    x = x_next;
    x_all(k+1) = x;
    x_all = x_all(1:(k+1));   
end