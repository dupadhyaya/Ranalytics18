#lpSolveAPI
#(https://cran.r-project.org/web/packages/lpSolveAPI/lpSolveAPI.pdf)
#https://www.rdocumentation.org/packages/lpSolveAPI/versions/5.5.2.0-17


#addcolumn-----
#Add a column to an lpSolve linear program model object
add.column(lprec, x, indices)
lps.model <- make.lp(4, 0)
lps.model
add.column(lps.model, c(6,2,4,9))
lps.model
add.column(lps.model, c(3,1,5), indices = c(1,2,4))
lps.model

#add.constraint-----
add.constraint(lprec, xt, type = c("<=", "=", ">="), rhs, indices, lhs)
lps.model <- make.lp(0, 4); lps.model
set.objfn(lps.model, rep(1, 4)); lps.model
add.constraint(lps.model, c(6,2,4,9), "<=", 50); lps.model
add.constraint(lps.model, c(3,1,5), 2, 75, indices = c(1,2,4)); lps.model


#add.SOS----
#Add A Special Ordered Set Constraint
add.SOS(lprec, name, type, priority, columns, weights)


#deletecolumn----
delete.column(lprec, columns)
lps.model <- make.lp(4, 0);lps.model
x <- c(6,2,4,9)
add.column(lps.model, x); lps.model
y <- c(3,1,5) ;ind <- c(1,2,4)
add.column(lps.model, y, ind); lps.model
delete.column(lps.model, 1) ; lps.model


#deleteconstraint----
delete.constraint(lprec, constraints)
lps.model <- make.lp(0, 4) ; lps.model
set.objfn(lps.model, rep(1, 4)); lps.model
xt <- c(6,2,4,9)
add.constraint(lps.model, xt, "<=", 50); lps.model
yt <- c(3,1,5) ;ind <- c(1,2,4)
add.constraint(lps.model, yt, 2, 75, ind); lps.model
delete.constraint(lps.model, 1); lps.model

#delete lp----
delete.lp(lprec)

#dim ----
dim(x) <- value
lps.model <- make.lp(4, 0) ; lps.model
x <- c(6,2,4,9)
add.column(lps.model, x); lps.model
y <- c(3,1,5) ; ind <- c(1,2,4)
add.column(lps.model, y, ind) ; lps.model
dim(lps.model)


#dimnames.lpExtPtr -----
dimnames(x) ; dimnames(x) <- value

lps.model <- make.lp(4, 0) ; lps.model
x <- c(6,2,4,9)
add.column(lps.model, x); lps.model
y <- c(3,1,5) ; ind <- c(1,2,4)
add.column(lps.model, y, ind) ; lps.model
dimnames(lps.model) <- list(c("alpha", "bravo", "charlie", "delta"),
                            c("whiskey", "tango"))
lps.model

#get.basis-----
get.basis(lprec, nonbasic = FALSE)
lps.model <- make.lp(3, 3); lps.model
## build and solve model ##
get.basis(lps.model)

#getbounds----
get.bounds(lprec, columns = 1:n)
lps.model <- make.lp(3, 3); lps.model
get.bounds(lps.model)


#getbranchmode
get.branch.mode(lprec, columns = 1:n, as.char = TRUE)

lps.model <- make.lp(3, 3); lps.model
get.branch.mode(lps.model)

#getcolumn -----
get.column(lprec, column)

lps.model <- make.lp(4, 0)
x <- c(6,2,4,9)
add.column(lps.model, x); lps.model
y <- c(3,1,5) ;ind <- c(1,2,4)
add.column(lps.model, y, ind); lps.model
get.column(lps.model, 2)

#getconstraint type-----
get.constr.type(lprec, constraints = 1:m, as.char = TRUE)
lps.model <- make.lp(0, 3); lps.model
xt <- c(6,2,4)
add.constraint(lps.model, xt, "<=", 15); lps.model
xt <- c(1,1,6)
add.constraint(lps.model, xt, ">=", 15); lps.model
xt <- c(4,5,4)
add.constraint(lps.model, xt, "=", 40); lps.model
get.constr.type(lps.model)

#getconstraint value-----
get.constr.value(lprec, side = c("rhs", "lhs"), constraints = 1:m)

#getconstraints----
get.constraints(lprec)

lps.model <- make.lp(0, 3)
xt <- c(6,2,4)
add.constraint(lps.model, xt, "<=", 150)
xt <- c(1,1,6)
add.constraint(lps.model, xt, ">=", 0)
xt <- c(4,5,4)
add.constraint(lps.model, xt, "=", 40)
set.objfn(lps.model, c(-3,-4,-3)); lps.model
solve(lps.model)
get.constraints(lps.model)

#getdualsolution----
get.dual.solution(lprec)
lps.model <- make.lp(0, 3)
xt <- c(6,2,4)
add.constraint(lps.model, xt, "<=", 150)
xt <- c(1,1,6)
add.constraint(lps.model, xt, ">=", 0)
xt <- c(4,5,4)
add.constraint(lps.model, xt, "=", 40)
set.objfn(lps.model, c(-3,-4,-3)) ; lps.model
solve(lps.model)
get.dual.solution(lps.model)

