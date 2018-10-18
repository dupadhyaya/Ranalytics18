#Package H20
#https://cran.r-project.org/web/packages/h2o/h2o.pdf

library(h2o)
h2o.init()
iris.hex <- as.h2o(iris)
dim(iris.hex