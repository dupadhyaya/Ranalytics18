#chapter 7d
#https://icyrock.com/blog/2013/12/linear-programming-in-r-using-lpsolve/
# Suppose a farmer has 75 acres on which to plant two crops:
# wheat and barley. To produce these crops, it costs the farmer 
# (for seed, fertilizer, etc.) $120 per acre for the wheat 
# and $210 per acre for the barley. The farmer has $15000 available 
# for expenses. But after the harvest, the farmer must store the crops
# while awaiting favourable market conditions. The farmer has storage 
# space for 4000 bushels. Each acre yields an average of 110 bushels 
# of wheat or 30 bushels of barley. If the net profit per bushel of
# wheat (after all expenses have been subtracted) is $1.30 and for 
# barley is $2.00, how 
# should the farmer plant the 75 acres to maximize profit?  

#Obj Function : 110 *(1.30 * W) + 30 * (60 *B)
library(lpSolveAPI)
?make.lp
lprec = make.lp(0,2)
lprec
lp.control(lprec, sense="max")
set.objfn(lprec, c(143, 60))
add.constraint(lprec, c(120, 210), "<=", 15000)
add.constraint(lprec, c(110, 30), "<=", 4000)
add.constraint(lprec, c(1, 1), "<=", 75)
lprec
#------
solve(lprec)
get.objective(lprec)
get.variables(lprec)
# 21.87 of Wheat, 53.12 of Barley
#https://cran.r-project.org/web/packages/lpSolveAPI/lpSolveAPI.pdf

get.dual.solution(lprec)
get.kind(lprec, columns = 1:2)
get.mat(lprec, 1, 1)
get.rhs(lprec, constraints = 1:4)
get.sensitivity.obj(lprec)
get.sensitivity.rhs(lprec)
get.solutioncount(lprec)
get.total.iter(lprec)
get.total.nodes(lprec)
get.type(lprec, columns = 1:2, as.char = TRUE)
get.variables(lprec)
guess.basis(lprec, guess)
lp.control(lprec, reset = FALSE)
?name.lp()
?row.add.mode(lprec, state)
set.type(lprec, c(1,2), type = c("integer"))
lprec
