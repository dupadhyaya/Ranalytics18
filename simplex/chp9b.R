# Sensititive analysis
library(lpSolve)
library(lpSolveAPI)
library(Rsymphony)
library(Rglpk)
# From book Modeling and Solving LP with R
obj.fun = c(20,60)
constr = matrix(c(30,20,5,10,1,1), ncol=2, byrow=T)
constr
constr.dir = c('<=','<=','>=')
rhs = c(2700,850,95)
prod.sol = lp('max', obj.fun, constr, constr.dir, rhs
              , compute.sens=T)
prod.sol
prod.sol$objval
prod.sol$solution
prod.sol$duals
# Sensitivity analysis
prod.sol$duals.from
prod.sol$duals.to
prod.sol$sens.coef.from
prod.sol$sens.coef.to
