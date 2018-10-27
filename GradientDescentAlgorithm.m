%Author:乔维松  MG1815003

%%
%梯度下降算法实现
clear;
clc;
close all;
load a1data.mat
%  x=rand(100000,1);
%  y=rand(100000,1);

%  x=1:10;
%  y=[1.5 2 3.2 4.1 5.6 6.5 7.0 8.9 9.2 10];
  

theta=[0.5 0.5];
loss=220;
iterate_num=0;
step=0.005;
batch_num=200;
% syms x1 x2 xx yy
% f=(x1+x2*xx-yy)^2;
% fun=[diff(f,x1) diff(f,x2)]
v=[0 0];
u=[0 0];
w=[0 0];
lamda=0.9;

G=[0 0];
kese=0.1;

Eg=[0.1 0.1];


gama1=0.9;
gama2=0.9;

deltaseta2=[0 0];

%%
tic
while(loss>113 && iterate_num<3550)
    iterate_num=iterate_num+1;
    batch=randperm(length(x),batch_num);
    temp_x=zeros(batch_num,1);
    temp_y=zeros(batch_num,1);
    for i=1:batch_num
        temp_x(i)=x(batch(i));
        temp_y(i)=y(batch(i));
    end
    %gradient=GradientCompute(batch_num,theta,temp_x,temp_y);   %采用函数求梯度
    
    %%

    
    %------不采用任何技巧start-------------------
    %gradient=[sum(2*(theta(1)+theta(2)*x-y))/batch_num sum(2*(theta(1)+theta(2)*x-y).*x)/batch_num];
    %theta=[theta(1)-gradient(1)*step theta(2)-gradient(2)*step];
    %------不采用任何技巧end-------------------
    
    
    %%
%     %------采用动量法start-------------------
%     gradient=[sum(2*(theta(1)+theta(2)*x-y))/batch_num sum(2*(theta(1)+theta(2)*x-y).*x)/batch_num];
%     v=[gradient(1)*step*+v(1) gradient(2)*step+v(2)];
%     theta=[theta(1)-v(1) theta(2)-v(2)];
%     %------采用动量法end-------------------
%     

     %%
%     %------采用加速梯度法start-------------------
%      gradient=[sum(2*(theta(1)-v(1)+(theta(2)-v(2))*x-y))/batch_num sum(2*(theta(1)-v(1)+(theta(2)-v(2))*x-y).*x)/batch_num];
%      v=[gradient(1)*step*+v(1) gradient(2)*step+v(2)];
%      theta=[theta(1)-v(1) theta(2)-v(2)];
%     %------采用加速梯度法end-------------------
%  

     %%
%     %------采用Adagrad法start-------------------
%      gradient=[sum(2*(theta(1)+theta(2)*x-y))/batch_num sum(2*(theta(1)+theta(2)*x-y).*x)/batch_num];
%      G=G+gradient.^2;
%      AdaPameter=[sqrt(G(1)+kese) sqrt(G(2)+kese)];
%      theta=[theta(1)-step*gradient(1)/AdaPameter(1) theta(2)-step*gradient(2)/AdaPameter(2)];
%     %------采用Adagrad法end-------------------
    
    
    %%
%     %------采用Adadelta1法start-------------------
%      gradient=[sum(2*(theta(1)+theta(2)*x-y))/batch_num sum(2*(theta(1)+theta(2)*x-y).*x)/batch_num];
%      Eg=lamda*Eg+(1-lamda)*gradient.^2;
%      AdadeltaParameter=[sqrt(Eg(1)+kese) sqrt(Eg(2)+kese)];
%      theta=[theta(1)-step*gradient(1)/AdadeltaParameter(1) theta(2)-step*gradient(2)/AdadeltaParameter(2)];
%     %------采用Adadelta1法end-------------------
    
    
    %%
    %------采用Adam法start-------------------
%      gradient=[sum(2*(theta(1)+theta(2)*x-y))/batch_num sum(2*(theta(1)+theta(2)*x-y).*x)/batch_num];
%      v=gama1*v+(1-gama1)*gradient;
%      u=gama2*u+(1-gama2)*gradient.^2;
%      new_v=v/(1-gama1^iterate_num);
%      new_u=u/(1-gama2^iterate_num);
%      theta=[theta(1)-step*new_v(1)/sqrt(new_u(1)+kese) theta(2)-step*new_v(2)/sqrt(new_u(2)+kese)];
    %------采用Adam法end-------------------
    
    %%
    %------采用推荐法（全部融合。不一定好）start-------------------
     %gradient=[sum(2*(theta(1)+theta(2)*x-y))/batch_num sum(2*(theta(1)+theta(2)*x-y).*x)/batch_num];
     gradient=[sum(2*(theta(1)-lamda*v(1)+(theta(2)-lamda*v(2))*x-y))/batch_num sum(2*(theta(1)-lamda*v(1)+(theta(2)-lamda*v(2))*x-y).*x)/batch_num];
     v=lamda*v+(1-lamda)*gradient;
     u=lamda*u+(1-lamda)*gradient.^2;
     w1=w;
     w=lamda*w+(1-lamda)*deltaseta2;
     t=theta;
     theta=theta-sqrt(w1+kese).*v./sqrt(u+kese);
     deltaseta2=theta.^2-t.^2;
    %------采用推荐法end-------------------
    
    
    %%
    
    hypothesis=theta(1)+theta(2)*x;
    loss=norm(theta(1)+theta(2)*x-y);    
    disp(['第',num2str(iterate_num),'次迭代的loss为：',num2str(loss)]);
    
end
toc
theta
scatter(x,y,3,'b');
hold on;
plot(x,hypothesis)
