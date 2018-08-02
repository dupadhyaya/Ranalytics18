library(foreign)
db = file.choose()
dataset = read.spss(db,to.data.frame=TRUE)

x=c(1,3,4,6,8,9,11,14)
y=c(1,2,2,4,6,8,8,9)
fit1 = lm(x~y)
summary(fit1)
