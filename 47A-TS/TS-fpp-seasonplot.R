# Time Series 6


# Section 5 : fpp package -------------------------------------------------
library(fpp)
plot(a10)
# Intro https://www.otexts.org/fpp/using-r

#Using the Workspace menu, choose "Import Dataset" and import the data from the tute1.csv file.
tute1 = read.csv('tute1.csv')
head(tute1)
tail(tute1)
tute1[,2]
tute1[,"Sales"]
tute1[5,]
tute1[1:10,3:4]
tute1[1:20,]
# Data into TS
tute1 <- ts(tute1[,-1], start=1981, frequency=4)
plot(tute1)

# Plot
seasonplot(tute1[,"Sales"])
seasonplot(tute1[,"AdBudget"])
seasonplot(tute1[,"GDP"])
monthplot(tute1[,"Sales"])
monthplot(tute1[,"GDP"])
monthplot(tute1[,"AdBudget"])

#
plot(Sales ~ AdBudget, data=tute1)
plot(Sales ~ GDP, data=tute1)

#
pairs(as.data.frame(tute1))
#
summary(tute1)
#
hist(tute1[,"Sales"])
hist(tute1[,"AdBudget"])
boxplot(tute1[,"Sales"])
boxplot(as.data.frame(tute1))
#
cor.test(tute1[,"Sales"],tute1[,"AdBudget"])


#https://www.otexts.org/fpp/6/1
par(mfrow=c(2,2))
str(hsales) ;head(hsales)
plot(hsales,xlab="Year",ylab="Monthly housing sales (millions)")
str(ustreas)
plot(ustreas,xlab="Day",ylab="US treasury bill contracts")
str(elec)
plot(elec,xlab="Year",ylab="Australian monthly electricity production")
str(dj)
plot(diff(dj),xlab="Day",ylab="Daily change in Dow Jones index")

# Electrical Components
fit <- stl(elecequip, s.window=5)
plot(elecequip, col="gray",
     main="Electrical equipment manufacturing",
     ylab="New orders index", xlab="")
lines(fit$time.series[,2],col="red",ylab="Trend")
plot(fit)
#
monthplot(fit$time.series[,"seasonal"], main="", ylab="Seasonal")

# Seasonally Adjusted Data seasonal component is removed from the original data,
plot(elecequip, col="grey",
     main="Electrical equipment manufacturing",
     xlab="", ylab="New orders index")
lines(seasadj(fit),col="red",ylab="Seasonally adjusted")

# Moving Average
ma(elecsales, order=5)

# Moving Averages of Moving Averages
# apply a moving average to a moving average. One reason for doing this is to make an even-order moving average symmetric.
str(ausbeer)
beer2 <- window(ausbeer,start=1992)
ma4 <- ma(beer2, order=4, centre=FALSE)
ma4
ma2x4 <- ma(beer2, order=4, centre=TRUE)
ma2x4

# Estimating the trend-cycle with seasonal data
plot(elecequip, ylab="New orders index", col="gray",
     main="Electrical equipment manufacturing (Euro area)")
lines(ma(elecequip, order=12), col="red")

# Classication Decomposition
# x is the time series
#https://www.otexts.org/fpp/6/3


# STL Decomposition
fit <- stl(elecequip, t.window=15, s.window="periodic", robust=TRUE)
plot(fit)

x = data1
x
fit <- decompose(x, type="multiplicative")
plot(fit)

# Forecasting with Decomposition
fit <- stl(elecequip, t.window=15, s.window="periodic", robust=TRUE)
eeadj <- seasadj(fit)
plot(naive(eeadj), xlab="New orders index",
     main="Naive forecasts of seasonally adjusted data")

fcast <- forecast(fit, method="naive")
plot(fcast, ylab="New orders index")

# Exercise
#https://www.otexts.org/fpp/6/7