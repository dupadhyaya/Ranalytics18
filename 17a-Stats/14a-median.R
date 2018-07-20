#Median

head(mtcars)
median(mtcars$mpg)

x=c(1:10,NA,100)
x
median(x)
median(x, na.rm=T)
median(x, na.rm=T, trim=.1)
median(2:10)
2:10
