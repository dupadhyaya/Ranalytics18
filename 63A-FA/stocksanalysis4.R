# Stock Prices Analysis
#https://www.r-bloggers.com/stock-analysis-using-r/
library('quantmod')


getSymbols('AAPL')
chartSeries(AAPL, subset='last 3 months')
addBBands()

#getSymbols function is used to retrieve stock data.  Data can originate in a number of locations.  In the example above, we are obtaining a single stock, Apple.  If you wanted to download several different stock quotes, you can do so in a single command.

getSymbols(c('ORCL','IBM'))

#Once you have retrieved stock data, you can focus on subsets of dates quickly.
AAPL['2010-06-01::2010-06-26']

#also merge data to view comparisons.

head(as.xts(merge(ORCL,IBM)))

#The chartSeries command creates the plot pictured above.  It captures a large amount of information, the date, open and close price, and volume of trading for each day.  Finally, the addBBands() call adds Bollinger Bands to the chart.  Informally, this amounts to a line indicating moving average and two lines a standard deviation above and below this moving average. For the uninitiated, technical indicators (and overlays) can be broken up into four categories – Trend, Volatility, Momentum, and Volume. 
