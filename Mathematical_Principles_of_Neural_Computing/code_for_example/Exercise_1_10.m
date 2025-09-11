X = [-0.5 -1 0.5 -0.2 -0.8 -0.15 -1 0;
    0.25 -0.1 0 -0.3 0 -0.5 0 -0.25;
    -0.8 -0.1 0.25 0.2 -0.8 0.05 -1 0.25;
    -1 -1 0.1 0 -1 -0.25 -1 0.1];

Species  = [1 1 -1 -1 1 -1 1 -1];

% 算法实现
SizeSample = length(Species); % size of sample
nsample = 8; %抽取的样本数
t = 0; %update
w_last = zeros(4,1);
nupdate = 8; % number of nupdate

X_t = X;
Y_t = Species;
%{
a = Y_t.*(w_last'*X_t) <= 0;
w_next = w_last + X_t(:,1)*Y_t(1)';
b = Y_t.*(w_next'*X_t) <= 0;
w_last = w_next;
w_next = w_last + X_t(:,6)*Y_t(6)';
c = Y_t.*(w_next'*X_t) <= 0;
%}

while (sum(Y_t.*(w_last'*X_t) <= 0) && t<nupdate)
    for i = 1:8
        if Y_t(i)*(w_last'*X_t(:,i)) <= 0
            t = t+1;
            w_next = w_last + (X_t(:,i)*Y_t(i)');
            break;
        end
    end
    w_last = w_next;
end