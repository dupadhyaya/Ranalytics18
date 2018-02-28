# Example 1.5 - Colorado.edu site
# 3 constraints and 4 variables
#https://cran.r-project.org/web/packages/lpSolveAPI/lpSolveAPI.pdf
#http://civil.colorado.edu/~balajir/CVEN5393/R-sessions/sess1/lpSolveAPI-vignettes.pdf
#https://rdrr.io/cran/lpSolveAPI/

lprec = make.lp(3,4)
lprec
set.column(lprec,1,c(0,0.24,12.68))
lprec
set.column(lprec,2,78.26,indices=1) # can use sparse matrix
set.column(lprec,3,c(11.31,0.08),indices=2:3)
lprec
set.column(lprec,4,c(2.8,0.9),indices=c(1,3))
lprec
set.objfn(lprec,c(1,3,6.24,0.1))
set.constr.type(lprec,c('>=','<=','>='))
lprec
set.rhs(lprec,c(92.3,14.8,4))
# all decision variables [0,inf)
lprec
set.type(lprec,2,'integer')
lprec
set.type(lprec,3,'binary') # 0 or 1
set.bounds(lprec,lower=c(28.26,18),columns=c(1,4))
set.bounds(lprec,upper=48.98,columns=4)
lprec
RowNames = c('R1','R2','R3')
ColNames = c('C1','C2','C3','C4')
dimnames(lprec) = list(RowNames,ColNames)
lprec
solve(lprec)
# 0 is success
get.objective(lprec)
get.variables(lprec)
get.constraints(lprec)

get.dual.solution(lprec)
get.sensitivity.obj(lprec)
get.sensitivity.rhs(lprec)
lprec
