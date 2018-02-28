# Transport Problem in R
# 
lp(direction = "min", objective.in, const.mat, const.dir, const.rhs,
    transpose.constraints = TRUE, int.vec, presolve=0, compute.sens=0,
    binary.vec, all.int=FALSE, all.bin=FALSE, scale = 196, dense.const,
    num.bin.solns=1, use.rw=FALSE)

lp.assign (cost.mat, direction = "min", presolve = 0, compute.sens = 0)
lp.object 
lp.transport(cost.mat, direction="min", row.signs, row.rhs, col.signs,
              col.rhs, presolve=0, compute.sens=0, integers = 1:(nc*nr) )
?make.q8 
