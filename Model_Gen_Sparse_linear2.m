function [ Data ] = Model_Gen_Sparse_linear2( param )

%   Model: y = Xw + e
%   1. X: [m*n], each column of X is one sample data;
%   2. y: [n*1], is the label of each sample data.A(i,:).
%   3. m: [m*1], is the number of features.
para_noise  = param.noise;
n           = param.n;
p           = param.p;
sparsity    = param.sparsity;
true_w      = exp(-[1:p].^(0.5));
true_w      = proj_L1_Linf(true_w', 1);
%% Generate X
X           = randn(n, p);
r           = exp(-[1:p])./exp(-1);
Sigma       = toeplitz(r);
X           = X * sqrtm(Sigma);
X           = X';
%% Generate y
noise       = para_noise * randn(n, 1);
y           = X' * true_w + noise;
%% Save for output
Data.X      = X;
Data.y      = y;
Data.w_star = true_w;
end