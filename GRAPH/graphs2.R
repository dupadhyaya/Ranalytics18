

women
plot(women)
plot(x=women$weight, y=women$height, pch=15, xlab='Weight', ylab='Height', col='red', cex=2, type='b')
title(main='Main Title', sub='Sub Title')

boxplot(women$height)
abline(h=c(58, 62,65,68,72))
?boxplot
summary(women)

quantile(women$height)

hist(women$height, breaks=10)

x = rnorm(100,50,100)
hist(x)
hist(x, freq=F)
lines(density(x))
plot(density(x), col='red')

#pie
x = c(10,20,40,50)
pie(x)
xlabels = c('A','B','C','D')
pie(x, labels=xlabels)

barplot(x,col=1:4)
barplot(x,col=1:4, horiz = T)

pairs(women)
head(mtcars)
pairs(mtcars)
cor(women$height,women$weight)
options(digits=4)
plot(women)
abline(lm(women$weight ~ women$height), col='red', lty=2, lwd=4)



mosaic::qdist("norm", p = 0.95, mean = 0, sd = 1)
