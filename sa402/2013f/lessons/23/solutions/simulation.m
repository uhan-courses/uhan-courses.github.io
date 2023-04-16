% simulation()
%
% Generic discrete event simulation algorithm.
%
% Adapted from:
%   B. Nelson. Stochastic Modeling: Analysis & Simulation.
%       Dover, 2010.
%
function [S_path, T_path] = simulation()

% ----- Setup ----- %
% Global variables: simulation variables
global n            % system event counter 
global S            % state variables
global T            % event epoch
global C            % clock

% Initialize vectors for the generated sample paths of S and T
% S(i,j) = jth value of state variable S(i)
% T(j) = jth event epoch
S_path = [];
T_path = [];

% Simulation stopping time
T_stop = 365;

% Number of system event types
k = 4;


% ----- Initialization ----- %
% Initialize vector of clock times
% C(i) = clock time for event i
C = Inf * ones(1,k);

% Initialize system event counter
n = 0;

% Initialize event epoch
T = 0;

% Execute initial system event
event(0)

% Update generated sample path
S_path = [S_path, S];
T_path = [T_path, T];

% Uncomment this to print information about current state
% print_info()


% ----- Main loop ----- %
while (1)
    % Advance time to next pending system event
    % Find index of the next system event
    % Note: C is a vector of clock times - each component corresponds to
    %   the clock time for 1 event type
    [T, I] = min(C);

    % Event I no longer pending
    C(I) = Inf;

    % Execute system event I
    event(I)

    % Update event counter
    n = n + 1;
    
    % Updated generated sample path
    S_path = [S_path, S];
    T_path = [T_path, T];
    
    % Uncomment this to print information about current state
    % print_info()
    
    % Stopping condition
    if (T > T_stop)
        break
    end
end