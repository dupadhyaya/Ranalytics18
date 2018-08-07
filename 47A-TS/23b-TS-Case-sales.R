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
