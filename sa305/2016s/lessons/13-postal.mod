# Model for postal employees problem in Lesson 13

## Input parameters ##
set days;                       # days of the week
set shifts;                     # shifts
set shift_days{j in shifts};    # days worked for each shift
param required{i in days};      # number of employees needed for each day 

## Decision variables and variable bounds ##
var x{j in shifts} >= 0;        # number of employees assigned to each shift

## Objective function ##
# Minimize total number of employees 
minimize total_employees: sum{j in shifts} x[j];

## General constraints ##
# Number of employees working on day i >= minimum required on day i
subject to employees_needed{i in days}:
  sum{j in shifts: i in shift_days[j]} x[j] >= required[i];

end;

