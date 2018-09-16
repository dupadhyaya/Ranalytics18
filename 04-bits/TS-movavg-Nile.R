# TS - Simple Moving Average
#SMA
# technique to get an overall idea of the trends in a data set; it is an average of any subset of numbers. The moving average is extremely useful for forecasting long-term trends


Nile  # river flow from year 1871 to 1970

plot(Nile)

library(forecast)  # for forecasting
opar = par(no.readonly = T)  # save current parameters
par(mfrow=c(2,2))
(ylim = range(Nile))
plot(Nile, main='Original TS')
head(Nile)
ma(Nile,3)
head(Nile,4)
head(ma(Nile,3))
(1120+1160+963)/3
mean(Nile[1:3]);mean(Nile[2:4]); mean(Nile[3:5]); mean(Nile[4:6])
ma(Nile,3)[1:10]

plot(ma(Nile,3), main='SMA k=3', ylim=ylim)
plot(ma(Nile,7), main='SMA k=7', ylim=ylim)
plot(ma(Nile,15),main='SMA k=15', ylim=ylim)
par(opar)
plot(ma(Nile,3), main='SMA k=3', ylim=ylim)




#mfrow mfcol
mtcars
names(mtcars)
plot(mtcars$mpg)
par(mfrow=c(1,2))
plot(mtcars$mpg)
plot(mtcars$disp)

par(mfrow=c(2,1))
plot(mtcars$mpg)
plot(mtcars$disp)

par(mfrow=c(2,2))
plot(mtcars$mpg)
barplot(table(mtcars$cyl))
pie(table(mtcars$am))
hist(mtcars$disp)
