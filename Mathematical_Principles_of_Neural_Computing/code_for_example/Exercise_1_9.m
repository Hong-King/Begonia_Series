X = [-0.5 -1 0.5 -0.2 -0.8 -0.15 -1 0;
    0.25 -0.1 0 -0.3 0 -0.5 0 -0.25;
    -0.8 -0.1 0.25 0.2 -0.8 0.05 -1 0.25;
    -1 -1 0.1 0 -1 -0.25 -1 0.1];

Species  = [1 1 -1 -1 1 -1 1 -1];

% 算法实现
SizeSample = length(Species); % size of sample
nsample = 1; %抽取的样本数
C = 0.1; %步长
t = 0; %update
eta = C;
w_last = zeros(4,1);
r_last = zeros(4,1);
nupdate = 80; % number of nupdate


X_t = X(:,mod(t,8)+1);
Y_t = Species(mod(t,8)+1);
IndexSample = (Y_t.*(w_last'*X_t) < 1);
X_t = X_t.*IndexSample;
Y_t = Y_t.*IndexSample;
g = ((1-Y_t.*(w_last'*X_t))*(Y_t'.*X_t'))';
r_next = r_last + g.^2;
w_next = w_last + (eta./(10^(-6)+r_next.^(0.5))).*g;

while (t < nupdate)
    w_last = w_next;
    r_last = r_next;
    t = t+1;
    eta = C;
    X_t = X(:,mod(t,8)+1);
    Y_t = Species(:,mod(t,8)+1);
    IndexSample = (Y_t.*(w_last'*X_t) < 1);
    X_t = X_t.*IndexSample;
    Y_t = Y_t.*IndexSample;
    g = ((1-Y_t.*(w_last'*X_t))*(Y_t'.*X_t'))';
    r_next = r_last + g.^2;
    w_next = w_last + (eta./(10^(-6)+r_next.^(0.5))).*g;
end

yy = w_next'*X;