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
    nsamp = 500; % to plot a histogram we need several samples for the average
    
    X = rand(nsamp,n);
    Y = X;
    Y(X < 0.05) = 1;
    Y(X >= 0.05 & X < 0.45) = 2;
    Y(X >= 0.45 & X < 0.60) = 3;
    Y(X >= 0.60 & X < 0.90) = 4;
    Y(X >= 0.90) = 5;
    X = Y;
    clear Y;
    
    %     mu = 0.95; % is the true mean of this distribution (you can check this)
    %     sig2 = 0.6475; % the true variance of this distribution - check this yourself
    
    % what is the meaning of this nsamp?
    % suppose we generate 'n' samples from the sampling distribution - we want
    % to examine the distribution of the average value of these samples
    % for that we need to build a histogram of samples of the average value
    % itself! For this we must repeat the process of generating 'n' samples
    % followed by computation of the average value, some 'nsamp' number of
    % times!
    
    % this is what is denoted as Y_j in the slides - except that we aren't
    % dividing by sqrt(sig2) there. the distribution of the quantity below
    % should converge to that of the standard normal.
    % in the lecture slides, it should converge to N(0,sig2)
    sumX = sum(X,2)/n;
    
    % we use 50 bins for our histogram
    numbins = 50;
    
    histogram(sumX,numbins); %minval+stepsize/2:stepsize:maxval-stepsize/2);
    title(sprintf('PDF of the average of %d iid random variables',n));
    fname = sprintf('a %d.png',n);
    saveas(fig,fname);
end