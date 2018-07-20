# TS Forecasting with Exponential Smoothening

# Simple exponential smoothing
library(forecast)
?nhtemp
#Mean annual Temp in Degree F from 1912 to 1917 : 60 observations
# Types of Smoothening : (level, trend, seasoanal) : A- Additive, None, Z-automatic
# Simple - Level  : model- ANN
# double - level, slope (trend) : model : AAN
# triple - level, slope(trend), seasonal : model - AAA
par(mfrow=c(1,1))
plot(nhtemp)
(fitse = ets(nhtemp, model='ANN'))
(fitse2 = ses(nhtemp))

forecast(fitse,3)
plot(forecast(fitse,c(3)))
accuracy(fitse)

#Holt Exponential Smoothening
TS = level + slope * t + irregular
plot(AirPassengers)
#log model to use additive model
plot(log(AirPassengers))

(fithe = ets(log(AirPassengers), model='AAA'))
(pred = forecast(fithe, 5))
plot(pred, main='Forecast for Air Travel', ylab='Log (Air Passengers)', xlab='Time')
#since log was used, use exp to get predicted values
pred$mean
(pred$mean = exp(pred$mean))
(pred$lower = exp(pred$lower))
(pred$upper = exp(pred$upper))
(p = cbind(pred$mean, pred$lower, pred$upper))

(pred$mean = exp(pred$mean))




#Holt Winters Exponential Smoothening
TS = level + slope * t + s(t) + irregular

fit <- HoltWinters(nhtemp, beta=FALSE, gamma=FALSE)
fit
forecast(fit, 1)
plot(forecast(fit, 1), xlab="Year",   ylab=expression(paste("Temperature (", degree*F,")",)), main="New Haven Annual Mean Temperature")
accuracy(fit)
# Listing 15.5 - Exponential smoothing with level, slope, and seasonal components
fit <- HoltWinters(log(AirPassengers))
fit
accuracy(fit)
pred <- forecast(fit, 5)
pred
plot(pred, main="Forecast for Air Travel",
     ylab="Log(AirPassengers)", xlab="Time")
pred$mean <- exp(pred$mean)
pred$lower <- exp(pred$lower)
pred$upper <- exp(pred$upper)
p <- cbind(pred$mean, pred$lower, pred$upper)
dimnames(p)[[2]] <- c("mean", "Lo 80", "Lo 95", "Hi 80", "Hi 95")
p
# Listing 15.6 - Automatic exponential forecasting with ets()
library(forecast)
fit <- ets(JohnsonJohnson)
fit
plot(forecast(fit), main="Johnson and Johnson Forecasts",
     ylab="Quarterly Earnings (Dollars)", xlab="Time")
# Listing 15.7 - Transforming the time series and assessing stationarity
library(forecast)
library(tseries)
plot(Nile)
ndiffs(Nile)
dNile <- diff(Nile)
plot(dNile)
adf.test(dNile)

library(forecast)
?auto.arima
?arima
