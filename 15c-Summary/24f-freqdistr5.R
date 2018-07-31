# FD - categories

library(fdth)
## Categorical
x <- sample(x=letters[1:5],  size=5e2,rep=TRUE)
x
(fdt.c <- fdt_cat(x))
(fdt.c <- fdt_cat(x,  sort=FALSE))


#----
# Data.frame: multivariated with two categorical
##================================================
mdf <- data.frame(c1=sample(LETTERS[1:3], 1e2, rep=TRUE), c2=as.factor(sample(1:10, 1e2, rep=TRUE)), n1=c(NA, NA, rnorm(96, 10, 1), NA, NA), n2=rnorm(100, 60, 4),n3=rnorm(100, 50, 4))
head(mdf)
(fdt.c <- fdt_cat(mdf))
(fdt.c <- fdt_cat(mdf, dec=FALSE))
(fdt.c <- fdt_cat(mdf,sort=FALSE))
(fdt.c <- fdt_cat(mdf,  by='c1'))#error


#----
x <- matrix(sample(x=letters[1:10],  size=100, rep=TRUE), nc=2, dimnames=list(NULL, c('c1', 'c2')))
x
head(x)
(fdt.c <- fdt_cat(x))

