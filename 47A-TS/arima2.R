#arima
Nile
lag(Nile,1)
?lag
yearmon(Nile)

Acf(Nile)
acf(Nile)
pacf(Nile)
Pacf(Nile)

#Ensure that the TS is stationery
library(forecast)
library(tseries)
plot(Nile)
ndiffs(Nile)
dNile = diff(Nile)
dNile
plot(dNile)
adf.test(dNile)

#Ensure a reasonable model(s) (possible values of p & q)
Acf(dNile)
Pacf(dNile)

#Fit the model
arima(ts, order=c(p,d,q))
      fit = arima(Nile, order=c(0,1,1))
      fit
accuracy(fit)
qqnorm(fit$residuals)
qqline(fit$residuals)
Box.test(fit$residuals,
         type='Ljung-Box')
#Once final model has been chosen, it can be used to make forecast of Future Values.
forecast(fit, 3)
plot(forecast(fit,3), xlab='Year', ylab='Annual Flow')

#eg
library(forecast)
str(sunspots)
head(sunspots)
fit = auto.arima(sunspots)
fit
forecast(fit,3)
accuracy(fit)

