x0 = [1 1 1 1 1];
x1 = [2.7 4.1 1.0 5.2 2.8];
x2 = [1 1 0 1 0];
x = [x0;x1;x2]';

a = 0.02; %步长
b = 0.02; %精确度

y = [25 33 15 45 22]';


%线性回归
plot3(x1,x2,y,"*-")

%算法
w_last = [0,0,0]';
w_next = w_last - a/length(y).*(x'*x*w_last - x'*y);
while (sum(abs(w_last-w_next)>=b))
    w_last = w_next;
    w_next = w_last - a/length(y).*(x'*x*w_last - x'*y);
end

y1 = w_next(1)+w_next(2).*x1+w_next(3).*x2;
hold on
plot3(x1,x2,y1,"o-")
hold off
legend("training data","prediction")
title("Linear Regression Examples")
```
{{< math >}}
$$
W^* = \left(\begin{matrix}2.23437521245057\\7.61927519021201\\1.51466332589316\end{matrix}\right),
Y^* = \left(\begin{matrix}24.3210815519162\\34.9880668182130\\9.85365040266258\\43.3692695274462\\23.5683457450442\end{matrix}\right),
Y = \left(\begin{matrix}25\\33\\15\\45\\22\end{matrix}\right)