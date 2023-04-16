# Model file for Farmer Jones's problem in Lesson 11

## Input parameters ##
set K;                    # set of cake types
set I;                    # set of ingredients
param p{j in K};          # p[k] = profit for cake type k
param b{i in I};          # b[i] = amount of ingredient i available
param a{i in I, j in K};  # a[i,k] = amount of ingredient i used in 1 type k cake

## Decision variables and variable bounds ##
var x{k in K} >= 0;       # x[k] = number of type j cakes to produce

## Objective function ##
# Maximize total profit 
maximize total_profit: 
  sum{k in K} p[k] * x[k];

## General constraints ##
# Amount of ingredient i used <= amount of ingredient i available
subject to ingredient_avail{i in I}:
  sum{k in K} a[i,k] * x[k] <= b[i];

end;
