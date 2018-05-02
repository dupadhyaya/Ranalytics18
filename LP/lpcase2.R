library(lpSolveAPI)

#used for result visualization
library(ggplot2)
library(reshape)
library(gridExtra)

#define the datasets

train = data.frame(wagon=c('w1','w2','w3'), weightcapacity=c(10,8,12), spacecapacity=c(5000,4000,8000))
train
cargo = data.frame(type=c('c1','c2','c3','c4'), available=c(18,10,5,20), volume=c(400,300,200,500),profit=c(2000,2500,5000,3500))
cargo


#create an LP model with 10 constraints and 12 decision variables

lpmodel<-make.lp(2*NROW(train)+NROW(cargo),12)

#I used this to keep count within the loops, I admit that this could be done a lot neater
column<-0
row<-0

#build the model column per column
for(wg in train$wagon){
  row <- row+1
  for(type in seq(1,NROW(cargo$type))){
    column <- column+1
  #this takes the arguments 'column','values' & 'indices' (as in where these values should be placed in the column)
    set.column(lpmodel,column,c(1, cargo[type,'volume'],1), indices=c(row,NROW(train)+row, NROW(train)*2+type))
  }}

#set rhs weight constraints
set.constr.value(lpmodel, rhs=train$weightcapacity, constraints=seq(1,NROW(train)))

#set rhs volume constraints
set.constr.value(lpmodel, rhs=train$spacecapacity, constraints=seq(NROW(train)+1,NROW(train)*2))


#set rhs volume constraints
set.constr.value(lpmodel, rhs=cargo$available, constraints=seq(NROW(train)*2+1,NROW(train)*2+NROW(cargo)))

#set objective coefficients
set.objfn(lpmodel, rep(cargo$profit,NROW(train)))

#set objective direction
lp.control(lpmodel,sense='max')

#I in order to be able to visually check the model, I find it useful to write the model to a text file
write.lp(lpmodel,'model.lp',type='lp')

#solve the model, if this return 0 an optimal solution is found
solve(lpmodel)

#this return the proposed solution
get.objective(lpmodel)
