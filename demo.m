d500 = lasso_gd(500);
d1000 = lasso_gd(1000);
d2000 = lasso_gd(2000);

semilogy(d500);
hold on
semilogy(d1000);
hold on
semilogy(d2000);
legend('d500','d1000','d2000')