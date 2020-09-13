clear;
close all;
clc;

% the clt tells you what is the distribution of the average of n random
% variables
% we will vary n from 5 to some large value to demonstrate this
% Note: make sure that you have enough ram on your machine to store a 6000
% x 10000 array!
mad = [];
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
    
    mu = mean(X);
    sigma = std(X);
    
    [f,x] = ecdf(X(1,:));
    g = normcdf(x,mu,sigma);

    mad = [mad, max(abs(f-g))];
end

fig = figure('visible','off');
plot([5 10 20 50 100 200 500 1000 5000 10000], mad)
fname = sprintf('c.png');
saveas(fig,fname);
