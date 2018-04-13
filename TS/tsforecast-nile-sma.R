# TS - Simple Moving Average
#SMA

#Data set
Nile

library(forecast)  # for forecasting
opar = par(no.readonly = T)
par(mfrow=c(2,2))
(ylim = range(Nile))
plot(Nile, main='Original TS')
head(Nile)
head(ma(Nile,3))
mean(Nile[1:3])
(1120+1160+963)/3

plot(ma(Nile,3), main='SMA k=3', ylim=ylim)
plot(ma(Nile,7), main='SMA k=7', ylim=ylim)
plot(ma(Nile,15),main='SMA k=15', ylim=ylim)
par(opar)

