# LP - Transportation Problem 
#https://docs.google.com/spreadsheets/d/1G6-iPDoD_i4THQAHwBeOLeiTfuqn7a6Q7MrOg9v1C5U/edit#gid=166724984

library(lpSolve)

(costs <- matrix (c(3,1,5,2,5,4),ncol=2))
row.signs <- c("<", "<", "<")
row.rhs <- c(45, 60, 35)
col.signs <- rep (">", 2)
col.rhs <- c(50, 60)
#edit(costs)
# Run
lp.transport (costs, "min", row.signs, row.rhs, col.signs, col.rhs)
## Not run: Success: the objective function is 7790

lp.transport (costs, "min", row.signs, row.rhs, col.signs, col.rhs)$solution

#Eg2
(cost <- matrix(c(3,1,5,2,5,4),ncol=2))
lp.transport(cost, "min" , rep("<",3) , c(45, 60, 35) , rep(">=",2) , c(50, 60) )$solution
lp.transport(cost, "min" , rep("<",3) , c(45, 60, 35) , rep(">=",2) , c(50, 60) )
?lp.transport

library(lpSolve)
x <- matrix(c(.91,.32,.86,.14,.59,.36,.67,.34,.87,.56,.10,.09),ncol=3,byrow=T)
lp.transport(x, "min" , rep("==",4) , rep(1,4) , rep(">=",3) , rep(1,3)) 
lp.transport(x, "min" , rep("==",4) , rep(1,4) , rep(">=",3) , rep(1,3) )$solution

