
#Transportation Problem with Costs

(costs <- matrix(c(3,1,5,2,5,4),ncol=2))
row.signs <- c("<", "<", "<")
row.rhs <- c(45, 60, 35)
col.signs <- rep (">", 2)
col.rhs <- c(50, 60)
cbind(costs, row.signs, row.rhs)
rbind(costs, col.signs, col.rhs)

#Model
lp.transport (costs, "min", row.signs, row.rhs, col.signs, col.rhs)
(m1=lp.transport (costs, "min", row.signs, row.rhs, col.signs, col.rhs)$solution)
colSums(m1)
rowSums(m1)


#Model2
#Shorter Method
(cost <- matrix(c(3,1,5,2,5,4),ncol=2))
(m2=lp.transport(cost, "min" , rep("<",3) , c(45, 60, 35) , rep(">=",2) , c(50, 60) )$solution)
lp.transport(cost, "min" , rep("<",3) , c(45, 60, 35) , rep(">=",2) , c(50, 60) )

# Using Sweep function
m2
costs
objvalue=sweep(m2,c(1,2),costs,"*" )
sum(objvalue)

