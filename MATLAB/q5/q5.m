clear;
close all;
clc;

mad = []; % I didn't pre-allocate as the size of mad is small.
for N=[5 10 20 50 100 200 500 1000 5000 10000] % Looping over values of N
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Sampling %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    nsamp = 2000; % we need several samples for the average (Xavg)

    % Returns a nsamp*N matrix filled Random variables
    % of uniform distribution from [0,1]
    Y = rand(nsamp,N);
    X = Y; % Saved Y in X
    X(Y < 0.05) = 1; % P(1) = 0.05
    X(Y >= 0.05 & X < 0.45) = 2; % P(2) = 0.4
    X(Y >= 0.45 & X < 0.60) = 3; % P(3) = 0.15
    X(Y >= 0.60 & X < 0.90) = 4; % P(4) = 0.3
    X(Y >= 0.90) = 5; % P(5) = 0.1
    clear Y; % Freed memory
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% X_avg(N) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Xavg = sum(X,2)/N; % X_avg(N) = summation(X_i/N) from i=1 to N
    mu = 3; % True mean calculated in the report
    sigma = (1.3/N)^0.5; % True std dev. calculated in the report
    [f,x] = ecdf(Xavg(:,1)); % Empirical cdf of Xavg
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Part (a) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    fig = figure('visible','off'); % Created a new figure
    numbins = 50; % 50 bins for the histogram
    histogram(Xavg,numbins); % Making histogram
    title(sprintf('Distribution of X_{avg} with N=%d', N)); % Title
    xlabel('x'); % X-axis Label
    fname = sprintf('a_%d.png',N); % Filename
    saveas(fig,fname); % Save the figure
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Part (b) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    fig = figure('visible','off'); % Created a new figure
    stairs(x,f); hold on; % Used stairs to plot the cdf
    x_values = linspace(min(x),max(x)); % Array to plot Gaussian approx.
    plot(x_values,normcdf(x_values,mu,sigma)); % Plot Gaussian approx.
    title(sprintf('CDF of X_{avg} with N=%d & CDF of Gaussian approx.',N));
    ylabel('CDF(x)') % X-axis Label
    xlabel('x'); % Y-axis Label
    fname = sprintf('b_%d.png',N); % Filename
    saveas(fig,fname); % Save the figure
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Part (c) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    g = normcdf(x,mu,sigma); % Get the Gaussian approx at all x
    mad = [mad, max(abs(f-g))]; % Calculate MAD
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Part (c) Cont. %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fig = figure('visible','off'); % Created a new figure
plot([5 10 20 50 100 200 500 1000 5000 10000], mad) % Plot MAD Vs N
title('Maximum Absolute Deviation Vs N'); % Title
xlabel('N'); % X-axis Label
ylabel('MAD'); % Y-axis Label
fname = sprintf('c.png'); % Filename
saveas(fig,fname); % Save the figure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
