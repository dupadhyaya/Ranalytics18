#mean

mtcars
head(mtcars)
mean(mtcars$mpg)

x=c(1:10,NA,100)
x
mean(x)
mean(x, na.rm=T)
mean(x, na.rm=T, trim=.1)
mean(2:10)
