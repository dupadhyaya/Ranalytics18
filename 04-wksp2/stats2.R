#Stats 

#Package fBasics

library(fBasics)
#skewness	returns value of skewness,
skewness(mtcars)
plot(density(mtcars$cyl))
plot(density(mtcars$mpg))

#kurtosis	returns value of kurtosis,
kurtosis(mtcars)
plot(density(mtcars$qsec))

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
colVars(mtcars)

#rowStdevs	calculates row standard deviations,
rowStdevs(mtcars)

#colStdevs	calculates column standard deviations,
colStdevs(mtcars)

#rowSkewness	calculates row skewness,

#colSkewness	calculates column skewness,

#rowKurtosis	calculates row kurtosis,

#colKurtosis	calculates column kurtosis,
rowCumsums	calculates row cumulated Sums,
colCumsums	calculates column cumulated Sums.