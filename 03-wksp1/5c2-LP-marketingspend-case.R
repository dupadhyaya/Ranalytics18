# LP - Marketing Spend
## Code to solve LP

#install.packages("linprog")
library(linprog)

Max_ROI = c(0.07, 0.03, 0.15, 0.12, 0.05) #Objective Function

Contraint_Vector = c(5000, -500, 0, -200, 0, 0, -300, 900, -100, 2500) #Constraints

#Decision variables under constraints 
Decision_Var <- rbind(
  c(1,1,1,1,1), 
  c(-1, 0, 0, 0, 0), 
  c(-0.05, 0.95, -0.05, -0.05, -0.05), 
  c(-0, -1, 0, 0, 0), 
  c(0.5, 0.5, -0.5, -0.5, 0.5), 
  c(0, 0, 1, -2.5, 0), 
  c(0, 0, 0, -1, 0), 
  c(0, 0, 0, 1, 0), 
  c(0, 0, 0, 0, -1),
  c(2, 0.3, 1.8, 0.9, 2)
)
Decision_Var
solveLP(Max_ROI, Contraint_Vector, Decision_Var, TRUE)

