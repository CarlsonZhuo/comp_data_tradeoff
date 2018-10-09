function [ hist, w_estimated ] = Alg_SVRG( Data, param)
X = Data.X;
y = Data.y;
lambda = param.lambda;
max_it = param.max_it;
n = param.n;
p = param.p;
Lmax   = (0.25 * max(sum(X.^2,2)) + lambda);
hist   = zeros(max_it,1);

% alpha = 1 / (4*n^2*Lmax); % The learning rate
alpha = 0.000001; % The learning rate
w_prev = zeros(p, 1);


for k = 1:max_it
    mu = X*(X'*w_prev - y);
    w_tilda = w_prev;
%     rnd_idx = [randperm(n),randperm(n)];
    for t = 1:2*n
        idx = randi([1 n]);
%         idx = rnd_idx(t);
        w_tilda_new = w_tilda - alpha * ...
            ((X(:,idx)'*w_tilda - y(idx)) * X(:,idx) - ...
            (X(:,idx)'*w_prev - y(idx)) * X(:,idx) + mu);
        w_tilda = proj_L1_Linf(w_tilda_new, 1);
    end
    w_prev = w_tilda;
    hist(k) = norm(w_prev - param.SVRG_w_hat);
end
w_estimated = w_prev;
end