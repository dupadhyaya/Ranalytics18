#Farmer Problem in LP
#A farmer plans to plant two crops, A and B. The cost of cultivating crop A is $40/acre, whereas the cost of crop B is $60/acre. The farmer has a maximum of $7400 available for land cultivation. Each acre of crop A requires 20 labor-hours and each acre of crop B requires 25 labor-hours. The farmer has a maximum of 3300 labor-hours available. If she expects to make a profit of $150/acre on crop A and $200/acre on crop B, how many acres of each crop should she plant in order to maximize her profit?
  
library(lpSolveAPI)

#First we create an empty model x.
?make.lp
#two variables ie. crops A & B: find which crop to be grown how much to max profit
lprecF1 <- make.lp(0, 2)
lprecF1
#Profit :: 150A + 200B
set.objfn(lprecF1, c(150, 200))
lprecF1
#Change from min to max problem
lp.control(lprecF1, sense="max")
lprecF1

#answer required in integer or real no for A & B: default Real
lprecF1
#1st Constraint : Budget Avl
#40x + 60y <= 7400
add.constraint(lprecF1, c(40,60), "<=", 7400)
lprecF1
#2nd constraint : Labour Hours Avl
#20x + 25y <= 3300
add.constraint(lprecF1, c(20,25), "<=", 3300)
lprecF1
#set lower limits : A & B > 0
set.bounds(lprecF1, lower = c(0, 0), columns = c(1, 2))
lprecF1
#upper bounds can also be set only for 1 or more columns
#set.bounds(lprec, upper = c(200), columns = 2)
ColNames <- c("CropA", "CropB")
RowNames <- c("Budget", "Labor")
dimnames(lprecF1) <- list(RowNames, ColNames)
lprecF1
solve(lprecF1)   #if 0  then solution found
#get.dual.solution(lprec)
get.objective(lprecF1) # profit achieved
get.variables(lprecF1)  #how much of each crop A & B
150* 65 + 200 * 80
get.constraints(lprecF1) #constraints of budget & labor used
plot(lprecF1)  # print graphical output : only when type is real
#if type is integer, the plot will not work
print(lprecF1)  #see the model


#add more constraints like water
#35x + 40y <= 10000
add.constraint(lprecF1, c(5,10), "<=", 1000)
lprecF1
delete.constraint(lprecF1, 3)
solve(lprecF1)   #if 0  then solution found
get.objective(lprecF1) # profit achieved
get.variables(lprecF1)  #how much of each crop A & B

#setting integer value
set.type(lprecF1, c(1,2), type = c("integer"))
lprecF1
solve(lprecF1)   #if 0  then solution found
get.objective(lprecF1) # profit achieved
get.variables(lprecF1)  #how much of each crop A & B


#http://lpsolve.sourceforge.net/5.5/R.htm
?lp
?lp.assign
?lp.object

?lp.transport
?print.lp
