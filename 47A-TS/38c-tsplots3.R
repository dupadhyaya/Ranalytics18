# plot the graph in R
set.seed(15)
a = c(1,2,-2,4,2,3,1,0,3,4,2,3,1)
b = a + rnorm(length(a), sd = 0.4)
plot(ts(b), col="#f44e2e", lwd=3)
lines(a, col="#27ccc0", lwd=3)
a
round(b,1)
# compute using the R language
corr = ccf(a,b)
corr
