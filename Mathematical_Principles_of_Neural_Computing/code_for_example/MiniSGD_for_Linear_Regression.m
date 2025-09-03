%Minibatch SGD

%Data
x0 = [1 1 1 1 1];
x1 = [2.7 4.1 1.0 5.2 2.8];
x2 = [1 1 0 1 0];
x = [x0;x1;x2]';

y = [25 33 15 45 22]';

plot3(x1,x2,y,"*-")

%Parameter
C = 0.06; %constant, used in learning rate(or step size)
b = 2; %number of sample
e = 0.02; %error

%Algorithm
w_last = [0,0,0]';

t = 1; %iterations
random = randi(length(x0),[1,b]);
x_t = x(random,:);
y_t = y(random);
w_next = w_last - C/(b*(t)^(0.5)).*(x_t'*x_t*w_last - x_t'*y_t);

while (sum(abs(w_last-w_next)>=e))
    w_last = w_next;
    t = t+1;
    random = randi(length(x0),[1,b]);
    x_t = x(random,:);
    y_t = y(random);
    w_next = w_last - C/(b*(t)^(0.5)).*(x_t'*x_t*w_last - x_t'*y_t);
end

y1 = w_next(1)+w_next(2).*x1+w_next(3).*x2;
hold on
plot3(x1,x2,y1,"o-")
hold off
legend("training data","prediction")
title("Minibatch SGD Examples")