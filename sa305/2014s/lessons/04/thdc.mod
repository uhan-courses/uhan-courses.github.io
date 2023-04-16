# Define decision variables and variable bounds
var S >= 0;
var H >= 0;
var M >= 0;

# Objective function
maximize total_profit: 35*S + 45*H + 65*M;

# General constraints
subject to machine1: 3*S + 6*H + 8*M <= 120;
subject to machine2: 4*S + 5*H + 6*M <= 100;
subject to manpower: (5+6)*S + (8+7)*H + (11+9)*M <= 280;
subject to demand: M <= S + H;

end;