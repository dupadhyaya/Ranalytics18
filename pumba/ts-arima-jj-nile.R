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

#Auto ARIMA on Nile DataSet

Nile
#Auto ARIMA
library(forecast)
#forecast::auto.arima()
fit4 = auto.arima(Nile)
fit4

forecast(fit4,h=5)
plot(forecast(fit4,h=5))
#forecasting is generally done for limited periods

