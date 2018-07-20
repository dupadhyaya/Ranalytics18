# Rolling Time Series

library(zoo)
set.seed(0)
nSamples    <- 5000
vecDT       <- rexp(nSamples, 3)
vecTimes    <- cumsum(c(0,vecDT))
vecDrift    <- c(0, rnorm(nSamples, mean = 1/nSamples, sd = 0.01))
vecVals     <- cumsum(vecDrift)
vecZ        <- zoo(vecVals, order.by = vecTimes)
rm(vecDT, vecDrift)

library(xts)
library(TTR)
x <- .xts(vecZ, vecTimes)
xx <- na.locf(cbind(xts(, seq.POSIXt(from=start(x), to=end(x), by='sec')), x))
x$means <- runMean(xx, n=180)
out <- x[!is.na(x[, 1]), ]
tail(out)


tq_mutate_fun_options() %>%
  str()


##  $ zoo                 : chr [1:14] "rollapply" "rollapplyr" "rollmax" "rollmax.default" ...
##  $ xts                 : chr [1:27] "apply.daily" "apply.monthly" "apply.quarterly" "apply.weekly" ...
##  $ quantmod            : chr [1:25] "allReturns" "annualReturn" "ClCl" "dailyReturn" ...
##  $ TTR                 : chr [1:61] "adjRatios" "ADX" "ALMA" "aroon" ...
##  $ PerformanceAnalytics: chr [1:7] "Return.annualized" "Return.annualized.excess" "Return.clean" "Return.cumulative" ..