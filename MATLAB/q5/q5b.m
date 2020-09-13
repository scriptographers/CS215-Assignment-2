clear;
close all;
clc;

for n=[5 10 20 50 100 200 500 1000 5000 10000]
    fig = figure('visible','off');
    
    X = rand(1,n);
    Y = X;
    Y(X < 0.05) = 1;
    Y(X >= 0.05 & X < 0.45) = 2;
    Y(X >= 0.45 & X < 0.60) = 3;
    Y(X >= 0.60 & X < 0.90) = 4;
    Y(X >= 0.90) = 5;
    X = Y;
    clear Y;
    
    mu = 3; % Calculated in the report
    sigma = 1.3^0.5; % Calculated in the report
    g = normcdf([1, 2, 3, 4, 5],mu,sigma);
    
    [f,x] = ecdf(X(1,:));
    plot(x,f); hold on; 
    plot([1, 2, 3, 4, 5], g);
    title(sprintf('CDF of X_{avg} with N=%d and CDF of Gaussian approx.', n));
    ylabel('CDF(x)')
    xlabel('x');
    fname = sprintf('b_%d.png',n);
    saveas(fig,fname);
end