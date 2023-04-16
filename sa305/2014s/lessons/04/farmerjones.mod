# Define decision variables and variable bounds
var C >= 0;
var V >= 0;

# Objective function
maximize total_profit: 3*C + 4*V;

# General constraints
subject to eggs: 4*C + 2*V <= 32;
subject to flour: 4*C + 6*V <= 48;

end; 
