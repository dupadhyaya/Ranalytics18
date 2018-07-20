#Package fBasics

library(fBasics)
#skewness	returns value of skewness,
skewness(mtcars)

#kurtosis	returns value of kurtosis,
kurtosis(mtcars)

#basicStats	computes an overview of basic statistical values,
basicStats(mtcars)

#rowStats	calculates row statistics,
rowStats(mtcars,FUN=mean)

#colStats	calculates column statistics,
colStats(mtcars, FUN=median)

#rowAvgs	calculates row means,
rowAv

colAvgs	calculates column means,
rowVars	calculates row variances,
colVars	calculates column variances,
rowStdevs	calculates row standard deviations,
colStdevs	calculates column standard deviations,
rowSkewness	calculates row skewness,
colSkewness	calculates column skewness,
rowKurtosis	calculates row kurtosis,
colKurtosis	calculates column kurtosis,
rowCumsums	calculates row cumulated Sums,
colCumsums	calculates column cumulated Sums.