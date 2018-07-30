#lp.assign
#https://www.rdocumentation.org/packages/lpSolve/versions/5.6.13/topics/lp.assign
#https://rdrr.io/cran/lpSolve/src/R/lp.assign.R


#Interface to lp\_solve linear/integer programming system specifically for solving assignment problems

library(lpSolve)

#lp.assign (cost.mat, direction = "min", presolve = 0, compute.sens = 0)
#This is a particular integer programming problem. All the decision variables are assumed to be integers; each row has the constraint that its entries must add up to 1 (so that there is one 1 and the remaining entries are 0) and each column has the same constraint. This is assumed to be a minimization problem.


assign.costs <- matrix (c(2, 7, 7, 2, 7, 7, 3, 2, 7, 2, 8, 10, 1, 9, 8, 2), 4, 4)
assign.costs
#      [,1] [,2] [,3] [,4]
# [1,]    2    7    7    1
# [2,]    7    7    2    9
# [3,]    7    3    8    8
# [4,]    2    2   10    2

lp.assign (assign.costs)
## Not run: Success: the objective function is 8
lp.assign (assign.costs)$solution
