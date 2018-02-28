#Chapter 10 : Transportation Problem

#https://artax.karlin.mff.cuni.cz/r-help/library/lpSolve/html/lp.transport.html

costs <- matrix (10000, 8, 5); 
costs[4,1] <- costs[-4,5] <- 0
costs[1,2] <- costs[2,3] <- costs[3,4] <- 7; costs[1,3] <- costs[2,4] <- 7.7
costs[5,1] <- costs[7,3] <- 8; costs[1,4] <- 8.4; costs[6,2] <- 9
costs[8,4] <- 10; costs[4,2:4] <- c(.7, 1.4, 2.1)
#
# Set up constraint signs and right-hand sides.
#
row.signs <- rep ("<", 8)
row.rhs <- c(200, 300, 350, 200, 100, 50, 100, 150)
col.signs <- rep (">", 5)
col.rhs <- c(250, 100, 400, 500, 200)
#
# Run
#
lp.transport (costs, "min", row.signs, row.rhs, col.signs, col.rhs)
## Not run: Success: the objective function is 7790
lp.transport (costs, "min", row.signs, row.rhs, col.signs, col.rhs)$solution


# Pg 428
#lp.transport (cost.mat, direction="min", row.signs, row.rhs, col.signs,
#              col.rhs, presolve=0, compute.sens=0, integers = 1:(nc*nr) 
              
c1 = c(5,4,3,8,4,3,9,7,5)
costs <- matrix(c1,nrow=3,byrow = T);
costs
# Set up constraint signs and right-hand sides.
#
row.signs <- rep (">=", 3)
row.rhs <- c(100, 300, 300)
col.signs <- rep (">=", 3)
col.rhs <- c(300,200,200)
# Run
lp.transport (costs,direction= "min", row.signs, row.rhs, col.signs, col.rhs)
lpt= lp.transport (costs,direction= "min", row.signs, row.rhs, col.signs, col.rhs)

## Not run: Success: the objective function is 3900
lp.transport(costs, "min", row.signs, row.rhs, col.signs, col.rhs)$solution
lpt$solution
lpt$costs
lpt$rrhs
lpt$rsigns
lpt$csigns
lpt$objval
lpt$direction # 1-min, other max
lpt$rcount
lpt$ccount
lpt$crhs
lpt$integers

#http://wps.prenhall.com/wps/media/objects/9434/9660836/online_tutorials/heizer10e_tut4.pdf
#http://www.maths.unp.ac.za/coursework/MATH331/2012/transportation_assignment.pdf

# Pg 446
c1 = c(6,4,9,10,5,8,12,7,6)
costs <- matrix(c1,nrow=3,byrow = T);
costs
# Set up constraint signs and right-hand sides.
#
row.signs <- rep ("<=", 3)
row.rhs <- c(200, 175, 75)
col.signs <- rep (">=", 3)
col.rhs <- c(250,100,150)
# Run
lp.transport (costs, direction="min", row.signs, row.rhs, col.signs, col.rhs)
lpt= lp.transport (costs,direction= "min", row.signs, row.rhs, col.signs, col.rhs)
lpt$solution


# Pag 452
# Pg 446 : select which plant to choose for manufacturing
#c1 = c(73,103,88,108,85,80,100,90,88,97,78,118,113,91,118,80)
#c1 = c(25,55,40,60,35,30,50,40,36,45,26,66,60,38,65,27,35,30,41,50)
r1 = c(25,55,40,60)
r2 = c(35,30,50,40)
r3 = c(36,45,26,66)
r4 = c(60,38,65,27) # seattle
r5 = c(35,30,41,50) # Birmingham
col.signs <- rep ("=", 4)
col.rhs <- c(10000,12000,15000,9000)

# Birmingham
costsb <- matrix(c(r1,r2,r3,r5),nrow=4,byrow = T);
costsb
row.signsb <- rep (">=", 4)
row.rhsb <- c(1500,6000,14000,1100)
# Run
lptb= lp.transport(costsb,direction= "min", row.signsb, row.rhsb, col.signs, col.rhs)
lptb$solution

# Seattle
costss <- matrix(c(r1,r2,r3,r4),nrow=4,byrow = T);
costss
row.signss <- rep (">=", 4)
row.rhss <- c(1500,6000,14000,1100)
# Run
lpts= lp.transport(costss,direction= "min", row.signss, row.rhss, col.signs, col.rhs)
lpts$solution

max(lptb$objval,lpts$objval)
# Seattle to be selected - lower cost
