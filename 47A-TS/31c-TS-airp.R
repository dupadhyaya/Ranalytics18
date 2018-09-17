# Time Series ts1
#https://www.analyticsvidhya.com/blog/2015/12/complete-tutorial-time-series-modeling/

data(AirPassengers)
class(AirPassengers)
#This tells you that the data series is in a time series format
str(AirPassengers)
head(AirPassengers); tail(AirPassengers)
start(AirPassengers)
#This is the start of the time series
end(AirPassengers)
#[1] 1960 12
#This is the end of the time series
frequency(AirPassengers)  # $[1] 12
#The cycle of this time series is 12months in a year
summary(AirPassengers)


# Sec 2 -------------------------------------------------------------------
AirPassengers
#The number of passengers are distributed across the spectrum
plot(AirPassengers)
#This will plot the time series
abline(reg=lm(AirPassengers~time(AirPassengers)))
# This will fit in a line


# Sec3 --------------------------------------------------------------------

cycle(AirPassengers)
#This will print the cycle across years.
plot(aggregate(AirPassengers,FUN=mean))
#This will aggregate the cycles and display a year on year trend
boxplot(AirPassengers~cycle(AirPassengers))
#Box plot across months will give us a sense on seasonal effect


plot(aggregate(AirPassengers,FUN=mean))
plot(log(AirPassengers))
abline(reg=lm(log(AirPassengers) ~ time(AirPassengers)))

plot(diff (log(AirPassengers)))
abline(h=0, col='red')
abline(reg=lm(diff(log(AirPassengers)) ~ time(AirPassengers)))


#Model
acf(AirPassengers)
acf(diff (log(AirPassengers)))
pacf(diff (log(AirPassengers)))

fit = arima(log(AirPassengers), c(0,1,1), seasonal =
              list(order = c(0,1,1), period = 12) )
pred = predict(fit, n.ahead = 10 * 12)
pred1 = 2.718 * pred$pred
ts.plot(AirPassengers, pred1, log='y', lty=c(1,3))

