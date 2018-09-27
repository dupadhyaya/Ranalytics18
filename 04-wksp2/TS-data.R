#ts9
# save a numeric vector containing 72 monthly observations # from Jan 2009 to Dec 2014 as a time series object
myvector = round(runif(6*12)*100,0)
myvector
myts <- ts(myvector, start=c(2009, 1), end=c(2014, 12), frequency=12)
myts
# subset the time series (June 2014 to December 2014)
myts2 <- window(myts, start=c(2014, 6), end=c(2014, 12))
myts2
# plot series
plot(myts)


#Eg2
sales= c(18,33,41,7,34,35,24,25,24,21,25,20, 22,31,40,29,25,21,22,54,31,25,26,35)
tsales = ts(sales, start=c(2003,1), frequency=12)
tsales
plot(tsales)
plot(tsales, type='o', pch=19)
start(tsales)
end(tsales)
frequency(tsales)
tsales.subset = window(tsales, start=c(2003,5), end=c(2004,6))
tsales.subset

#Yearly Series

myvector = round(runif(50) * 100,0)
myvector
myts <- ts(myvector, start=c(2009,2), end=c(2014,11), frequency=3)
myts
myts2 <- window(myts, start=c(2010), end=c(2013))
myts2


# quarterly 

myvector = round(runif(50) * 100,0)
myvector
myts <- ts(myvector, start=c(2009,1), end=c(2014,11), frequency=3)
myts
str(myts)
plot(myts, type='o', pch=19)
text()

plot.ts(myts, type='o', pch=19, xy.labels=F)

axis(1, myts$Date, format(myts$Date, "%b %d"), cex.axis = .7)


myts <- ts(myvector, start=c(2009,2), end=c(2014,9), frequency=3)
myts
str(myts)


myts2 <- window(myts, start=c(2010), end=c(2013))
myts2
plot(myts, type='o', pch=19)
str(myts2)



myts2 <- window(myts, start=c(2014, 6), end=c(2014, 12))
plot(myts,type='o', pch=19)
text()
plot(myts2,type='o', pch=19)


library(zoo)
x.Date <- as.Date(paste(rep(2003:2004, each = 12), rep(1:12, 2), 1, sep = "-"))
x.Date
?zoo
x <- zoo(rnorm(24), x.Date)
x
plot(x)



#If we want different tick locations, we can suppress the default axis plotting and add our own:
  
plot(x, xaxt = "n")
axis(1, at = time(x), labels = FALSE)
#Or combine them:
  
plot(x)
axis(1, at = time(x), labels = FALSE)

## weekly ticks
plot(x)
times <- time(x)
ticks <- seq(times[1], times[length(times)], by = "weeks")
axis(1, at = ticks, labels = FALSE, tcl = -0.3)


library(zoo)
library(lattice)

# create test data
z <- zooreg(1:83, start = as.Date("2009-04-01"), deltat = 7)

xyplot(z)




# Time series plots with good X axis labels
library(zoo)
# data
today = Sys.Date()
dates = as.Date((today-500):today)
dates
z = zoo (100+cumsum(rnorm(501)), dates)
z
# method1 : default X axis labels do not look good
?plot.zoo
plot(z)
?plot.ts
plot(ts(z))
time(z)
# method 2 : Lattice
library(lattice)
?xyplot.zoo
xyplot(z)
xyplot(z, lwd=2, col="tomato")

# method 3 : XTS
library(xts)
?plot.xts
plot(as.xts(z))
plot(as.xts(z), auto.grid=F, major.format="%b %y", las=2)

# method 4 : Base graph
timeline = time(z)
summary(timeline)
index = seq(from=1, to=length(timeline), 90) # put ticks every 90 days
plot(z, xaxt="n")
axis(side=1, at=timeline[index], label=format(timeline[index], "%b %y"), cex.axis=0.8)

# method 5 : ggplot
library(ggplot2)
library(scales)
?date_breaks
df = data.frame(date=as.POSIXct(time(z)), value=as.numeric(z))
head(df)
# default plot
ggplot(df, aes(x=date, y=value)) + geom_line()
# formatted
ggplot(df, aes(x=date, y=value)) + geom_line() + 
  scale_x_datetime(labels=date_format("%b '%y"))
# custom breaks
ggplot(df, aes(x=date, y=value)) + geom_line() + 
  scale_x_datetime(labels=date_format("%b '%y"), breaks=date_breaks("3 months"))
