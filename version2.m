%%
%小批量梯度下降算法实现
clear;
clc;
close all;
 load a1data.mat
% x=rand(100000,1);
% y=rand(100000,1);
theta=[0.5 0.5];
loss=220;
iterate_num=0;
step=0.005;
batch_num=160;
tic
while(loss>120||iterate_num<5000)
% while(loss~=loss0)
%     tic
%     batch=randperm(size(x,1));
%     batch=batch(1:batch_num);     %随机选择的点集
    batch=randperm(length(x),batch_num);
    temp_x=zeros(batch_num,1);
    temp_y=zeros(batch_num,1);
%     toc
    for i=1:batch_num
        temp_x(i)=x(batch(i));
        temp_y(i)=y(batch(i));
    end
    
    
    gradient_1=sum(2*(theta(1)+theta(2)*temp_x-temp_y))/batch_num;
    gradient_2=sum(2*(theta(1)+theta(2)*temp_x-temp_y).*temp_x)/batch_num;
    
   
    theta=[theta(1)-gradient_1*step theta(2)-gradient_2*step];
    iterate_num=iterate_num+1;
    hypothesis=theta(1)+theta(2)*x;
    loss=norm(theta(1)+theta(2)*x-y);
    disp(['第',num2str(iterate_num),'次迭代的loss为：',num2str(loss)])
end
toc
theta
plot(x,y,'r',x,hypothesis)
