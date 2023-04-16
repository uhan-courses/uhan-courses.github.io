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
for r = 1 : m
    [S_path, T_path] = simulation();
end