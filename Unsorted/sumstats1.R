# Summary Stats
#http://sphweb.bumc.bu.edu/otlt/mph-modules/bs/r/r2_summarystats-graphs/R2_SummaryStats-Graphs_print.html

airquality[1:5,]
mean(airquality$Temp)
median(airquality$Temp)
var(airquality$Wind)
attach(airquality)
var(Wind)

summary(airquality)


par(mar=c(3,3,2,2), mfrow=c(1,1))
#Fit normal curve over data (use dnorm & curve instead of curve)
hist(airquality$Temp, prob=T, main='Temperature')
curve(dnorm(x, mean= mean(airquality$Temp), sd = sqrt(var(airquality$Temp))), col='darkblue', lwd=2, add=TRUE)
?dnorm


qqnorm(airquality$Temp)
qqline(airquality$Temp)
boxplot(airquality[, 1:4])



x <- rnorm(1000)
hist(x, freq = FALSE, col = "grey")
curve(dnorm, col = 2, add = TRUE)

library(lessR)
# generate 100 random normal data values
y <- rnorm(100)
# normal curve and general density curves superimposed over histogram
# all defaults
hist(y)
color.density(y)
Histogram(y)



library(e1071) # For the "skewness" and "kurtosis" functions
n <- 1000
x <- rnorm(n)
qqnorm(x, main=paste("kurtosis =", round(kurtosis(x), digits=2),
                     "(gaussian)"))
qqline(x, col="red")
op <- par(fig=c(.02,.5,.5,.98), new=TRUE)
hist(x, probability=T,
     col="light blue", xlab="", ylab="", main="", axes=F)
lines(density(x), col="red", lwd=2)
box()
par(op)
