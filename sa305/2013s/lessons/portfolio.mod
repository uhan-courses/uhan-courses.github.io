# Model for portfolio problem in Lesson 12

## Input parameters ##
set Bonds;                      # set of bonds
param quality{i in Bonds};      # quality rating for each bond  
param years{i in Bonds};        # years to maturity for each bond
param yield{i in Bonds};        # yield at maturity for each bond
param funds_avail;              # funds available
param quality_upper;            # upper limit on average quality
param years_lower;              # lower limit on average years to maturity
param years_upper;              # upper limit on average years to maturity

## Decision variables and variable bounds ##
var x{i in Bonds} >= 0;         # amount to invest in each bond

## Objective function ##
# Maximize total earnings
maximize total_earnings:
  sum{i in Bonds} yield[i] * x[i];

## Constraints ##
# Amount invested <= funds available  
subject to funds_avail_con:
  sum{i in Bonds} x[i] <= funds_avail;

# Upper limit on average quality
subject to quality_upper_con:
  sum{i in Bonds} quality[i] * x[i] <= quality_upper * (sum{i in Bonds} x[i]);

# Lower limit on average years to maturity 
subject to years_lower_con:
  sum{i in Bonds} years[i] * x[i] >= years_lower * (sum{i in Bonds} x[i]);

# Upper limit on average years to maturity 
subject to years_upper_con:
  sum{i in Bonds} years[i] * x[i] <= years_upper * (sum{i in Bonds} x[i]);

end;

