# Mode with Package
#https://cran.r-project.org/web/packages/modeest/modeest.pdf

library(modeest)

mlv(mtcars$cyl,method='shorth')
mlv(mtcars$cyl, method = "discrete")

#M <- mlv(x, method = "discrete")
#plot(M)
#table(mtcars$cyl)
