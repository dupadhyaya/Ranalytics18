#LP - Package clplite
#https://github.com/yixuan/clplite

library('githubinstall')
githubinstall('clplite')

library(clplite)
obj = c(1, 0, 0, 0, 2, 0, 0, -1)
A = matrix(c(
  3,   1,   0,  -2,  -1,   0,    0,   -1,
  0,   2, 1.1,   0,   0,   0,    0,    0,
  0,   0,   1,   0,   0,   1,    0,    0,
  0,   0,   0, 2.8,   0,   0, -1.2,    0,
  5.6,   0,   0,   0,   1,   0,    0,  1.9
), nrow = 5, byrow = TRUE)
constr_lb = c(2.5, -Inf,  4, 1.8,  3)
constr_ub = c(Inf,  2.1,  4,   5, 15)
var_lb    = c(2.5,   0,   0,   0, 0.5,   0,   0,   0)
var_ub    = c(Inf, 4.1, Inf, Inf,   4, Inf, Inf, 4.3)

clp_solve(obj, A, constr_lb, constr_ub, var_lb, var_ub, max = TRUE)
clp_solve(obj, A, constr_lb, constr_ub, var_lb, var_ub, max = FALSE)
