# TS Nile
# 
data("Nile")
str(Nile)
Nile
# Plot the Nile data
plot(Nile)
?plot
# Plot the Nile data with xlab and ylab arguments
plot(Nile, xlab = "Year", ylab = "River Volume", type="b", 
      main = "Annual River Nile Volume at Aswan, 1871-1970")
# Plot the Nile data with xlab, ylab, main, and type arguments

#Dataset : Nile
#Time-Series [1:100] from 1871 to 1970:  1120 1160 963 1210 1160 1160 813 1230 1370 1140 ...
#Time Series: Start = 1871 End = 1970 Frequency = 1 [1] 1120 1160 963 1210 1160 1160 813 1230 1370 1140 995 935 1110
Nile
length(Nile)
Nile[29]
Nile[51:58]
Nile[c(1,98,100)]
which(Nile > 1000)
which(Nile > 1000) + 1870
hist(Nile)
plot(Nile)
#Other Examples on Nile


#Package : Forecast
library(forecast)
opar = par(no.readonly=T)
par(mfrow=c(2,2))
#par(opar)
#Nile Dataset
ylim = c(min(Nile), max(Nile))
plot(Nile, main='Raw time series')
abline(v=c(1892,1900, 1941,1961))
plot(ma(Nile, 3), main='Simple Moving Averages (k=3)', ylim=ylim)
plot(ma(Nile, 7), main='Simple Moving Averages (k=7)', ylim=ylim)
plot(ma(Nile, 15), main='Simple Moving Averages (k=15)', ylim=ylim)

par(opar)

?stl
str(AirPassengers)
AirPassengers
plot(AirPassengers)
AirPassengers_log = log(AirPassengers)
plot( AirPassengers_log, ylab="log(AirPassengers)" )
fit = stl(AirPassengers_log, s.window = 'period')
plot(fit)

fit$time.series
exp(fit$time.series)

par(mfrow=c(1,1))
library(forecast)
monthplot(AirPassengers,xlab="", ylab="")
seasonplot(AirPassengers, year.labels = 'TRUE', main='')


#Eg1a : Dataset - nhtemp
#Mean annual temp in degree F in a city from 1912 to 1971
#No obvious trend, lack seasonal component
library(forecast)
fit = ets(nhtemp, model = 'ANN')
fit

forecast(fit,1)

plot(forecast(fit,1), xlab='Year', ylab=expression(paste("Temp (", degree * F,")" ,)), main=" New Haven Annual Mean Temp")
accuracy(fit)

#Eg1b
#Decompose a TS describing monthly totals (in log 1000) of passengers into additive - trend, seasonal, irregular components ; Predict future travel ; Log values to used
library(forecast)
fit = ets(log(AirPassengers), model='AAA')
fit
accuracy(fit)
pred = forecast(fit, 5)
pred

plot(pred, main ='Forecast for Air Travel', ylab='Log(AirPassengers)', xlab='Time')

pred$mean
pred$mean = exp(pred$mean)
pred$mean

pred$lower = exp(pred$lower)
pred$upper = exp(pred$upper)
p = cbind(pred$mean, pred$lower, pred$upper)
dimnames(p)[[2]] = c("mean", "Lo 80", "Lo 95","Hi 80",  "Hi 95")
p


#Eg1d @15.2.3
library(forecast)
fit =ets(JohnsonJohnson)
fit
plot(forecast(fit), main="Johnson & Johnson Forecasts", ylab="Quarterly Earnings in Dolloars", xlab="TIme", flty=2)

     