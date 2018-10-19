




#library - useful
library(useful)
k1 <- kmeans(x=iris[, 1:4], centers=3)
plot(k1)
plot(k1, data=iris)

toCheck <- c('BIG', 'little', 'Mixed', 'BIG WITH SPACE', 'little with space', 'MIXED with SPACE')
find.case(toCheck, 'upper')
find.case(toCheck, 'lower')


data(iris)
hartiganResults <- FitKMeans(iris[, -ncol(iris)])
PlotHartigan(hartiganResults)

data=mtcars
#ForceDataFrame(data)
indexToPosition(3, 2)
indexToPosition(c(1, 4, 5, 7, 9), 3)
indexToPosition(1:16, 4)
indexToPosition(c(1, 3, 5, 6, 8, 10, 11, 13, 15), 5)

x=mtcars
left(x, c = 5L)

theDF <- data.frame(A=1:10, B=11:20, C=1:10, D=11:20)
df <- moveToFront(theDF, c('B', 'C'))
df
moveToFront(theDF, c('C', 'B'))
moveToFront(theDF, c('C', 'C'))
moveToBack(theDF, c('C', 'C'))
moveToBack(theDF, c('C', 'B'))
moveToBack(theDF, c('C', 'C'))


plot(sunspot.year)
plot(sunspot.year, acf=TRUE)

positionToIndex(1, 2, 2)
positionToIndex(row=c(1, 1, 2, 1, 3), col=c(1, 2, 2, 3, 3), nrow=3)
positionToIndex(rep(1:4, 4), rep(1:4, each=4), nrow=4)
positionToIndex(rep(c(1, 3, 5), 3), rep(1:3, each=3), nrow=5)


theDF <- data.frame(A=1:10, B=1:10)
reclass(theDF) <- 'newclass'
class(theDF)
theDF <- reclass(theDF, 'another')
class(theDF)

right(diamonds) # displays all rows and only the last 5 columns

myData <- data.frame(Upper=LETTERS, lower=letters)
myData
shift.column(data=myData, columns="lower")
shift.column(data=myData, columns="lower", len=2)
shift.column(data=myData, columns=c("lower", "Upper"), len=3, up=T)
shift.column(data=myData, columns=c("lower", "Upper"), len=3, up=F)


theDF <- data.frame(A=1:10, B=1:10, C=1:10)
theDF[c(1, 4, 6), c(1)] <- NA
theDF[c(3, 4, 8), c(3)] <- NA
theDF
simple.impute.data.frame(theDF)
simple.impute.data.frame(theDF, mean)
simple.impute.data.frame(theDF, constant(4))

subOut(c("Hello", "(parens)", "Excited! Mark"))
subOut(c("Hello", "(parens)", "Excited! Mark"), specialChars=c("!", "("))

subSpecials(c("Hello", "(parens)", "Excited! Mark"))
subSpecials(c("Hello", "(parens)", "Excited! Mark"), specialChars=c("!", "("))
subSpecials(c("Hello", "(parens)", "Excited! Mark"),
            c("This is a period. And this is an asterisk *"), specialChars=c("!", "("))
subSpecials(c("Hello", "(parens)", "Excited! Mark"),
            c("This is a period. And this is an asterisk *"), specialChars=c("!", "(", "*"))