# Time Series Arima ts2
# https://www.analyticsvidhya.com/blog/2015/12/complete-tutorial-time-series-modeling/
#library(forecast)
library(tseries)
adf.test(diff(log(AirPassengers)), alternative="stationary", k=0)
#series is stationary enough to do any kind of time series modelling.
#Next step is to find the right parameters to be used in the ARIMA model. 
#ACF Plots

acf(log(AirPassengers))
acf(diff(log(AirPassengers)))
pacf(diff(log(AirPassengers)))
(fit <- arima(log(AirPassengers), c(0, 1, 1),seasonal = list(order = c(0, 1, 1), period = 12)))
pred <- predict(fit, n.ahead = 10*12)
ts.plot(AirPassengers,2.718^pred$pred, log = "y", lty = c(1,3))

