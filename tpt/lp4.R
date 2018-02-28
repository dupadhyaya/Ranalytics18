# Transport Problem :
# Assisn costs to each source to each destination 
costs <- matrix (10000, 8, 5) # Give max value to all by default
costs  # max costs denote no route, route not to be selected
# not one by one add lower/actual costs
costs[4,1] <- costs[-4,5] <- 0
costs
costs[1,2] <- costs[2,3] <- costs[3,4] <- 7; 
costs
costs[1,3] <- costs[2,4] <- 7.7
costs
costs[5,1] <- costs[7,3] <- 8;
costs
costs[1,4] <- 8.4; 
costs
costs[6,2] <- 9
costs[8,4] <- 10; 
costs[4,2:4] <- c(.7, 1.4, 2.1)
costs
# Set up constraint signs and right-hand sides.
row.signs <- rep ("<", 8)  # repeat the sign 8 times/ colns
row.rhs <- c(200, 300, 350, 200, 100, 50, 100, 150)
col.signs <- rep (">", 5)  # repeat the sign 5 times/ rows
col.rhs <- c(250, 100, 400, 500, 200)
# Run
#lp.transport
#lp.transport (cost.mat, direction="min", row.signs, row.rhs, col.signs,
#              col.rhs, presolve=0, compute.sens=0, integers = 1:(nc*nr) )

lp.transport(costs, "min", row.signs, row.rhs, col.signs, col.rhs)
## Not run: Success: the objective function is 7790 - Min cost of tpt
lp.transport (costs, "min", row.signs, row.rhs, col.signs, col.rhs)$solution
# this is matrix how source will connect to destination
# 
