# Zoo package
#Eg1
library(zoo)
library(lattice)
# create test data
z <- zooreg(1:83, start = as.Date("2009-04-01"), deltat = 7)
head(z)
xyplot(z)


# Time series plots with good X axis labels
library(zoo)
# data
today = Sys.Date()
dates = as.Date((today-500):today)
head(dates)
z = zoo (100+cumsum(rnorm(501)), dates)
cumsum(rnorm(501))
head(z)

# method1 : default X axis labels do not look good
?plot.zoo
plot(z)
?plot.ts
plot(ts(z))

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
index
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



xx.Date <- as.Date((Sys.Date()-500):Sys.Date())
x <- zoo(cumsum(rnorm(501)), xx.Date)
tt=time(x)
plot(x, xaxt ="n")
tt <- time(x)
ix <- seq(1, length(tt), by=60) #every 60 days
fmt <- "%b-%d" # format for axis labels
labs <- format(tt[ix], fmt)
axis(side = 1, at = tt[ix], labels = labs,  cex.axis = 0.7)

#Eg: Set 2
#Eg1
x.Date <- as.Date(paste(rep(2003:2004, each = 12), rep(1:12, 2), 1, sep = "-"))
head(x.Date)
x <- zoo(rnorm(24), x.Date)
head(x)
plot(x)
#Eg2
plot(x, xaxt = "n")
axis(1, at = time(x), labels = FALSE)
time(x)
#Eg3
plot(x)
axis(1, at = time(x), labels = FALSE)
#Eg4
plot(x)
times <- time(x)
ticks <- seq(times[1], times[length(times)], by = "weeks")
axis(1, at = ticks, labels = FALSE, tcl = -0.3)
