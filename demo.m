rep = 2;
fprintf('Current i: 1\n');
time = lasso_SVRG(10000,9000);
for i = 2:rep
    fprintf('Current i: %d \n', i);
    time = [time; lasso_SVRG(10000,9000)];
end