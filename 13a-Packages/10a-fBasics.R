#Package fBasics
#http://math.furman.edu/~dcs/courses/math47/R/library/fBasics/html/015A-BasicStatistics.html

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
rowAvgs(mtcars)

#colAvgs	calculates column means,
colAvgs(mtcars)

#rowVars	calculates row variances,
rowVars(mtcars)

#colVars	calculates column variances,

#rowStdevs	calculates row standard deviations,

#colStdevs	calculates column standard deviations,

#rowSkewness	calculates row skewness,

#colSkewness	calculates column skewness,

#rowKurtosis	calculates row kurtosis,

#colKurtosis	calculates column kurtosis,
rowCumsums	calculates row cumulated Sums,
colCumsums	calculates column cumulated Sums.