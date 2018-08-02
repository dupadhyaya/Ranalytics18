#Column Stats

# colStats {timeSeries}
# 
# colStats	 calculates column statistics,
# colSums	 calculates column sums,
# colMeans	 calculates column means,
# colSds	 calculates column standard deviations,
# colVars	 calculates column variances,
# colSkewness	 calculates column skewness,
# colKurtosis	 calculates column kurtosis,
# colMaxs	 calculates maximum values in each column,
# colMins	 calculates minimum values in each column,
# colProds	 computes product of all values in each column,
# colQuantiles	 computes quantiles of each column.

library(timeSeries)
mtcars
colQuantiles(mtcars)
colSkewness(mtcars)
?colQuantiles
colStats(mtcars,mean)
