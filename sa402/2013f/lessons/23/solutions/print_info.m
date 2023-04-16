function print_info()

% Global variables: simulation variables
global n            % system event counter 
global S            % state variables
global T            % event epoch
global C            % clock

% Print the current values of n, T, S, and C
fprintf(1, 'Event counter n = %d\n', n);
fprintf(1, '  Event epoch T = %f\n', T);
fprintf(1, '  State variables S = ');
fprintf(1, '%f ', S);
fprintf(1, '\n');
fprintf(1, '  Clock C = ');
fprintf(1, '%f ', C);
fprintf(1, '\n\n');