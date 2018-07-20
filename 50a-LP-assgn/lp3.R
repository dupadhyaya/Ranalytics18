# Assignement Problem
# Set up objective.
library(lpSolve)
ex.obj <- c( 592, 381, 273, 55, 48, 37, 23)
# The constraint needs to be a matrix.
ex.con <- matrix (c(3534, 2356, 1767, 589, 528, 451, 304), nrow=1)
#
# Create the sign and the right-hand side of the constraint.#
ex.sign <- "<="
ex.rhs <- 119567
#
# Require all seven variables to be integers. In general this
# vector will contain the indices of the integer variables.
#
ex.int <- 1:7
#
# Solve the linear program. By default print only the objective
#
library(lpSolve)
?lp
lp1 = lp("max", ex.obj, ex.con, ex.sign, ex.rhs, int.vec=ex.int)
#Success: the objective function is 19979
#lp1 -  Interface to lp\_solve linear/integer programming system
# Solve and print the vector of optimal values.
#
lp("max", ex.obj, ex.con, ex.sign, ex.rhs, int.vec=ex.int)$solution
#[1] 32 2 1 0 0 0 0
# Require only variables 1 and 3 to be integer
lp("max", ex.obj, ex.con, ex.sign, ex.rhs, int.vec=c(1, 3))$solution
#[1] 33.00 1.25 0.00 0.00 0.00 0.00 0.00

