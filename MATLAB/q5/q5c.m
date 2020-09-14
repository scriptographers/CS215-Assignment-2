clear;
close all;
clc;

mad = []; % I didn't pre-allocate as the size of mad is small. 
for n=[5 10 20 50 100 200 500 1000 5000 10000]
    X = rand(1,n);
    Y = X;
    Y(X < 0.05) = 1;
    Y(X >= 0.05 & X < 0.45) = 2;
    Y(X >= 0.45 & X < 0.60) = 3;
    Y(X >= 0.60 & X < 0.90) = 4;
    Y(X >= 0.90) = 5;
    X = Y;
    clear Y;
    
    mu = 3; % From in part (b)
    sigma = 1.3^0.5; % From in part (b)
    
    [f, x] = ecdf(X(1,:));
    g = normcdf(x,mu,sigma);
    
    mad = [mad, max(abs(f-g))];
end

fig = figure('visible','off');
plot([5 10 20 50 100 200 500 1000 5000 10000], mad)
title('Maximum Absolute Deviation Vs N');
xlabel('N');
ylabel('MAD');
fname = sprintf('c.png');
saveas(fig,fname);
