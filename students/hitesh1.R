#hitesh TS
library(ts)
library(forecast)
tsdata = read.csv(file.choose())
str(tsdata)
tsdata$date = as.Date(tsdata$date)
tsdata$views = as.integer(tsdata$views)
str(tsdata)
summary(tsdata)
dim(tsdata)
aggregate(tsdata$chid, by=list(tsdata$chid), FUN=NROW)

library(dplyr)

table(tsdata$chid)
# for each Channel Predict Views for next 3 months

chn1 = tsdata$chid[1]
#subset data
names(tsdata)

tsdata.subset <- subset(tsdata, chid == chn1, select = c(views, subscriber, videoscount, date))
tsdata.subset

names(tsdata.subset)
library(xts)
subscriber = xts(tsdata.subset[,2], order.by=tsdata.subset$date)
str(subscriber)
head(subscriber)
plot(subscriber)

#Manual Method NOT Working : use autoarima
library(tseries)
adf.test(subscriber)
ndiffs(subscriber)
dsub = diff(subscriber)
dsub  = na.omit(dsub)
plot(dsub)
adf.test(dsub)
?adf.test
acf(dsub)
Pacf(dsub)
fit1a = arima(subscriber, order= c(0,1,1))
fit1a
forecast(fit1a, 90)


library(forecast)
fit1b = auto.arima(subscriber)
fit1b
forecast(fit1b, 90)
accuracy(fit1b)



# Views
head(tsdata.subset)
library(xts)
views = xts(tsdata.subset[,1], order.by=tsdata.subset$date)
head(views)
fit2b = auto.arima(views)
fit2b
forecast(fit2b, 90)
accuracy(fit2b)

## Videos Cpimt
head(tsdata.subset)

videocount = xts(tsdata.subset[,3], order.by=tsdata.subset$date)
head(videocount)
fit3b = auto.arima(videocount)
fit3b
forecast(fit3b, 90)
accuracy(fit3b)
