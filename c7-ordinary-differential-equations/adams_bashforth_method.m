function adams_bashforth_method(a,b,s,f,y0)
% s is the number of subinterval for the interpolation
k=3;                    % steps-1
x=linspace(a,b, s+1);   %network set creation
h=(b-a)/s;             %discretization of the network set
u=zeros(1,s+1);         %network function creation
u(1)=y0;                %initial condition of Cauchy problem
for i=1:k
    k_1=f(x(i),u(i));                            %k_1 
    k_2=f(x(i)+h./2,u(i)+((h./2).*k_1));         %k_2
    k_3=f(x(i)+h./2,u(i)+((h./2).*k_2));         %k_3
    k_4=f(x(i)+h,u(i)+(h.*k_3));                 %k_4
    u(i+1)=u(i)+(h/6).*(k_1+2.*(k_2+k_3)+k_4);   %Runge-Kutta
end
%Now that I know the initial four condition, as I set the step constant, I
%can evaluate the others u's by AB4 formula
for i=4:s 
    u(i+1) = u(i) + h/24*(55*f(x(i),u(i))-59*f(x(i-1),...
		 u(i-1))+37*f(x(i-2),u(i-2))-9*f(x(i-3),u(i-3)))
end
plot(x,u,'r');
title('Adams Bashforth 4th order method')
hold on
end
