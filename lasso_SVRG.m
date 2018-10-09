function [ hist ] = lasso_SVRG(p,n)
%% Get the data X, y
%   1. X: [p*n], each column of X is one sample data;
%   2. y: [n*1], is the label of each sample data.A(i,:).
%   3. w: [p*1], is the number of features.

param.p = p;
param.sparsity = 1/log(param.p);
param.noise = 0.25;
% param.n = alpha*ceil(log(param.p))^2;
param.n = n;

Data = Model_Gen_Sparse_linear(param);


%% Get the approximation of the best parameter
param.lambda = 1e-9;
param.max_it = 200;
param.mb = 1;

%% Get w_hat for GD and SVRG (time for space)
param.SVRG_w_hat = zeros(param.p, 1);
[histSVRG_l1, w_SVRG] = Alg_SVRG(Data, param);
param.SVRG_w_hat = w_SVRG;


% SVRG
param.max_it = param.max_it - 5;
tic;
[histSVRG_l1, w_SVRG] = Alg_SVRG(Data, param);
time_SVRG = toc;
fprintf('Time spent on SVRG: %f seconds \n', time_SVRG);
hist = histSVRG_l1;
