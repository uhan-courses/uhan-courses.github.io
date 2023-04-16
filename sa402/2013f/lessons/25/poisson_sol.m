clear all;

% Interval length
t = 500

% Number of points
n = 1000

% Points are distributed uniformly along the interval
locations = unifrnd(0, t, n, 1);

% Compute gaps between consecutive mines
locations_sorted = sort(locations);
gaps = locations_sorted(2:n) - locations_sorted(1:n-1);

% Histogram of gap sizes
edges = [0:0.5:5];      % histogram bin edges
figure(1)
bar(edges, histc(gaps, edges), 'histc')

% Histogram of draws from exponential random variable
% with parameter equal to the point frequency rate
lambda = n / t;
figure(2)
bar(edges, histc(exprnd(1/lambda, n, 1), edges), 'histc');