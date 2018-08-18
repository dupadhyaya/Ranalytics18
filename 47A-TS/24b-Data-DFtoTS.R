# Times Series 
#DF to TS

Lines <- "Dates   Bajaj_close Hero_close
3/14/2013   1854.8  1669.1
3/15/2013   1850.3  1684.45
3/18/2013   1812.1  1690.5
3/19/2013   1835.9  1645.6
3/20/2013   1840    1651.15
3/21/2013   1755.3  1623.3
3/22/2013   1820.65 1659.6
3/25/2013   1802.5  1617.7
3/26/2013   1801.25 1571.85
3/28/2013   1799.55 1542"
Lines

library(zoo)
z <- read.zoo(text = Lines, header = TRUE, format = "%m/%d/%Y")
z

DF <- read.table(text = Lines, header = TRUE)
z2 <- read.zoo(DF, format = "%m/%d/%Y")
z2

zz <- z
time(zz) <- 1:nrow(zz)
zz

as.ts(z)
as.ts(zz)
#The first has a time index which is the number of days since the Epoch (January 1, 1970) and will have NAs for missing days and the second will have 1, 2, 3, ... as the time index and no NAs.

#Monthly Series
z.m <- as.zooreg(aggregate(z, as.yearmon, mean), freq = 12)
as.ts(z.m)

#time_ser=ts(data,frequency=4,start=c(1954,2))
