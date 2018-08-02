# Time Series ts3
#http://a-little-book-of-r-for-time-series.readthedocs.io/en/latest/src/timeseries.html
kings <- scan("http://robjhyndman.com/tsdldata/misc/kings.dat",skip=3)
#Read 42 items
kings
#To store the data in a time series object, we use the ts() function in R.

kingstimeseries <- ts(kings)
kingstimeseries
# Sometimes the time series data set that you have may have been collected at regular intervals that were less than one year, 
#for example, monthly or quarterly. In this case, you can specify the number of times that data was collected per year by using 
#the ‘frequency’ parameter in the ts() function. For monthly time series data, you set frequency=12, while for quarterly time series data, 
#you set frequency=4.

#You can also specify the first year that the data was collected, and the first interval in that year by using the ‘start’ parameter 
#in the ts() function. For example, if the first data point corresponds to the second quarter of 1986, you would set start=c(1986,2).

plot.ts(kingstimeseries)



# Sec2 --------------------------------------------------------------------
#example is a data set of the number of births per month in New York city, from January 1946 to December 1959

births <- scan("http://robjhyndman.com/tsdldata/data/nybirths.dat")
#Read 168 items
birthstimeseries <- ts(births, frequency=12, start=c(1946,1))
birthstimeseries
plot.ts(birthstimeseries)

# Sec3 --------------------------------------------------------------------

souvenir <- scan("http://robjhyndman.com/tsdldata/data/fancy.dat")
#Read 84 items
souvenirtimeseries <- ts(souvenir, frequency=12, start=c(1987,1))
souvenirtimeseries
plot.ts(souvenirtimeseries)
#In this case, it appears that an additive model is not appropriate for describing this time series, since the size of the seasonal fluctuations and random fluctuations seem to increase with the level of the time series. Thus, we may need to transform the time series in order to get a transformed time series that can be described using an additive model. For example, we can transform the time series by calculating the natural log of the original data:
logsouvenirtimeseries <- log(souvenirtimeseries)
plot.ts(logsouvenirtimeseries)
# size of the seasonal fluctuations and random fluctuations in the log-transformed time series seem to be roughly constant over time, and do not depend on the level of the time series. Thus, the log-transformed time series can probably be described using an additive model.



# Decomposing Time Series -------------------------------------------------

# Decomposing a time series means separating it into its constituent components, which are usually a trend component and an irregular component, and if it is a seasonal time series, a seasonal component.
# http://a-little-book-of-r-for-time-series.readthedocs.io/en/latest/src/timeseries.html#decomposing-time-series
library("TTR")
kingstimeseriesSMA3 <- SMA(kingstimeseries,n=3)
plot.ts(kingstimeseries)
plot.ts(kingstimeseriesSMA3)

kingstimeseriesSMA8 <- SMA(kingstimeseries,n=8)
plot.ts(kingstimeseriesSMA8)
forecast(kingstimeseriesSMA8,3)
plot(forecast(kingstimeseriesSMA8,3))

birthstimeseriescomponents <- decompose(birthstimeseries)
birthstimeseriescomponents$seasonal # get the estimated values of the seasonal component
plot(birthstimeseriescomponents)

# Seasonal Adjusting
birthstimeseriescomponents <- decompose(birthstimeseries)
birthstimeseriesseasonallyadjusted <- birthstimeseries - birthstimeseriescomponents$seasonal

plot(birthstimeseriesseasonallyadjusted)


# Forecasts using Exponential Smoothing - make short-term forecasts for time series data.----------------------------------

rain <- scan("http://robjhyndman.com/tsdldata/hurst/precip1.dat",skip=1)
#Read 100 items
rainseries <- ts(rain,start=c(1813))
plot.ts(rainseries)

rainseriesforecasts <- HoltWinters(rainseries, beta=FALSE, gamma=FALSE)
rainseriesforecasts
rainseriesforecasts$fitted
plot(rainseriesforecasts)
rainseriesforecasts$SSE
HoltWinters(rainseries, beta=FALSE, gamma=FALSE, l.start=23.56)

library("forecast")
#error in code
rainseriesforecasts2 <- forecast.HoltWinters(rainseriesforecasts, h=8)
rainseriesforecasts2
plot.forecast(rainseriesforecasts2)
acf(rainseriesforecasts2$residuals, lag.max=20)
#Box.test(rainseriesforecasts2$residuals, lag=20, type="Ljung-Box")
plot.ts(rainseriesforecasts2$residuals)

