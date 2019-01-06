#understanding box plot
#https://www.shmoop.com/basic-statistics-probability/box-whisker-plots.html


#eg1----
marks = c(53,65,68,69,70,72,72,79,83,84,85,87,89,90,94)
quantile(marks)
sort(marks)
boxplot(marks, horizontal = T)


#eg2----
#mtcars

(mileage = mtcars$mpg)

boxplot(mileage)


boxplot(mileage, ylim=c(0,45))
quantile(mileage)
IQR(mileage)
range(mileage)

#quartiles
abline(h=quantile(mileage), col='green')
text(1-.3, quantile(mileage)+.2, labels=c('Q0','Q1','Q2','Q3','Q4'), col='green')

quantile(mileage)[c(2,4)]
(LL = quantile(mileage)[c(2)] - IQR(mileage))
(UL = quantile(mileage)[c(4)] + IQR(mileage))
abline(h=c(LL, UL), col='red', lwd=2)
text(1+.3, c(LL, UL)+.2, labels=c('Q1-IQR', 'Q3+IQR'), col='red')
text(1,0,label='beyond this value - consider them outliers', col='red')
#beyond this value - consider them outliers

#min/max
abline(h=range(mileage)+.1, col='blue', lwd=2)
text(1+.4, range(mileage)+.3, labels=c('min', 'max'), col='blue')

#mean/ median
abline(h=c(mean(mileage)+.1, median(mileage)+.1), col='brown', lwd=2)
text(c(1+.3,1), c(mean(mileage)-.2, median(mileage)+.2), labels=c(paste('MEAN',round(mean(mileage))), paste('MEDIAN',round(median(mileage),2))), col='brown')

# eg2------

mileage = c(rnorm(100, mean=20, sd=5), rnorm(100,mean=30,sd=5), rnorm(1000,mean=35,sd=5))
plot(density(mileage))
e1071::skewness(mileage)

#left skewed

boxplot(mileage, ylim=c(0,60), notch=T, col='yellow', main='Box Plot')
rug(jitter(mileage, amount = 0.01), side = 2, col = "light blue")
quantile(mileage)
IQR(mileage)
range(mileage)

#quartiles
abline(h=quantile(mileage), col='green')
text(1-.3, quantile(mileage)+.2, labels=c('Q0','Q1','Q2','Q3','Q4'), col='green')

quantile(mileage)[c(2,4)]
(LL = quantile(mileage)[c(2)] - IQR(mileage))
(UL = quantile(mileage)[c(4)] + IQR(mileage))
abline(h=c(LL, UL), col='red', lwd=2)
text(1+.3, c(LL, UL)+.2, labels=c('Q1-IQR', 'Q3+IQR'), col='red')
text(1,0,label='beyond this value - consider them outliers', col='red')
#beyond this value - consider them outliers

#min/max
abline(h=range(mileage)+.1, col='blue', lwd=2)
text(1+.4, range(mileage)+.3, labels=c('min', 'max'), col='blue')

#mean/ median
abline(h=c(mean(mileage)+.1, median(mileage)+.1), col='brown', lwd=2)
text(c(1+.3,1), c(mean(mileage)-.2, median(mileage)+.2), labels=c(paste('MEAN',round(mean(mileage))), paste('MEDIAN',round(median(mileage),2))), col='brown')

hist(mileage, freq=F)
rug(jitter(mileage))     
lines(density(mileage))
