function [ hist, w_estimated ] = Alg_GD(Data, param)
X      = Data.X;
y      = Data.y;
lambda = param.lambda;
max_it = param.max_it;
n      = param.n;
p      = param.p;
Lmax   = (0.25 * max(sum(X.^2,2)) + lambda);
hist   = zeros(max_it,1);

% alpha  = 1 / (n*Lmax); 
alpha  = 0.0005;
w      = zeros(p, 1);

for k = 1:max_it
    mu = X*(X'*w - y);
    w = w - alpha*mu;
    w = proj_L1_Linf(w, 1);
    hist(k) = norm(w - param.GD_w_hat);
end
w_estimated = w;
end