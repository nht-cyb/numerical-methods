clear; clc; close all;
% Description: Solves an IVP using the Midpoint method
% Analytical Solution
yan = @(x) exp(-2*x).*(2*exp(x) + exp(4*x) + 1);
xspan = [0,0.6];
hold on
fplot(yan,xspan,'DisplayName','Analytical')
odefun = @(t,y) [   y(2);
                    y(3);
                    -y(3)+4*y(2)+4*y(1)     ];
y0 = [4,-2,10];
% Midpoint Method
dx = 0.03;
[t,y] = midpoint_ivp(odefun,xspan,y0,dx);
plot(t,y(:,1),'^','DisplayName','Midpoint')
xlabel('x')
ylabel('u')
grid on
legend('Location','North')