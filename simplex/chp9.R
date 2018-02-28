# Chapter 9 : Sensitivity Analysis
library(lpSolve)
library(lpSolveAPI)
my.lp = make.lp(0,2)
# 0 contraints (add later) and 2 decision variables
dim(my.lp)
my.lp
set.objfn(my.lp,c(50,120))
add.constraint(my.lp, c(2,4), "<=", 80)
add.constraint(my.lp, c(3,1), "<=", 60)
lp.control(my.lp,sense='min')
my.lp
solve(my.lp)
get.objective(my.lp)
get.variables(my.lp)
get.constraints(my.lp)





# Another Method
my.lp = make.lp(2,2) # 2 contraints and 2 decision variables
?make.lp
dim(my.lp)
#resize.lp()
add.constraint(my.lp, c(4,3), "<=", 240)
add.constraint(my.lp, c(2,1), "<=", 100)

#set.column(my.lp,1,c(4,2))
#set.column(my.lp,2,c(3,1))
set.objfn(my.lp,c(70,50))
#set.constr.type(my.lp,rep("<=",2))
#set.rhs(my.lp,c(240,100))

my.lp
solve(my.lp)
get.objective(my.lp)
get.variables(my.lp)
get.constraints(my.lp)



# 3rd Way
library(boot)
?simplex
a = c(50,120)                        # vector with 6 ones
A1 = matrix(c(2,4,3,1), nrow=2, ncol=2,byrow=T)       # 6x6 matrix with all ones
b1 = c(80,60)
a;A1;b1
simplex(a=a, A1=A1, b1=b1, maxi=TRUE)
s1=simplex(a=a, A1=A1, b1=b1, maxi=TRUE)
s1$slack
s1$soln
s1$solved
s1$value
s1$A
s1$basic
s1$maxi
s1$obj
s1$call
