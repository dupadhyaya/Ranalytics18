#create TS Data
#https://www.r-bloggers.com/r-financial-time-series-tips-everyone-should-know-about/
#
library(xts)
myTs <- xts(floor(runif(400,40,100)),order.by=seq(Sys.Date()-399,Sys.Date(),"days"))
head(myTs)
summary(myTs)
str(myTs)

#head & tail together
ht <- function(d, m=5, n=m){
  # print the head and tail together
  list(HEAD = head(d,m), TAIL = tail(d,n))
}


#Joining 2 TS
myOtherTs <- xts(floor(runif(200, 60,100)),order.by=seq(Sys.Date()-199,Sys.Date(),"days"))
myOtherTs
ht(myOtherTs)
head

# dates intersection
tsInter <- merge.xts(myTs,myOtherTs,join="inner")
ht(tsInter)
dim(tsInter)

# dates union and blanks filled with NAs
tsUnion <- merge.xts(myTs,myOtherTs,join="outer")
dim(tsUnion)
tsUnion


monthlyRtn = apply.monthly(tsInter[,2], sum)
ht(monthlyRtn)
yearlyRtn = apply.yearly(tsInter[,2], sum)
yearlyRtn


#End Points
(newTs.m = endpoints(tsInter, on='months'))
tsInter[1:30]
(newTs.y = endpoints(tsInter, on='years'))
#days, weeks, months, quarters, years
ht(tsInter)
?endpoints


#Missing Values
n = 100; k = 5; N = k *n
prices = cumsum(floor(runif(N, 5,10)))
ht(prices)
theSample = sample(c(1:length(prices)), 10)
prices[theSample] = NA
cumsum(prices)  # NA after first NA value
prices2 = na.locf(prices)
cumsum(prices2)
df1=(cbind(prices, prices2))
df1[!complete.cases(df1),]
df1

library(PerformanceAnalytics)
# Graphs
prices3 = xts(prices2, order.by = seq(Sys.Date()- (length(prices)-1), Sys.Date(),'days'))
charts.PerformanceSummary(Return.calculate(prices3, method='discrete'))
?charts.