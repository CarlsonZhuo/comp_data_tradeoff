
%% Get the data X, y
%   1. X: [p*n], each column of X is one sample data;
%   2. y: [n*1], is the label of each sample data.A(i,:).
%   3. w: [p*1], is the number of features.


d500 = lasso_SVRG(500,400);
d1000 = lasso_SVRG(500,200);
d2000 = lasso_SVRG(500,100);

figure;
semilogy(1:4:160,d500(1:40));
hold on
semilogy(1:2:160,d1000(1:80));
hold on
semilogy(1:160,d2000(1:160));
legend('n=400','n=200','n=100')
title('SVRG: fix d=500 and change n')