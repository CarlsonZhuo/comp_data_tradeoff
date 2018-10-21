function [ comp_time ] = lasso_SVRG(p, max_n)
%% Get the data X, y
%   1. X: [p*n], each column of X is one sample data;
%   2. y: [n*1], is the label of each sample data.A(i,:).
%   3. w: [p*1], is the number of features.

param.p = p;
param.sparsity = 1/log(param.p);
param.noise = 0.25;
% param.n = alpha*ceil(log(param.p))^2;
param.n = max_n;

Data = Model_Gen_Sparse_linear(param);

%% Get the approximation of the best parameter
param.lambda = 1e-9;
param.max_it = 300;
param.epsilon = 1e-6;
param.mb = 1;

num_samples = max_n:-10:200;
comp_time = size(num_samples);
figure;
for i = 1:size(num_samples,2)
    fprintf('\tCurrentl num_samples: %d \n', num_samples(i));
    idx = randsample(max_n, num_samples(i));
    re_sampled_data.X = Data.X(:,idx);
    re_sampled_data.y = Data.y(idx);

    % Get w_hat for GD and SVRG (time for space)
    param.SVRG_w_hat = zeros(param.p, 1);
    [histSVRG_l1, w_SVRG] = Alg_SVRG(re_sampled_data, param);
    param.SVRG_w_hat = w_SVRG;

    % SVRG
    param.max_it = param.max_it - 5;
    tic;
    [histSVRG_l1, w_SVRG] = Alg_SVRG(re_sampled_data, param);
    time_SVRG = toc;
    semilogy(histSVRG_l1);
    drawnow;
    hold on;
    comp_time(i) = time_SVRG;
end
