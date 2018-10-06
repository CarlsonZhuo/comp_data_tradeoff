function [ hist ] = lasso_gd( p)
%% Get the data X, y
%   1. X: [p*n], each column of X is one sample data;
%   2. y: [n*1], is the label of each sample data.A(i,:).
%   3. w: [p*1], is the number of features.

param.n = 250;
param.p = p;
param.sparsity = 1/sqrt(param.p);
param.noise = 0.1;

Data = Model_Gen_Sparse_linear(param);

%% Get the approximation of the best parameter
param.lambda = 1e-8;
% param.lambda = 0;
param.max_it = 400;
param.mb = 1;

%% Get w_hat for GD and SVRG (time for space)
param.GD_w_hat = zeros(param.p, 1);
[histGD_l1, w_GD] = Alg_GD(Data, param);
param.GD_w_hat = w_GD;

param.max_it = param.max_it - 20;
% GD
tic;
[histGD_l1, w_GD] = Alg_GD(Data, param);
time_GD = toc;
fprintf('Time spent on GD: %f seconds \n', time_GD);
hist = histGD_l1;