#get.kind ----
get.kind(lprec, columns = 1:n)
lps.model <- make.lp(0, 3)
xt <- c(6,2,4)
add.constraint(lps.model, xt, "<=", 150)
xt <- c(1,1,6)
add.constraint(lps.model, xt, ">=", 0)
xt <- c(4,5,4)
add.constraint(lps.model, xt, "=", 40)
set.objfn(lps.model, c(-3,-4,-3))
get.kind(lps.model)


get.mat(lprec, i, j)
lps.model <- make.lp(0, 3)
xt <- c(6,2,4)
add.constraint(lps.model, xt, "<=", 150)
xt <- c(1,1,6)
add.constraint(lps.model, xt, ">=", 0)
xt <- c(4,5,4)
add.constraint(lps.model, xt, "=", 40)
set.objfn(lps.model, c(-3,-4,-3))
get.mat(lps.model, 2, 2)


get.objective(lprec)
lps.model <- make.lp(0, 3)
xt <- c(6,2,4)
add.constraint(lps.model, xt, "<=", 150)
xt <- c(1,1,6)
add.constraint(lps.model, xt, ">=", 0)
xt <- c(4,5,4)
add.constraint(lps.model, xt, "=", 40)
set.objfn(lps.model, c(-3,-4,-3))
solve(lps.model)
get.objective(lps.model)


get.primal.solution(lprec, orig = FALSE)
lps.model <- make.lp(0, 3)
xt <- c(6,2,4)
add.constraint(lps.model, xt, "<=", 150)
xt <- c(1,1,6)
add.constraint(lps.model, xt, ">=", 0)
xt <- c(4,5,4)
add.constraint(lps.model, xt, "=", 40)
set.objfn(lps.model, c(-3,-4,-3))
solve(lps.model)
get.primal.solution(lps.model)

get.rhs(lprec, constraints = 1:m)
lps.model <- make.lp(0, 3)
xt <- c(6,2,4)
add.constraint(lps.model, xt, "<=", 150)
xt <- c(1,1,6)
add.constraint(lps.model, xt, ">=", 0)
xt <- c(4,5,4)
add.constraint(lps.model, xt, "=", 40)
set.objfn(lps.model, c(-3,-4,-3))
get.rhs(lps.model)

get.sensitivity.obj(lprec)
lps.model <- make.lp(0, 3)
xt <- c(6,2,4)
add.constraint(lps.model, xt, "<=", 150)
xt <- c(1,1,6)
add.constraint(lps.model, xt, ">=", 0)
xt <- c(4,5,4)
add.constraint(lps.model, xt, "=", 40)
set.objfn(lps.model, c(-3,-4,-3))
solve(lps.model)
get.sensitivity.obj(lps.model)


get.sensitivity.objex(lprec)
lps.model <- make.lp(0, 3)
xt <- c(6,2,4)
add.constraint(lps.model, xt, "<=", 150)
xt <- c(1,1,6)
add.constraint(lps.model, xt, ">=", 0)
xt <- c(4,5,4)
add.constraint(lps.model, xt, "=", 40)
set.objfn(lps.model, c(-3,-4,-3))
solve(lps.model)
get.sensitivity.objex(lps.model)


get.sensitivity.rhs(lprec)
lps.model <- make.lp(0, 3)
xt <- c(6,2,4)
add.constraint(lps.model, xt, "<=", 150)
xt <- c(1,1,6)
add.constraint(lps.model, xt, ">=", 0)
xt <- c(4,5,4)
add.constraint(lps.model, xt, "=", 40)
set.objfn(lps.model, c(-3,-4,-3))
solve(lps.model)
get.sensitivity.rhs(lps.model)


get.solutioncount(lprec)


get.total.iter(lprec)


get.total.nodes(lprec)

get.type(lprec, columns = 1:n, as.char = TRUE)

lps.model <- make.lp(0, 3)
xt <- c(6,2,4)
add.constraint(lps.model, xt, "<=", 150)
xt <- c(1,1,6)
add.constraint(lps.model, xt, ">=", 0)
set.type(lps.model, 2, "binary")
xt <- c(4,5,4)
add.constraint(lps.model, xt, "=", 40)
set.type(lps.model, 3, "integer")
set.objfn(lps.model, c(-3,-4,-3))
get.type(lps.model)

get.variables(lprec)
lps.model <- make.lp(0, 3)
xt <- c(6,2,4)
add.constraint(lps.model, xt, "<=", 150)
xt <- c(1,1,6)
add.constraint(lps.model, xt, ">=", 0)
xt <- c(4,5,4)
add.constraint(lps.model, xt, "=", 40)
set.objfn(lps.model, c(-3,-4,-3))
solve(lps.model)
get.variables(lps.model)


guess.basis(lprec, guess)

lp.control(lprec, ..., reset = FALSE)


make.lp(nrow = 0, ncol = 0, verbose = "neutral")
lps.model <- make.lp(4, 3)


name.lp(lprec, name)

