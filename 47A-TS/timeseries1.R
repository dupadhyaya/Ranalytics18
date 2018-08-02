# Time Series
#https://rpubs.com/ryankelly/tsa6

library(astsa, quietly=TRUE, warn.conflicts=FALSE)
require(knitr)
library(ggplot2)
kings<-scan('http://robjhyndman.com/tsdldata/misc/kings.dat', skip=3)
kings
(kings = ts(kings))

births <- scan("http://robjhyndman.com/tsdldata/data/nybirths.dat")

(births <- ts(births, frequency = 12, start = c(1946, 1)))

plot.ts(kings)  
plot.ts(births)


gift <- scan("http://robjhyndman.com/tsdldata/data/fancy.dat")
(gift<- ts(gift, frequency=12, start=c(1987,1)))

plot.ts(gift)

(logGift = log(gift))
plot.ts(logGift)


#Simple Moving Average
library(TTR)
(kingsSMA3 = SMA(kings, n=3))
plot.ts(kingsSMA3)

(kingsSMA8 = SMA(kings, n=8))
plot.ts(kingsSMA8)

(birthsComp <- decompose(births))
plot(birthsComp)

(birthsSeasonAdj <- births - birthsComp$seasonal)
plot(birthsSeasonAdj)



#
rain <- ts(scan("http://robjhyndman.com/tsdldata/hurst/precip1.dat",skip=1), start=c(1813))
head(rain)
rain
plot.ts(rain)

rainF <- HoltWinters(rain, beta=FALSE, gamma = FALSE)
rainF

plot(rainF)





#Forecasts using Exponential Smoothing
#Simple Exponential Smoothing
rain <- ts(scan("http://robjhyndman.com/tsdldata/hurst/precip1.dat",skip=1), start=c(1813))
plot.ts(rain)

library(forecast)

rainF8 <- forecast:::forecast.HoltWinters(rainF, h=8)
forecast:::plot.forecast(rainF8)
acf(rainF8$residuals, na.action = na.pass)
rainF8$residuals
Box.test(rainF8$residuals, lag=20, type='Ljung-Box')

plot.ts(rainF8$residuals)


skirts <- ts(scan("http://robjhyndman.com/tsdldata/roberts/skirts.dat",skip=5), start=c(1866))
plot.ts(skirts)

skirtsF <- HoltWinters(skirts, gamma=F)
skirtsF
skirtsF$SSE
plot(skirtsF)


# Forecast into the future
skirtsF19 <- forecast:::forecast.HoltWinters(skirtsF, h=19)
forecast:::plot.forecast(skirtsF19)

dev.off(); graphics.off()
par(mar=c(3,2,2,2))
par(mfrow=c(3, 1))
acf(skirtsF19$residuals, lag.max=20, na.action = na.pass)
Box.test(skirtsF19$residuals, lag=20, type='Ljung-Box')

plot.ts(skirtsF19$residuals)

par(mfrow=c(1, 1))
#Eg2
giftLog <- log(gift) # take natural log
plot.ts(giftLog)


giftLogF <- HoltWinters(giftLog)
giftLogF

giftLogF$SSE
plot(giftLogF)

giftLogF48 <- forecast:::forecast.HoltWinters(giftLogF, h=48) # predict 48 months ahead
forecast:::plot.forecast(giftLogF48)

par(mar=c(3,2,2,2))

#Test
acf(giftLogF48$residuals, lag.max=20, na.action = na.pass)

Box.test(giftLogF48$residuals, lag=20, type='Ljung-Box')
plot.ts(giftLogF48$residuals)

