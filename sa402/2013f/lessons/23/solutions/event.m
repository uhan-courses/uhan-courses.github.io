% event()
%
% event(I) runs the system event subroutine for event type I
%
function event(I)

% Global variables: simulation variables
global n            % system event counter 
global S            % state variables
global T            % event epoch
global C            % clock

% Global variables: queueing system parameters
global s lambda mu

% State variables S = [S(1); S(2); S(3); S(4)]
% S(1) = 0 if server 1 is available, 1 otherwise
% S(2) = 0 if server 2 is available, 1 otherwise
% S(3) = 0 if server 3 is available, 1 otherwise
% S(4) = number of customers in system

% Event 0 subroutine
if (I == 0)
    S = zeros(4,1);
    C(4) = exprnd(1/lambda);
    
% Event 1 subroutine
elseif (I == 1)
    S(4) = S(4) - 1;
    if (S(4) >= s)
        % C(1) = T + exprnd(1/mu);          % exponential service times
        C(1) = T + unifrnd(1/24, 7/24);     % uniform service times
    else
        S(1) = 0;
        C(1) = Inf;
    end

% Event 2 subroutine
elseif (I == 2)
    S(4) = S(4) - 1;
    if (S(4) >= s)
        % C(2) = T + exprnd(1/mu);          % exponential service times
        C(2) = T + unifrnd(1/24, 7/24);     % uniform service times
    else
        S(2) = 0;
        C(2) = Inf;
    end

% Event 3 subroutine
elseif (I == 3)
    S(4) = S(4) - 1;
    if (S(4) >= s)
        % C(3) = T + exprnd(1/mu);          % exponential service times
        C(3) = T + unifrnd(1/24, 7/24);     % uniform service times
    else
        S(3) = 0;
        C(3) = Inf;
    end

% Event 4 subroutine
elseif (I == 4)
    S(4) = S(4) + 1;
    if (S(4) <= s)
        if (S(1) == 0)
            S(1) = 1;
            % C(1) = T + exprnd(1/mu);      % exponential service times
            C(1) = T + unifrnd(1/24, 7/24); % uniform service times
        elseif (S(2) == 0)
            S(2) = 1;
            % C(2) = T + exprnd(1/mu);      % exponential service times
            C(2) = T + unifrnd(1/24, 7/24); % uniform service times
        elseif (S(3) == 0)
            S(3) = 1;
            % C(3) = T + exprnd(1/mu);      % exponential service times
            C(3) = T + unifrnd(1/24, 7/24); % uniform service times
        end
    end
    C(4) = T + exprnd(1/lambda);
  
end