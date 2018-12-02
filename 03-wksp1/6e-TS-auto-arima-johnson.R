#Times Series Analysis 
# is the price of Johnson and Johnson shares change over time
# are there quarterly effects with share prices rising & falling in a regular fashion throughtout the year
# Can you forecast what future share prices will be and to what degree of accuracy

#dataset - Johnson
#Quarterly earnings per Johnson Shares
#Steps - Plot, Describe, Decompose, Forecast - Simple MA, Exp, ARIMA

JohnsonJohnson

library(forecast)

#ets auto select best predicton model
?ets
#smoothing time series data using the exponential window function. Whereas in the simple moving average the past observations are weighted equally, exponential functions are used to assign exponentially decreasing weights over time

fit1 = ets(JohnsonJohnson)
fit1
#alpha - trend
#beta  = seasonal
#gamma  - irregular

JohnsonJohnson
head(JohnsonJohnson)
tail(JohnsonJohnson)

(f1= forecast(fit1,h=10))  # 
?forecast.ets
plot(f1, main='Johnson Shares', ylab='Quartery Earnings', xlab='Time', flty = 3)  # linetype for forecast area
#shaded portion is confidence intervals area

par(mfrow=c(1,1))

# ARIMA Forecasting : 
#popular and widely used statistical method for time series forecasting is the ARIMA model. ARIMA is an acronym that stands for AutoRegressive Integrated Moving Average.

#http://slideplayer.com/5259056/16/images/98/Seasonal+Components--Model+Selection.jpg

f2 = auto.arima(JohnsonJohnson)
summary(f2)
tail(JohnsonJohnson)  # last few values
forecast(f2,h=5)
plot(forecast(f2,h=5))

#ARIMA Forecasting  : compare two datasets
library(tseries)
plot(JohnsonJohnson)
ndiffs(JohnsonJohnson)
plot(diff(JohnsonJohnson))

plot(Nile)
plot(diff(Nile))
ndiffs(Nile)

#-----
djj = diff(JohnsonJohnson)
plot(djj)

dnile = diff(Nile)
plot(dnile)

#----
adf.test(djj)
#if pv < 0.05 accept Alt Hypothesis that series is stationary

#Model Selection 
#parameters p, d , q
# d = no of diffs applied to make the series stationary
#https://people.duke.edu/~rnau/arimrule.htm
Acf(dnile)
#Trail off to zero : Zero after lag ; 0,1(p)
#Zero after lag q : Trails off to zero ; 1(q), 0 
#Trails off to zero : Trial off to zero : 0,0
#Nile - 1 large auto correlation at lag 1 : 
#Nile - pacf trails off to zero as the lags gets bigger
?arima
Pacf(dnile)

fit3 = arima(Nile, order=c(0,1,1)) # p,d,q
fit3

(fit3b = arima(Nile, order=c(1,1,1)))


#Model Test
qqnorm(fit3$residuals) # residuals ND
qqline(fit3$residuals)

#auto correl = 0 : check
Box.test(fit3$residuals, type='Ljung-Box')
#Test auto corr : H0= r=0 (True)

#Forecast
forecast(fit3,4)

Nile
#Auto ARIMA
plot(Nile)

library(forecast)
#forecast::auto.arima()
fit4 = auto.arima(Nile)
fit4

forecast(fit4,5)
plot(forecast(fit4,5))

