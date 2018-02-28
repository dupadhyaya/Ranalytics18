# Assignment Problems
#https://artax.karlin.mff.cuni.cz/r-help/library/lpSolve/html/lp.assign.html
# transportation problems in which capactiyt from each source (person) is 1 and demand 
#at each destination is 1
lp.assign (cost.mat, direction = "min", presolve = 0, compute.sens = 0)
# cost.mat-Matrix of costs: the ij-th element is the cost of assigning source i to destination j.
# direction	- Character vector, length 1, containing either "min" (the default) or "max"
# presolve-Numeric: presolve? Default 0 (no); any non-zero value means "yes." Currently ignored.
# compute.sens - Numeric: compute sensitivity? Default 0 (no); any non-zero value means "yes." In that case presolving is attempted.

assign.costs <- matrix (c(2, 7, 7, 2, 7, 7, 3, 2, 7, 2, 8, 10, 1, 9, 8, 2), 4, 4)
## Not run: 
assign.costs
lp.assign(assign.costs)
## Not run: Success: the objective function is 8
lp.assign(assign.costs)$solution

# pg 453
assign.costs = matrix(c(11,14,6,8,10,11,9,12,7),nrow=3,byrow=T)
## Not run: 
assign.costs
lp.assign(assign.costs, direction = 'min')
lp.assign(assign.costs)$solution

# Pg 461
assign.costs = matrix(c(80,40,50,45,40,70,20,25
      ,20,0,10,20,35,20,25,30),nrow=4,byrow=T)
assign.costs
lpa1= lp.assign(assign.costs, direction = 'min')
lpa1
lpa1$solution
