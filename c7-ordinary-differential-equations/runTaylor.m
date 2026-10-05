clc; clear all;
f =@(t,y)(5*(t^4)*y);%      --> this is function 'f'
inter = [0 1];
y0 = 1;
k=1;
Out = TaylorMethod(f,inter,y0,k);
plot(Out);
