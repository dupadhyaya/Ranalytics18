#Skewness

library(PerformanceAnalytics)
skew <-  PerformanceAnalytics::skewness(mtcars$mpg)
skew  # Right Skewed
hist(mtcars$mpg)
plot(density(mtcars$mpg))
abline(v=c(mean(mtcars$mpg), median(mtcars$mpg)), col=2:3, lwd=2:3)

       