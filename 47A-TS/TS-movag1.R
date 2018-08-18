# TS Moving Averages 
# Daily to Month to Yearly Averages
# Section 1 ---------------------------------------------------------------


(x = 1:20)
# 3 Year and Past Data
?filter  #Linear Filtering of TS
mav <- function(x,n=3){filter(x,rep(1/n,n), sides=1)}
mav(x)
# First 2 values are NA (Previous Data)
# 5 Year and Past Data
mav <- function(x,n=5){filter(x,rep(1/n,n), sides=1)}
mav(x)
# First 4 valueas are NA
# 3 Year and Past & Present Data : Centered Sides=2
mav <- function(x,n=3){filter(x,rep(1/n,n), sides=2)}
mav(x)
# 1st and Last values are NA

# 5 Year and Past & Present Data : Centered Sides=2
mav <- function(x,n=5){filter(x,rep(1/n,n), sides=2)}
mav(x)
# 1st,2nd and Last 2 values are NA

#https://druedin.com/2012/08/11/moving-averages-in-r/

# Price of milk over consective 6 years
data1 <- c(30,32,42,50,60,90)
plot(data1, type="l", col="blue")
text(1:5, data1, data1, pos=2, col="blue")
# draw line of 3 period moving average Past Periods forecast
mav2 <- function(x,n=3){filter(x,rep(1/n,n), sides=1)}
mav2(data1)
lines(mav2(data1), type="b", col="red")
text(1:5, mav2(data1,3), round(mav2(data1,3),2), pos=3, col="red")

# if NA values
na.omit(mav(c(4,5,4,6,NA,4), 3))

# Section2 ----------------------------------------------------------------
# Using ZOO package
library(zoo)
rollmean(data1,3)


# Section 3 ---------------------------------------------------------------

library(forecast)
?ma
# 3 year moving average
ma(data1,order=3)
plot(data1)
lines(ma(data1,order=3),col='red')
text(data1)



# Section 4 TTR -----------------------------------------------------------
library(TTR)
?MovingAverages
#Simple Moving average for past 3 observations
SMA(data1,3)
data(ttrc)
str(ttrc); dim(ttrc)
head(ttrc)
#SMA over 20month 
sma.20 = SMA(ttrc[,'Close'],20)
sma.20


# Section 5 hydroTSM ------------------------------------------------------
#https://www.rforge.net/doc/packages/hydroTSM/ma.html

library(hydroTSM)
ma(x,3)
# Loading daily streamflows at the station Oca en Ona (Ebro River basin, Spain) ##
data(OcaEnOnaQts)
x <- OcaEnOnaQts

## Daily to Monthly ts
m <- daily2monthly(x, FUN=mean, na.rm=FALSE)
x
m
# Plotting the monthly values
plot(m, xlab="Time")

## Plotting the annual moving average in station 'x'
lines(ma(m, win.len=12), col="blue")

