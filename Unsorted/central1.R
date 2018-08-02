# Central Tendencies

x = ceiling(rnorm(100, 50, 10))  # 100 random nos, mean=50,sd=10
x
hist(x)
density(x)
plot(density(x), xlab='Marks', ylab='Relative %', 
     main='Distribution of Marks')
abline(v=mean(x), col='red', lty=1)
abline(v=median(x), col='green', lty=2)
abline(v=mode(x))  # error
library(modeest)
m =mlv(x,  method = "mfv")
m$M
abline(v=m$M, col='blue' , lty=3)
?abline
text(c(mean(x), median(x), m$M ),c(0.01,0.02,0.03), 
     col=c('red','green','blue'), cex=.5, labels= c('Mean', 'Median', 'Mode'))
?text
text=c(mean(x), median(x), m$M)
text
mtext(text=c(mean(x), median(x), m$M), side=1,col=c('red','green','blue')
      ,cex=0.5,at= c(mean(x), median(x), m$M ))
?mtext

