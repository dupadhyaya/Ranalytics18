#Non - Linear Regression in R
#https://www.r-bloggers.com/first-steps-with-non-linear-regression-in-r/

#simulate some data
set.seed(20160227)
x = seq(0,50,1)
y = ((runif(1,10,20)*x)/(runif(1,0,10)+x))+rnorm(51,0,1)
y
#for simple models nls find good starting values for the parameters even if it throw a warning
m = nls(y~a*x/(b+x))
summary(m)

#get some estimation of goodness of fit
cor(y,predict(m))


#plot
plot(x,y)
lines(x,predict(m),lty=2,col="red",lwd=3)
