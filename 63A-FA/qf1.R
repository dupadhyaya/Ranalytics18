# Quantitative Finance in R
#Chap-1
#https://github.com/matplotlib/sample_data/blob/master/aapl.csv
aapl = read.zoo('aapl.csv', sep=',', header=T, format="%Y-%m-%d")

plot(aapl, main='Apple Closing Prices on NASDAQ', ylab='Price USD', xlab='Date')

ht <- function(d, m=5, n=m){
  list(HEAD = head(d,m), TAIL = tail(d,n))
}
#First & Last Part of TS
ht(aapl)
#all time high on open
aapl[which.max(aapl$Open)]

#simple returns
x = c(1,5,3,7)
diff(x)
lag(x,1)
lag(x, k=-1)
ret_simple = diff(aapl)/ lag(aapl, k=-1) * 100
ret_simple
#compound returns
ret_cont = diff(log(aapl)) * 100
ret_cont

#summary stats about simple returns
head(ret_simple)
summary(coredata(ret_simple))  # biggest loss -51
?coredata

hist(ret_simple, breaks=100, main='Histogram of Simple Returns', xlab='%')
tail(aapl)
aapl_2007 = window(aapl, start = '2007-01-01', end='2007-12-31')
head(aapl_2007)
aapl_2007[which.max(aapl_2007$Close)]

quantile(ret_simple, probs=0.01)
