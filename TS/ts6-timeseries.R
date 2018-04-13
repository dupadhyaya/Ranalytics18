#TS using Library Time Series
#https://www.statmethods.net/advstats/timeseries.html read this
library(timeSeries)

# Create Time Series data of Finance Sales
sales = c(18, 33, 41, 7, 34, 35, 24, 25, 24, 21, 25, 20,
          22, 31, 40, 29, 25, 21, 22, 54, 31, 25, 26, 35)
length(sales)

#base package of ts
(tsales = ts(sales, start=c(2016,4), end=c(2018,4), frequency=24)) # period diveded into 24 equal intervals

is.timeSeries(tsales)
tsales2 = as.timeSeries(tsales)

# Read the pdf and perform functions in the package

