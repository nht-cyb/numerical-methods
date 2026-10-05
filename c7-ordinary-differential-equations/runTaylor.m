clc; clear all;
f =@(t,y)(5*(t^4)*y);%      --> this is function 'f'
inter = [0 1];
y0 = 1;
k=1;
Out = TaylorMethod(f,inter,y0,k);
plot(Out);
 
function [y1] = TaylorMethod(f,inter,y0,k)
    syms t y tp yp
    Ft1=subs(diff(f,t),{t,y},{tp,yp});
    Fy1=subs(diff(f,y),{t,y},{tp,yp});
    clear t y;
    t(1) = inter(1); %initial time
    y1(1) = y0;
    y2(1) = 0; %setting the initial condition 
    h = 0.1*(2.^-k); % setting the step size
    n = 1/h; % number of steps in terms of the step size.
    for i = 1:n-1
        t(i+1) = t(i) + h;    
        euler_y(i+1) = y1(i) + h*f(t(i),y1(i));
        y1(i+1) =  euler_y(i+1) + ((h^2)/2)*(subs(Ft1,{tp,yp}, {t(i),y1(i)}) + 					subs(Fy1,{tp,yp},{t(i),y1(i)})*f(t(i),y1(i)));
    end
end
