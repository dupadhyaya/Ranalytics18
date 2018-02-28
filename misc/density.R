density_standard_norm <- function(x)
{
  1/sqrt(2*pi)*exp(-0.5*x^2)
}

dnorm(1, mean = 0, sd = 1)
#[1] 0.2419707
density_standard_norm(1)
#[1] 0.2419707

dnorm(2, mean = 0, sd = 1)

#[1] 0.05399097

density_standard_norm(2) 
#[1] 0.0539909


dnorm(0) #0.3989423
dnorm(0)*sqrt(2*pi) #[1] 1
dnorm(0,mean=4) #[1] 0.0001338302
dnorm(0,mean=4,sd=10) # 0.03682701
v <- c(0,1,2) 
dnorm(v) #0.39894228 0.24197072 0.05399097
x <- seq(-20,20,by=.1)
y <- dnorm(x)
plot(x,y)
y <- dnorm(x,mean=2.5,sd=0.1)
plot(x,y)
#----------
#

set.seed(3000)
xseq<-seq(-4,4,.01)
densities<-dnorm(xseq, 0,1)
cumulative<-pnorm(xseq, 0, 1)
randomdeviates<-rnorm(1000,0,1)

par(mfrow=c(1,3), mar=c(3,4,4,2))

plot(xseq, densities, col="darkgreen",xlab="", ylab="Density", type="l",lwd=2, cex=2, main="PDF of Standard Normal", cex.axis=.8)

plot(xseq, cumulative, col="darkorange", xlab="", ylab="Cumulative Probability",type="l",lwd=2, cex=2, main="CDF of Standard Normal", cex.axis=.8)

hist(randomdeviates, main="Random draws from Std Normal", cex.axis=.8, xlim=c(-4,4))

# Histogram
xseq<-seq(-4,4,.01)
y<-2*xseq + rnorm(length(xseq),0,5.5)
range(y)
par(mfrow=c(1,1))
hist(y, prob=TRUE, ylim=c(0,.06), breaks=20)
curve(dnorm(x, mean(y), sd(y)), add=TRUE, col="darkblue", lwd=2)

y1 = c(2,3,4,4,5)
hist(y1, prob=T)
