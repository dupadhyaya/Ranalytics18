#Time Series with CO2 data
#https://www.datacamp.com/community/tutorials/time-series-r

#R packages to be used
library(forecast)
library(TSA)
#ARIMA(p,d,q) process : Autoregressive Integrated Moving Average Models are time series defined by the equation: SARIMA(p,d,q)(P,D,Q) process

# Data from TSA package
data("co2")
#A time series of 468 observations; monthly from 1959 to 1997.
head(co2)
str(co2)
# fitting
fit <- auto.arima(co2)

# Time series plot
plot(fc <- forecast(fit, h = 15))

#%%%%----------------------
#Boardings
data("boardings")
?boardings
# fitting
fit2 <- auto.arima(boardings[,"log.price"])


# forecasting
plot(fc2 <- forecast(fit2, h = 15))

#%%%---------------------------
data('co2', package='datasets')
co2
head(co)
str(co2)
468 * 12
