
library(Hmisc)
find.matches(x, y, tol=rep(0, ncol(y)), scale=tol, maxmatch=10)

?find.matches

y <- rbind(c(.1, .2),c(.11, .22), c(.3, .4), c(.31, .41), c(.32, 5))
x <- rbind(c(.09,.21), c(.29,.39))
y
x
w <- find.matches(x, y, maxmatch=5, tol=c(.05,.05))
w
w$matches
w$distance
x;y
w1 <- find.matches(x, y, tol=c(.1,.01))
w1

find.matches(y, x, maxmatch=5, tol=c(.05,.05))
