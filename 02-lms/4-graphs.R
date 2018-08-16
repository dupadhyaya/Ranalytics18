# Combined Plots

#plot, histogram, pie, boxplot, linechart, correlation plot


#plot
women
?women
str(women)
plot(women)
plot(x=women$height, y=women$weight)
?plot
plot(women, type='p', pch=17)
plot(women, type='l')
plot(women, type='b', pch=18, lty=2, col=2)
plot(women, xlim=c(30,100), ylim=c(min(women$weight)-10, 200), pch=10)
data()

#more features with plot
plot(y=women$height, x=women$weight, pch=15, xlab='Weight', ylab='Height', col='red', cex=2, type='b')
title(main='Main Title- PDU', sub='Sub Title')
#see cheat sheet on base graphs

plot(women)
abline(lm(women$weight ~ women$height), col='red', lty=2, lwd=4)
abline(h = c(130, 150), col='green') 
abline(v=c(62, 66, 70), col='blue')
abline(v=women$height, col='purple')

#boxplot
boxplot(women$height)
boxplot(df$marks1)

abline(h=c(58, 62,65,68,72))

#draw lines on plot for number summary
summary(women)
quantile(women$height)
boxplot(women$height, col='green')
abline(h=quantile(women$height))


#histogram
hist(women$height)
hist(women$height, breaks=10)
hist(women$height, breaks=5, col=1:5)
hist(df$marks2, breaks=3)
#histogram2
?rnorm
x = rnorm(n=100000,mean=50,sd=10)
hist(x)

hist(x, freq=F, col=1:5)
lines(density(x))

#density plot : shape of data
plot(density(x), col='red')


#pie
x = c(10,20,40,50)
pie(x)
xlabels = c('A','B','C','D')
pie(x, labels=xlabels)
pie(x, labels=paste(round(x/sum(x) * 100,0),'%') )

x
#barplot
barplot(x,col=1:4)
barplot(x,col=1:4, horiz = T)

#correlation plot
pairs(women)
cor(women$height,women$weight)

names(mtcars)
cor(mtcars)
pairs(mtcars)
options(digits=4)
pairs(mtcars[1:4])
