function [gradient]= GradientCompute(batch_num,theta,x,y)
%     syms x1 x2 xx yy
%     x1=theta(1);
%     x2=theta(2);
%     xx=x;
%     yy=y;
%     fun1=subs(fun,{x1,x2,xx,yy},{theta(1),theta(2),x,y});
%     fun1=eval(fun);
%     gradient=[sum(fun1(1))/length(x),sum(fun1(2))/length(x)];
    gradient=[sum(2*(theta(1)+theta(2)*x-y))/batch_num sum(2*(theta(1)+theta(2)*x-y).*x)/batch_num];
end
