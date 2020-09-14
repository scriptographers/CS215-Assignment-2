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
    
    mu = 3; % True mean calculated in the report
    sigma = 1.3^0.5; % True std dev. calculated in the report
    
    [f,x] = ecdf(X(1,:));
    stairs(x,f); hold on; 
    x_values = linspace(1,5);
    plot(x_values,normcdf(x_values,mu,sigma));
    title(sprintf('CDF of X_{avg} with N=%d and CDF of Gaussian approx.', n));
    ylabel('CDF(x)')
    xlabel('x');
    fname = sprintf('b_%d.png',n);
    saveas(fig,fname);
end