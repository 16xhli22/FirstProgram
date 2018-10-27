%%
%梯度下降算法实现
clear;
clc;
close all;
%load a1data.mat
%   x=rand(100000,1);
%   y=rand(100000,1);
%   x=1:10;
%   y=[1.5 2 3.2 4.1 5.6 6.5 7.0 8.9 9.2 10];
  

theta=[0.5 0.5];
loss=220;
iterate_num=0;
step=0.005;
tic
while(loss>91.4)
    gradient_1=sum(2*(theta(1)+theta(2)*x-y))/length(x);
    gradient_2=sum(2*(theta(1)+theta(2)*x-y).*x)/length(x);
    theta=[theta(1)-gradient_1*step theta(2)-gradient_2*step];
    iterate_num=iterate_num+1;
    hypothesis=theta(1)+theta(2)*x;
    loss=norm(theta(1)+theta(2)*x-y);    
    disp(['第',num2str(iterate_num),'次迭代的loss为：',num2str(loss)])
    
end
toc
theta
plot(x,y,'r',x,hypothesis)
