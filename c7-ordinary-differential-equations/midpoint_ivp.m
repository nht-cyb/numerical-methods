function [t,y] = midpoint_ivp(fun,tspan,y0,dt)
% midpoint_ivp: Solves IVP using the Midpoint method.
% [t,y] = euler_ivp(fun,t0,y0,tN,dt):
%   Solves a system of differential equations y' = f(t,y) using the
%   midpoint method (Explicit)
% input: 
%   fun = fun is a function handle. For a scalar t and a vector y, 
%         fun(t,y) must return a column vector corresponding to f(t,y).
%   tspan   = A vector contining the the start time and end time, [t0 tN].
%   y0  = Intial value of y at t0
%   dt  = Step size
% output:
%   t = Values of t
%   y = Values of y calculated at all t

    t           = tspan(1):dt:tspan(2);
    nt          = numel(t);
    y           = zeros(nt, numel(y0));
    y(1,:)      = y0;
    
    for i = 1:nt-1
        ymid = y(i,:) + fun(t(i),y(i,:))' * dt /2; 
        y(i+1,:) = y(i,:) + fun(t(i)+dt/2,ymid)'*dt;
    end
end
