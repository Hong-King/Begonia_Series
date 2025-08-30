x0 = [1 1 1 1 1];
x1 = [2.7 4.1 1.0 5.2 2.8];
x2 = [1 1 0 1 0];
x = [x0;x1;x2]';

y = [25 33 15 45 22]';

%线性回归
plot3(x1,x2,y,"*-")

%算法
w = (x'*x)^(-1)*x'*y;

y1 = w(1)+w(2).*x1+w(3).*x2;
hold on
plot3(x1,x2,y1,"o-")
hold off
legend("training data","prediction")
title("Linear Regression Examples")