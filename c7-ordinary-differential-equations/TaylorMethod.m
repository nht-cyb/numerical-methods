function [y1] = TaylorMethod(f,inter,y0,k)
% Taylor method of order 2 for y' = f(t,y), y(inter(1)) = y0, step h = 0.1*2^-k
% Needs the Symbolic Math Toolbox to differentiate f.
syms t y tp yp
Ft1=subs(diff(f,t),{t,y},{tp,yp});
Fy1=subs(diff(f,y),{t,y},{tp,yp});
clear t y;
t(1) = inter(1); %initial time
y1(1) = y0; %setting the initial condition
h = 0.1*(2.^-k); % setting the step size
n = round((inter(2)-inter(1))/h); % number of steps in terms of the step size.
for i = 1:n
    t(i+1) = t(i) + h;
    euler_y = y1(i) + h*f(t(i),y1(i));
    y1(i+1) = double(euler_y + ((h^2)/2)*(subs(Ft1,{tp,yp},{t(i),y1(i)}) + subs(Fy1,{tp,yp},{t(i),y1(i)})*f(t(i),y1(i))));
end
end
