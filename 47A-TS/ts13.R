#House Sales
3https://www.otexts.org/fpp/6/1
library(fpp)
hsales
data(package='fpp')
par(mfrow=c(2,2))
plot(hsales,xlab="Year",ylab="Monthly housing sales (millions)")
plot(ustreas,xlab="Day",ylab="US treasury bill contracts")
plot(elec,xlab="Year",ylab="Australian monthly electricity production")
plot(diff(dj),xlab="Day",ylab="Daily change in Dow Jones index")
par(mfrow=c(1,1))
fit <- stl(elecequip, s.window=5)
plot(elecequip, col="gray",
     main="Electrical equipment manufacturing",
     ylab="New orders index", xlab="")
lines(fit$time.series[,2],col="red",ylab="Trend")

plot(fit)

monthplot(fit$time.series[,"seasonal"], main="", ylab="Seasonal")

plot(elecequip, col="grey",
     main="Electrical equipment manufacturing",
     xlab="", ylab="New orders index")
lines(seasadj(fit),col="red",ylab="Seasonally adjusted")
ma(elecsales, order=5)
plot(elecsales, main="Residential electricity sales",
     ylab="GWh", xlab="Year")
lines(ma(elecsales,5),col="red")


beer2 <- window(ausbeer,start=1992)
ma4 <- ma(beer2, order=4, centre=FALSE)
ma2x4 <- ma(beer2, order=4, centre=TRUE)

plot(elecequip, ylab="New orders index", col="gray",
     main="Electrical equipment manufacturing (Euro area)")
lines(ma(elecequip, order=12), col="red")

fit <- stl(elecequip, t.window=15, s.window="periodic", robust=TRUE)
plot(fit)
