clear;
close all;
clc;

% the clt tells you what is the distribution of the average of n random
% variables
% we will vary n from 5 to some large value to demonstrate this
% Note: make sure that you have enough ram on your machine to store a 6000
% x 10000 array!
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
    
    mu = mean(X);
    sigma = std(X);
    g = normcdf([1, 2, 3, 4, 5],mu,sigma);
    
    [f,x] = ecdf(X(1,:));
    plot(x,f); hold on; 
    plot([1, 2, 3, 4, 5], g);
    fname = sprintf('b %d.png',n);
    saveas(fig,fname);
end