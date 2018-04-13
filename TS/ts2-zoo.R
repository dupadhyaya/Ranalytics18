# Zoo Package
#Regular and Irregular Time Series
# normal ts commands creates date in series/ sequence

set.seed(1234)
options(digits=2)
(sales = round(rnorm(30,50,10),0))  #normal distributed values


library(zoo)
?zooreg
(z1 = zooreg(sales))  #nothing much done here only type of object changed
class(z1)

(z2 = zooreg(sales, start=as.Date("2016-01-01")))

sales
length(2000:2017) ; length(sales)
(z3 = zooreg(sales, start=c(2000,3), end=c(2017,3), freq=12, calendar=T))
?zoo  - used for converting ts to zoo format
#(z3 = zoo(sales, start=c(2000,3), end=c(2017,3), freq=12, calendar=T)) # error

(sales4 = zooreg(sales, start=c(2016,2), freq=12))

#compare ts and zoo
(ts(sales,start=c(2016,2), freq=12))
as.zoo(ts(x, start=c(2016,2), freq=12))

zoo(sales, seq(2016.0, 2017.5, by=1/12), freq=12)
zoo(sales, seq(2016.3, 2017.7, by=1/12), freq=12)
zoo(sales, c(2016.1, 2016.4, 2016.13))  #irregular TS

zoo(sales, yearqtr(seq(2016.25, 2017.5, by=1/4)))
zooreg(sales, start=yearmon(2016), end=yearmon(2017))

zooreg(sales[(1:5)], end = yearmon(2017))  #only end date specified, works backwards
(z7= zooreg(sales, end = yearmon(2018.10)))  #.10 - Feb, .25 - Apr

frequency(z7)
delta(z7)
cycle(z7)
cycle(z[-(3:4)])
lag(z, k=-1)
diff(z)
x <- c(1, 2, 3, 6)
zz <- zoo(x, x)
zz
zr <- as.zooreg(zz)
lag(zz, k = -1)
lag(zr, k = -1)
diff(zz)
diff(zr)



dd <- as.Date(c("2016-01-01", "2016-01-02", "2000-01-03", "2000-01-04"))
zrd <- as.zooreg(zoo(sales, dd))
zrd
str(zrd)
plot(zrd)
