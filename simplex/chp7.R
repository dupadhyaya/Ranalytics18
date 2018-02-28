# Chapter 7

# Airline x1 can transport 50T of material & min 500 people
# Airline x2 can transport 150T of material & min 250 people
# flight costs (minimise) : x1-2500, x2-3500
library(boot)
a=c(2500,3500) # coeff of objective function
# A1- <= constraints, A2 - >= constraints, A3 - equality
# Matrix of coefficients for >= type of constraints
A2 = matrix(c(50,150,500,250), ncol=2,nrow=2,byrow=T)
A2
#b1 - right hand side of <= constraints, b2 - >=, b3 equal
b2=c(900,2500)
?simplex
simplex(a, A1 = NULL, b1 = NULL, A2 = NULL, b2 = NULL, A3 = NULL,
        b3 = NULL, maxi = FALSE, n.iter = n + 2 * m, eps = 1e-10)
a;A2;b2
simplex(a, A1=c(1,1), A2=A2, b1=1.0E+12,b2=b2, maxi = F)

# Table & Chair Problems : Maximise ----------------------

a=c(70,50)
b1=c(240,100)
w1 = c(4,3)
w2 = c(2,1)
simplex(a=a,A1=rbind(w1,w2),b1=b1, maxi = TRUE)


# not working above

library(lpSolveAPI)
library(ggplot2)
library(reshape)
library(grid)
# data sets
my.lp = make.lp(3,2) # 3 contraints and 2 decision variables
dim(my.lp)
#resize.lp()
set.column(my.lp,1,c(1,1,2))
set.column(my.lp,2,c(3,1,0))
set.objfn(my.lp,c(-2,-1))
set.constr.type(my.lp,rep("<=",3))
set.rhs(my.lp,c(4,2,3))

# My Egs----------------------------------
library(lpSolveAPI)
library(lpSolve)
?lp
?lp.assign
?lp.object
?lp.transport
?print.lp

# Example -------------
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



#-------------
#----
library(boot)
a = rep(1, 6)                        # vector with 6 ones
A1 = matrix(1, nrow=6, ncol=6)       # 6x6 matrix with all ones
b1 = c(5, 7, 15, 10, 15, 9)
a;A1;b1
simplex(a=a, A1=A1, b1=b1, maxi=TRUE)

#----------
lprec <- make.lp(0, 4)
set.objfn(lprec, c(1, 3, 6.24, 0.1))
add.constraint(lprec, c(0, 78.26, 0, 2.9), ">=", 92.3)
add.constraint(lprec, c(0.24, 0, 11.31, 0), "<=", 14.8)
add.constraint(lprec, c(12.68, 0, 0.08, 0.9), ">=", 4)
set.bounds(lprec, lower = c(28.6, 18), columns = c(1, 4))
set.bounds(lprec, upper = 48.98, columns = 4)
RowNames <- c("THISROW", "THATROW", "LASTROW")
ColNames <- c("COLONE", "COLTWO", "COLTHREE", "COLFOUR")
dimnames(lprec) <- list(RowNames, ColNames)
#Lets take a look at what we have done so far.
lprec  # or equivalently print(lprec)
solve(lprec)
get.objective(lprec)
get.variables(lprec)
get.constraints(lprec)
?solve.lpExtPtr
status <- add.constraint(lprec, c(12.68, 0, 0.08, 0.9), ">=", 4)
status
