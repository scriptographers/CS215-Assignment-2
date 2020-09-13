clear;
close all;
clc;

for n=[5 10 20 50 100 200 500 1000 5000 10000]
    fig = figure('visible','off');
    nsamp = 2000; % to plot a histogram we need several samples for the average
    
    X = rand(nsamp,n);
    Y = X;
    Y(X < 0.05) = 1;
    Y(X >= 0.05 & X < 0.45) = 2;
    Y(X >= 0.45 & X < 0.60) = 3;
    Y(X >= 0.60 & X < 0.90) = 4;
    Y(X >= 0.90) = 5;
    X = Y;
    clear Y;
    
    sumX = sum(X,2)/n;
    
    numbins = 50; % we use 50 bins for our histogram
    
    histogram(sumX,numbins);
    title(sprintf('Distribution of X_{avg} with N=%d', n));
    xlabel('x');
    fname = sprintf('a_%d.png',n);
    saveas(fig,fname);
end