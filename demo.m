

%% GD demo
% d500 = lasso_gd(500,400);
% d1000 = lasso_gd(500,200);
% d2000 = lasso_gd(500,100);

% figure;
% semilogy(1:150,d500(1:150));
% hold on
% semilogy(1:150,d1000(1:150));
% hold on
% semilogy(1:150,d2000(1:150));
% legend('n=400','n=200','n=100')

d500 = lasso_SVRG(500,400);
d1000 = lasso_SVRG(500,200);
d2000 = lasso_SVRG(500,100);

figure;
semilogy(1:150,d500(1:150));
hold on
semilogy(1:150,d1000(1:150));
hold on
semilogy(1:150,d2000(1:150));
legend('n=400','n=200','n=100')