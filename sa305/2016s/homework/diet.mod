# Model file for the diet problem

## Input parameters ##
set N;                     # set of nutrients
set F;                     # set of foods 
param c{j in F};            # cost of food j
param f_min{j in F};       # recommended lower limit on food j;
param f_max{j in F};       # recommended upper limit on food j;
param n_min{i in N};       # recommended lower limit on nutrient i
param n_max{i in N};       # recommended upper limit on nutrient i
param a{i in N,j in F};    # amount of nutrient i in 1 unit of food j

## Decision variables and variable bounds ##

## Objective function ##

## General constraints ##

end;

