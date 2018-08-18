#TS4 Time Series
#http://www.statoek.wiso.uni-goettingen.de/veranstaltungen/zeitreihen/sommer03/ts_r_intro.pdf
tui <- read.csv("tui.csv", header=T, dec=",", sep=";")
tui  #dataset is stored as a matrix–object with the name tui
str(tui)
plot(tui[,5],type="l") # A chart with the closing values

plot(tui[,5], type="l",lwd=2, col="red", xlab="time", ylab="closing values",main="TUI AG", ylim=c(0,60) )

#plot differences of the logarithms of the returns.
plot(diff(log(tui[,5])),type="l")

# investigate distributional properties. A first
#step would be to draw a histogram and to compare it with e.g. the density of the ND

hist(diff(tui[,4]),prob=T,ylim=c(0,0.6),xlim=c(-5,5),col="red")
lines(density(diff(tui[,4])),lwd=2)

mu<-mean(diff(tui[,4]))
sigma<-sd(diff(tui[,4]))

x<-seq(-4,4,length=100)
y<-dnorm(x,mu,sigma)
lines(x,y,lwd=2,col="blue")

qqnorm(diff(tui[,4]))
abline(0,1)

x<-diff(log(tui[,5]))
ks.test(x,"pnorm",mean(x),sd(x))

shapiro.test(x)

# Linear Filtering of Time Series ------------------
# plot the closing values of the TUI shares and the averages in different colours
#library(ts) # NA for 3.3.2
library(timeSeries)
plot(tui[,5],type="l")
tui.1 <- filter(tui[,5],filter=rep(1/5,5))
tui.2 <- filter(tui[,5],filter=rep(1/25,25))
tui.3 <- filter(tui[,5],filter=rep(1/81,81))
lines(tui.1,col="red")
lines(tui.2,col="purple")
lines(tui.3,col="blue")

# Decomposition of Time Series ------------------
#http://astro.temple.edu/~buck/Econ616/Kernel/beer.csv




beer<-read.csv("beer.csv",header=T,dec=",",sep=";")
beer<-ts(beer[,1],start=1956,freq=12)
plot(stl(log(beer),s.window="periodic"))

#2.3 Regression analysis -------------------------------------------------
lbeer<-log(beer)
t<-seq(1956,1995.2,length=length(beer))
t2<-t^2
plot(lbeer)
lm(lbeer~t+t2)
lines(lm(lbeer~t+t2)$fit,col=2,lwd=2)

lbeer<-log(beer)
t<-seq(1956,1995.2,length=length(beer))
t2<-t^2
sin.t<-sin(2*pi*t)
cos.t<-cos(2*pi*t)
plot(lbeer)
lines(lm(lbeer~t+t2+sin.t+cos.t)$fit,col=4)

summary(lm(lbeer ~ t+t2+sin.t+cos.t))



# Exponential Smoothing --------------------------------------------------

beer <- read.csv("beer.csv",header=T,dec=",",sep=";")
beer<-ts(beer[,1],start=1956,freq=12)
HoltWinters(beer)
# This performs the Holt–Winters procedure on the beer – dataset. As result, it
#displays a list with e.g. the smoothing parameters (which should be α ≈ 0.076,β ≈ 0.07 and γ ≈ 0.145 in this case).

plot(beer)
lines(HoltWinters(beer)$fitted,col="red") # ERROR

beer.hw<-HoltWinters(beer)

predict(beer.hw,n.ahead=12)
plot(beer,xlim=c(1956,1999))
lines(predict(beer.hw,n.ahead=48),col=2)

# ARIMA–Models-------------------
#Analysis of Autocorrelations and Partial Autocorrelations ----------------------

sim.ar<-arima.sim(list(ar=c(0.4,0.4)),n=1000)
sim.ma<-arima.sim(list(ma=c(0.6,-0.4)),n=1000)
par(mfrow=c(2,2))
acf(sim.ar,main="ACF of AR(2) process")
acf(sim.ma,main="ACF of MA(2) process")
pacf(sim.ar,main="PACF of AR(2) process")
pacf(sim.ma,main="PACF of MA(2) process")

#arima(data,order=c(p,d,q))

data(LakeHuron)
fit<-arima(LakeHuron,order=c(1,0,1))
fit<-arima(LakeHuron,order=c(1,0,1))
tsdiag(fit) # NOT VISIBLE

Box.test(fit$residuals,lag=1)

# Prediction
fit<-arima(LakeHuron,order=c(1,0,1))
LH.pred<-predict(fit,n.ahead=8)

par(mfrow=c(1,1))
plot(LakeHuron,xlim=c(1875,1980),ylim=c(575,584))
LH.pred<-predict(fit,n.ahead=8)
lines(LH.pred$pred,col="red")
lines(LH.pred$pred+2*LH.pred$se,col="red",lty=3)
lines(LH.pred$pred-2*LH.pred$se,col="red",lty=3)

