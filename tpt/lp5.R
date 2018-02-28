#http://stats.stackexchange.com/questions/136608/constrained-assignment-problem-linear-programming-genetic-algorithm-etc

#As an example, suppose we have 3 shops and 2 supply centers with distances between them as x1,1x1,1 = 2.8, x1,2x1,2 = 5.4, x1,3x1,3 = 1.4, x2,1x2,1 = 4.2, x2,2x2,2 = 3.0, x2,3x2,3 = 6.3. Then

library(Rsymphony)
obj <- c(2.8, 5.4, 1.4, 4.2, 3.0, 6.3, 0, 0)
mat <- matrix(c(1,0,0,1,0,0,0,1,0,1,0,0,0,0,1,1,0,0,1,0,0,0,1,0,0,1,0,0,1,0,0,0,1,0,1,0,0,0,0,-3,0,1,0,0,0,0,-3,1), nrow = 6)
dir <- c("==", "==", "==", "<=", "<=", "<=")
rhs <- c(1, 1, 1, 0, 0, 2)
mat
max <- FALSE
types <- "B"
fac.loc <- Rsymphony_solve_LP(obj, mat, dir, rhs, types = types, max = max, write_lp = TRUE)
fac.loc

tells us that we should open both supply centers and 
supply center 1 will supply shops 1 and 3 and supply center 2 will supply shop 2, for a total distance of 7.2.
