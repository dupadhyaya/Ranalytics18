
set.seed(1234)
options(digits=2)
x = round(rnorm(30,5,2),0)
x

library(zoo)
?zooreg
z = zooreg(x)
z

z = zooreg(x, start=as.Date("2016-01-01"))
z


z = zooreg(x, start=c(2016,2), freq=1)
z


z = zooreg(x, start=c(2016,2), freq=12)
z

as.zoo(ts(x, start=c(2016,2), freq=12))
zoo(x, seq(2016.0, 2017.5, by=1/12), freq=12)
zoo(x, seq(2016.3, 2017.7, by=1/12), freq=12)

zoo(x, yearqtr(seq(2016.25, 2017.5, by=1/4), freq=4))
z = zooreg(x, start=yearmon(2016), end=yearmon(2017))
z

zooreg(x[(1:5)], end = yearmon(2017))
z1= zooreg(x, end = yearmon(2017.4))
z1
frequency(z)
delta(z)
cycle(z)
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
zrd <- as.zooreg(zoo(x, dd))
zrd
str(zrd)
plot(zrd)
