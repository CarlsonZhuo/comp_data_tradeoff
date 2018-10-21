rep = 20;
fprintf('Current i: 1\n');
time = lasso_SVRG(1000,950);
for i = 2:rep
    fprintf('Current i: %d \n', i);
    time = [time; lasso_SVRG(1000,950)];
end