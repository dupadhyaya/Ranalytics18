#LP car manufacturing
#A car company produces 2 models, model A and model B. Long-term projections indicate an expected demand of at least 100 model A cars and 80 model B cars each day. Because of limitations on production capacity, no more than 200 model A cars and 170 model B cars can be made daily. To satisfy a shipping contract, a total of at least 200 cars much be shipped each day. If each model A car sold results in a $2000 loss, but each model B car produces a $5000 profit, how many of each type should be made daily to maximize net profits?

#Problem
#X= number of model A car Y=number of model B car
#As we are going for the maximization the equation will be
#-2000x+5000y=Z
#And the constraints are
# x>=100 {Demand of Model A}
# y>=80 {Demand of Model B}
# x<=200 {Model A’s Production Limit}
# y<=170 {Model B’s Production Limit}
# x+y>=200 {Transportation Contract}

f.con<-matrix(c(1,0,0,1,1,0,0,1,1,1),nrow = 5,byrow = TRUE) #Matrix of Constraints i.e x>=100 is convered as (1,0) where in 100 is used in f.rhs
f.con
f.obj<-c(-2000,5000) #Objective function
f.dir <- c(">=",">=","<=", "<=",">=") #Direction
f.rhs <- c(100,80,200,170,200) #RHS of the matrix
lps1<-lp ("max", f.obj, f.con, f.dir, f.rhs,compute.sens = TRUE) #LPP Function
lps1$solution #Solution

#x and y wherein we have to produce 100 units of Model A and 170 of Model B on daily basis for a optimum production planning