lps.model <- make.lp(0, 3)
xt <- c(6,2,4)
add.constraint(lps.model, xt, "<=", 150)
xt <- c(1,1,6)
add.constraint(lps.model, xt, ">=", 0)
xt <- c(4,5,4)
add.constraint(lps.model, xt, "=", 40)
set.objfn(lps.model, c(-3,-4,-3))
name.lp(lps.model, "Simple LP")
name.lp(lps.model)


#plot.lpExtPtr
#print.lpExtPtr

read.lp(filename, type = c("lp", "mps", "freemps"), verbose = "neutral",        options)

#resize.lp
resize.lp(lprec, nrow, ncol)
lps.model <- make.lp(4, 0)
resize.lp(lps.model, 4, 2) ; lps.model
x <- c(6,2,4,9)
add.column(lps.model, x); lps.model
y <- c(3,1,5) ;ind <- c(1,2,4)
add.column(lps.model, y, ind); lps.model


#row.add.mode(lprec, state)


#select.solution(lprec, solution)

#set.basis(lprec, basis, nonbasic = FALSE, default = FALSE)

#set.bounds----

set.bounds(lprec, lower = NULL, upper = NULL, columns = 1:n)
lps.model <- make.lp(0, 4)
set.bounds(lps.model, lower = rep(-1.0, 4)); lps.model
set.bounds(lps.model, upper = 1:4);lps.model
set.bounds(lps.model, lower = rep(0.0, 4), upper = rep(1.0, 4))
lps.model


#set.branch.mode(lprec, columns, modes)


#set.branch.weights(lprec, weights)


#set.column(lprec, column, x, indices)

lps.model <- make.lp(4, 2)
set.column(lps.model, 2, c(6,2,4,9)); lps.model
set.column(lps.model, 1, c(3,1,5), indices = c(1,2,4)); lps.model

#set.constr.type
set.constr.type(lprec, types, constraints = 1:m)
lps.model <- make.lp(4, 2)
x <- c(6,2,4,9)
set.column(lps.model, 2, x); lps.model
y <- c(3,1,5); ind <- c(1,2,4)
set.column(lps.model, 1, y, ind); lps.model
set.constr.type(lps.model, rep("<=", 4)) ; lps.model


set.constr.value(lprec, rhs = NULL, lhs = NULL, constraints = 1:m)


set.mat(lprec, i, j, value)


lps.model <- make.lp(4, 2)
x <- c(6,2,4,9)
set.column(lps.model, 2, x)
y <- c(3,1,5) ;ind <- c(1,2,4)
set.column(lps.model, 1, y, ind)
set.constr.type(lps.model, rep("<=", 4)); lps.model
set.mat(lps.model, 3, 2, 4.5)
lps.model


set.objfn(lprec, obj, indices)
lps.model <- make.lp(2, 4)
set.objfn(lps.model, c(1,2,3,4))
set.objfn(lps.model, c(5,7,6), indices = c(1,2,4))

set.rhs(lprec, b, constraints = 1:m)
lps.model <- make.lp(4, 2)
x <- c(6,2,4,9)
set.column(lps.model, 2, x)
y <- c(3,1,5)
ind <- c(1,2,4)
set.column(lps.model, 1, y, ind)
set.rhs(lps.model, c(10, 20, 40, 80))
lps.model


set.row(lprec, row, xt, indices)
lps.model <- make.lp(2, 4); lps.model
set.row(lps.model, 2, c(6,2,4,9)); lps.model
set.row(lps.model, 1, c(3,1,5), indices = c(1,2,4)); lps.model


set.semicont(lprec, columns, sc = TRUE)


set.type(lprec, columns, type = c("integer", "binary", "real"))
lps.model <- make.lp(0, 3)
xt <- c(6,2,4)
add.constraint(lps.model, xt, "<=", 150)
xt <- c(1,1,6)
add.constraint(lps.model, xt, ">=", 0)
set.type(lps.model, 2, "binary")
xt <- c(4,5,4)
add.constraint(lps.model, xt, "=", 40)
set.type(lps.model, 3, "integer")
set.objfn(lps.model, c(-3,-4,-3))
get.type(lps.model)
lps.model


#solve.lpExtPtr
lps.model <- make.lp(0, 3)
xt <- c(6,2,4)
add.constraint(lps.model, xt, "<=", 150)
xt <- c(1,1,6)
add.constraint(lps.model, xt, ">=", 0)
xt <- c(4,5,4)
add.constraint(lps.model, xt, "=", 40)
set.objfn(lps.model, c(-3,-4,-3))
solve(lps.model)

# 0: "optimal solution found"
# 1: "the model is sub-optimal"
# 2: "the model is infeasible"
# 3: "the model is unbounded"
# 4: "the model is degenerate"
# 5: "numerical failure encountered"
# 6: "process aborted"
# 7: "timeout"
# 9: "the model was solved by presolve"
# 10: "the branch and bound routine failed"
# 11: "the branch and bound was stopped because of a break-at-first or break-at-value"
# 12: "a feasible branch and bound solution was found"
# 13: "no feasible branch and bound solution was found"


write.lp(lprec, filename, type = c("lp", "mps", "freemps"),
         use.names = c(TRUE, TRUE))
