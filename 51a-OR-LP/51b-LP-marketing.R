#LP - Marketing

#Final Model
#Max : 750 * x1 + 1000 * x2
#Subject To
#x1 + x2  <= 10
#x1 + 2 * x2  <= 15
#4*x1 + 3* x2 <= 25
#x1 >=  0
#x2 >= 0

library(lpSolveAPI)
(lprec <- make.lp(0, 2))
set.objfn(lprec, c(750, 1000)) ; lprec
lp.control(lprec, sense="max"); lprec #maximise it
set.type(lprec, c(1,2), type = c("integer")); lprec
add.constraint(lprec, c(1,1), "<=", 10) ;lprec
add.constraint(lprec, c(1,2), "<=", 15) ;lprec
add.constraint(lprec, c(4,3), "<=", 25) ;lprec
set.bounds(lprec, lower = c(0, 0), columns = c(1, 2));lprec
ColNames <- c("Notebook", "Desktop")
RowNames <- c("Allocated", "ChipsAvl","AssemblyTime")
dimnames(lprec) <- list(RowNames, ColNames);lprec
#Solve
solve(lprec)   #[1] 0  ok
#get.dual.solution(lprec)
get.objective(lprec)
get.variables(lprec)
get.constraints(lprec)
get.sensitivity.obj(lprec)
#https://cran.r-project.org/web/packages/lpSolveAPI/lpSolveAPI.pdf

print.lpExtPtr(lprec)
#real constraints
set.type(lprec, c(1,2), type = c("real")); lprec
#should be real to draw graph
solve(lprec)

plot.lpExtPtr(lprec)
name.lp(lprec,'Chips Allocation'); lprec

