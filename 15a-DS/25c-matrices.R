#matrix

library(matlib)

A <- matrix( c(5, 1, 0,
               3,-1, 2,
               4, 0,-1), nrow=3, byrow=TRUE)
A
det(A)
inv(A)
diag(A)
t(A)
A * 2
solve(A)
