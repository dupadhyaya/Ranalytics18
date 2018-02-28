# Chapter 9 : Sensitivity Analysis
#http://www.excel-easy.com/data-analysis/solver.html

library(lpSolve)
library(lpSolveAPI)
lprec = make.lp(0,3)
# 0 contraints (add later) and 3 decision variables
dim(lprec)
lprec
set.objfn(lprec,c(100,300,50)) # Profit with each item
lp.control(lprec,sense='max')
lprec
#add.constraint(lprec, xt, type = c("<=", "=", ">="), rhs, indices, lhs)
#delete.constraint(lprec, constraints)
add.constraint(lprec, c(300,1200,50), "<=", 93000)
lprec
add.constraint(lprec, c(0.5,1,0.5), "<=", 101)
#delete.constraint(my.lp, 1)
lprec
dimnames(lprec) <- list(c("capital", "storage")
                ,c("bicyles", "mopeds", "childseats"))
lprec
#set.type(lps.model, 2, "binary")
select.solution(lprec, 2)
solve(lprec)
get.basis(lprec, nonbasic = FALSE)
#https://cran.r-project.org/web/packages/lpSolveAPI/lpSolveAPI.pdf
get.bounds(lprec, columns = 1:3)
get.column(lprec, 1)
get.objective(lprec)
get.variables(lprec)
get.constraints(lprec)
get.constr.type(lprec, constraints = 1:2, as.char = TRUE)
get.constr.value(lprec, side = c("rhs", "lhs"), constraints = 1:3)
get.constraints(lprec)
get.dual.solution(lprec)
get.kind(lprec, columns = 1:2)
get.mat(lprec, 2, 3)
get.primal.solution(lprec, orig = FALSE)
get.rhs(lprec, constraints = 1:2)
get.sensitivity.obj(lprec)
#objfrom a numeric vector of length n (where n is the number
#of decision variables in lprec) containing the values
#of the lower limits of the objective function.
#objtill - upper limits of the objective function
get.sensitivity.objex(lprec)
get.sensitivity.rhs(lprec)
get.variables(lprec)
#guess.basis(lprec, guess)
#lp.control(lprec, ..., reset = FALSE)
#plot.lpExtPtr # 2 decision variables
#resize.lp(lprec, nrow, ncol)
#


#http://web.mit.edu/15.053/www/AMP-Chapter-03.pdf
get.sensitivity.obj(lprec)
get.sensitivity.rhs(lprec)
get.solutioncount(lprec) 
get.total.nodes(lprec)
get.variables(lprec)
lpr my.lp$duals.from
my.