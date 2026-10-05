function [y1] = TaylorMethod(f,inter,y0,k)
t(1) = inter(1); %initial time
y1(1) = y0; y2(1) = 0; %setting the initial condition 
h = 0.1*(2.^-k); % setting the step size
n = 1/h; % number of steps in terms of the step size.
Ft = @(t,y) diff(f,t);
Fy = @(t,y) diff(f,y);
for i = 1:n
    t(i+1) = t(i) + h;    
    euler_y(i+1) = y(i) + h*f(t(i),y(i));
    y1(i+1) =  euler_y(i+1) + ((h^2)/2)*(Ft(t(i),y1(i)) + Fy(t(i),y1(i))*f(t(i),y1(i)));
end
