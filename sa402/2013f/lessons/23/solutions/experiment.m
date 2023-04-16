% experiment.m
% 
% Replicates the simulation in simulation() and event().
% Can be adapted to compute performance measures for the generated sample
%   paths, and an overall performance measure.
%

% Clear workspace
clear all

% Number of simulation replications
m = 100;

% Queueing system parameters
global s lambda mu
s = 3;              % number of servers
lambda = 16;        % arrival rate
mu = 6;             % service rate

% Simulation replications
delay = [];
for r = 1 : m
    [S_path, T_path] = simulation();
    
    % Sample path of number of customers in the system
    R_path = S_path(4,:);
    
    % Sample path of number of customers in the queue
    Q_path = max(R_path - s, 0);
    
    % Total delay: between T(i) and T(i+1), Q(i) customers are waiting
    total_delay = 0;
    for i = 1 : length(Q_path) - 1
        total_delay = total_delay + (T_path(i+1) - T_path(i)) * Q_path(i);
    end
    
    % Total number of customer arrivals
    total_arrivals = 0;
    for i = 1 : length(R_path) - 1
        if (R_path(i+1) == R_path(i) + 1)
            total_arrivals = total_arrivals + 1;
        end
    end
    
    % Delay per customer
    delay = [delay, (total_delay / total_arrivals)];
end

% Expected delay
expected_delay = mean(delay)