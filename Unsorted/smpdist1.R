# Sampling Distribution ####
plot.new()

# Generate Random Nos from ND ####
rnorm(100)
rnorm(100)*10
round(rnorm(100)*10)
x=round(rnorm(100)*10)
meanx = mean(x)
sdx = sd(x)
# plot ####
plot(density(x))

# dnorm() returns the probability density function or pdf.####
dnorm(1)
dnorm(-2)
dnorm(3)
#height of the normal curve at some value along the x-axis. ####
dnorm(1,mean=meanx,sd=sdx)
dnorm(10,mean=meanx,sd=sdx)
dnorm(10,mean=meanx,sd=sdx)
abline(h=dnorm(-10,mean=meanx,sd=sdx))
abline(h=dnorm(20,mean=meanx,sd=sdx))

# Cumulative Freq / Area under the curve
# default - lower tail. area from left side
pnorm(0)
pnorm(0,mean=meanx, sd=sdx)
pnorm(10,mean=meanx, sd=sdx)
pnorm(100,mean=meanx, sd=sdx)
pnorm(30,mean=meanx, sd=sdx)

abline(v=30,col=4,lwd=2)
abline(v=-25,col=4,lwd=2)
abline(v=meanx - 1 * sdx,col=4,lwd=3)
# Upper Tail
pnorm(15,mean=meanx, sd=sdx,lower.tail = F)
abline(v=15,col=6,lwd=2)  # area to the right of 15

plot.new()
plot(density(x))

#Quantiles
qnorm(.95)
qnorm(.10) # 10% values
abline(v=qnorm(.95,mean=meanx,sd=sdx),col="red",lwd=4)
# 95% values upto this point from left
# 60% values from right
qnorm(.60,mean=meanx,sd=sdx,lower.tail = F)
abline(v=qnorm(.60,mean=meanx,sd=sdx,lower.tail = F),col="red",lwd=5)
qnorm(c(.025,.975),mean=meanx,sd=sdx)
abline(v=qnorm(c(.025,.975),mean=meanx,sd=sdx),col="blue",lwd=3)
