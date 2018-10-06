function [ Data ] = Model_Gen_Sparse_linear( param )

%   Model: y = Xw + e
%   1. X: [m*n], each column of X is one sample data;
%   2. y: [n*1], is the label of each sample data.A(i,:).
%   3. m: [m*1], is the number of features.

para_noise  = param.noise;
n           = param.n;
p           = param.p;
sparsity    = param.sparsity;

true_w      = sprand(p,1,sparsity);
%% Generate X
% omega = rand;
omega = 0;
Z           = randn(p, n);
X           = zeros(p, n);
X(1,:)      = Z(1,:) / sqrt(1 - omega^2);
for i=1:(p-1)
    X(i+1,:)= omega*X(i,:) + Z(i+1,:);
end

%% Generate y
noise       = para_noise * randn(n, 1);
y           = X' * true_w + noise;

Data.X = X;
Data.y = y;
Data.w_star = true_w;
end