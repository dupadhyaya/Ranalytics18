# LSM
library(fpp)
data(beer)
beer
str(beer)

#Model Parabola
lbeer<-log(beer)
lbeer
t<-seq(1956,1995.2,length=length(beer))
t
t2<-t^2
t2
plot(lbeer)
lm(lbeer~ t + t2)
lines(lm(lbeer~t+t2)$fit,col='red',lwd=3)



#Model2
lbeer<-log(beer)
t<-seq(1956,1995.2,length=length(beer))
t2<-t^2
sin.t<-sin(2*pi*t)
cos.t<-cos(2*pi*t)
plot(lbeer)
lines(lm(lbeer~t+t2+sin.t+cos.t)$fit,col=4)
summary(lm(lbeer ~ t+t2+sin.t+cos.t))
