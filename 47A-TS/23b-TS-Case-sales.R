#TS analysis
#https://stepupanalytics.com/time-series-forecasting-using-r/

library(gsheet)

url = "https://docs.google.com/spreadsheets/d/1D9WaU_CZUyLiZv0TyjFX8pgdJ1WIOh99n37BWvwRAz4/edit#gid=1372342646"

sales = as.data.frame(gsheet2tbl(url))
head(sales)

library(forecast)

data = ts(sales[,2], start = c(2003,1), frequency = 12)
head(data)
data
plot(data, xlab = "Years", ylab = "Sales")

library(tseries)
adf.test(data, alternative = "stationary")

plot(diff(data), ylab = "1st Order Difference of Sales")

data1 = diff(data)
data1

adf.test(data1, alternative = "stationary")
plot(diff(data1), ylab = "2nd Order Difference of Sales")

data2 = diff(data1)
data2

adf.test(data2, alternative = "stationary")

plot(log10(data), ylab = "Log(Sales)")

data10 = log10(data)
data10

adf.test(data10, alternative = "stationary")

plot(diff(data10), ylab = "1st Order Difference of Log(Sales)")
data11 = diff(data10)
plot(diff(data11), ylab = "2nd Order Difference of Log(Sales)")
data12 = diff(data11)

adf.test(data12, alternative = "stationary")

acf(ts(diff(diff(data))), main = "ACF Sales")

pacf(ts(diff(diff(data))), main = "PACF Sales")

ARIMAfit = arima(diff(data), c(2,2,0))
summary(ARIMAfit)

ARIMAautofit = auto.arima(diff(data), approximation = TRUE, trace = TRUE)
summary(ARIMAautofit)

acf(ts(diff(diff(log10(data)))), main = "ACF Log(Sales)")
pacf(ts(diff(diff(log10(data)))), main = "PACF Log(Sales)")

ARIMAautofit2 = auto.arima(diff(log10(data)), approximation = TRUE, trace = TRUE)
summary(ARIMAautofit2)

pred = predict(ARIMAautofit, n.ahead = 36)
pred

pred$pred
pred$se

plot(forecast(ARIMAautofit, h = 36))

acf(ts(ARIMAautofit$residuals), main = "ACF Residual Of Sales")
pacf(ts(ARIMAautofit$residuals), main = "PACF Residual Of Sales")

autoexp_fit = ets(data10)
summary(autoexp_fit)

pred_ets = predict(autoexp_fit, h = 36)
plot(forecast(autoexp_fit))
summary(pred_ets)
acf(autoexp_fit$residuals, lag.max = 20, main = "ACF Residual Of Sales")
