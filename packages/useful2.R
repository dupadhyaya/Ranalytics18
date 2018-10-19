#useful Functions

library(useful)


binary.flip(c(1,1,0,1,0,0,1))

classdf(mtcars, cols=c(1:5))
classdf(mtcars)

bottomleft(mtcars, r = 5L, c = 5L)
bottomright(mtcars, r = 5L, c = 5L)
topright(mtcars)
topleft(mtcars)

fortify(acf(sunspot.year, plot=FALSE))
fortify(pacf(sunspot.year, plot=FALSE))

k1 <- kmeans(x=iris[, 1:4], centers=3)
hold <- fortify(k1, data=iris)
head(hold)
hold2 <- fortify(k1)
head(hold2)

MapToInterval(1:10, start=0, stop=1)
mapping(1:10, start=0, stop=1)
mapping(0:100, start=min(mtcars$mpg), stop=max(mtcars$mpg))

require(scales)
vect <- c(1000, 1500, 23450, 21784, 875003780)
multiple(vect)
multiple(vect, extra=dollar)
multiple(vect, extra=identity)

require(ggplot2)
data(diamonds)
ggplot(diamonds, aes(x=x, y=y, color=price*100)) + geom_point() + 
  scale_color_gradient2(labels=multiple)


vect <- c(mean, mode, mean)
vect2 <- c(mean, mode, max)
vect3 <- c(mean, mean)
compare.list(vect, vect)
compare.list(vect, vect2)


theDF <- data.frame(A=1:10, B=11:20, C=1:10, D=11:20)
theDF
colsToFront(theDF, c('B', 'C'))
colsToFront(theDF, c('C', 'B'))
colsToFront(theDF, c('C', 'C'))
colsToBack(theDF, c('C', 'C'))
colsToBack(theDF, c('C', 'B'))
colsToBack(theDF, c('C', 'C'))

theDF <- data.frame(A=1:10, B=1:10, C=1:10)
theDF[c(1, 4, 6), c(1)] <- NA
theDF
theDF[c(3, 4, 8), c(3)] <- NA
theDF
simple.impute(theDF, constant(4))

library(scales)
vect <- c(1000, 1500, 23450, 21784, 875003780)
multiple_format()(vect)
multiple_format(extra=dollar)(vect)
multiple_format(extra=identity)(vect)
multiple_format()(mtcars$mpg)(multiple=kgs)
class(mtcars$mpg)
multiple(vect, multiple='K', digits=2, prefix='Rs')
?multiple_format

load_packages(c('ggplot2', 'dplyr'))

toCheck <- c('BIG', 'little', 'Mixed', 'BIG WITH SPACE', 
             'little with space', 'MIXED with SPACE', '17')
numeric.case(toCheck)


require(scales)
vect <- c(1000, 1500, 23450, 21784, 875003780)
multiple.comma(vect)
multiple.comma(vect, multiple="k")
multiple.comma(vect, multiple="h")

# NOT RUN {
toCheck <- c('BIG', 'little', 'Mixed', 'BIG WITH SPACE', 'little with space', 'MIXED with SPACE')
lower.case(toCheck)
# }


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