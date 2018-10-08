# Normality

#https://stats.stackexchange.com/questions/52293/r-qqplot-how-to-see-whether-data-are-normally-distributed

#Method1 -----------
library(moments)
library(nortest)
library(e1071)





set.seed(777)
x <- rnorm(250,10,1)

# skewness and kurtosis, they should be around (0,3)
skewness(x)
kurtosis(x)

plot(density(x))
# Shapiro-Wilks test
shapiro.test(x)

# Kolmogorov-Smirnov test
ks.test(x,"pnorm",mean(x),sqrt(var(x)))

# Anderson-Darling test
ad.test(x)

# qq-plot: you should observe a good fit of the straight line
qqnorm(x)
qqline(x)

# p-plot: you should observe a good fit of the straight line
probplot(x, qdist=qnorm)

# fitted normal density
f.den <- function(t) dnorm(t,mean(x),sqrt(var(x)))
curve(f.den,xlim=c(6,14))
hist(x,prob=T,add=T)

# Method 2
library(car)

qqPlot(lm(prestige ~ income + education + type, data=Duncan), 
       envelope=.99)