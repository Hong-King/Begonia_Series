X = [-0.5 -1 0.5 -0.2 -0.8 -0.15 -1 0;
    0.25 -0.1 0 -0.3 0 -0.5 0 -0.25;
    -0.8 -0.1 0.25 0.2 -0.8 0.05 -1 0.25;
    -1 -1 0.1 0 -1 -0.25 -1 0.1];

Species  = [1 1 -1 -1 1 -1 1 -1];

% 算法实现
SizeSample = length(Species); % size of sample
nsample = 8; %抽取的样本数
C = 0.5; %步长
t = 1; %update
eta = C;
w_last = zeros(4,1);
v_last = zeros(4,1);
nupdate = 25; % number of nupdate


X_t = X;
Y_t = Species;
IndexSample = (Y_t.*(w_last'*X_t) < 1);
X_t = X_t.*IndexSample;
Y_t = Y_t.*IndexSample;
w_next = w_last + ((eta/nsample).*(1-Y_t.*(w_last'*X_t))*(Y_t'.*X_t'))';

while (t < nupdate)
    w_last = w_next;
    t = t+1;
    eta = C;
    X_t = X;
    Y_t = Species;
    IndexSample = (Y_t.*(w_last'*X_t) < 1);
    X_t = X_t.*IndexSample;
    Y_t = Y_t.*IndexSample;
    w_next = w_last + ((eta/nsample).*(1-Y_t.*(w_last'*X_t))*(Y_t'.*X_t'))';
end

yy = w_next'*X;