# Time Series - Regression

data("usconsumption")
#https://www.otexts.org/fpp/4/8
?usconsumption

str(usconsumption)
head(usconsumption)
fit.ex3 <- tslm(consumption ~ income, data=usconsumption)
plot(usconsumption, ylab="% change in consumption and income",
     plot.type="single", col=1:2, xlab="Year")
legend("topright", legend=c("Consumption","Income"),
       lty=1, col=c(1,2), cex=.9)
plot(consumption ~ income, data=usconsumption, 
     ylab="% change in consumption", xlab="% change in income")
abline(fit.ex3)
summary(fit.ex3)



fcast <- forecast(fit.ex3, newdata=data.frame(income=c(-1,1)))
fcast
plot(fcast, ylab="% change in consumption", xlab="% change in income")

?austa
austa
par(mfrow=c(1,1)); par(mar=c(3,2,2,2))
fit.ex4 <- tslm(austa ~ trend)
fit.ex4

(f <- forecast(fit.ex4, h=5,level=c(80,95)))

plot(f, ylab="International tourist arrivals to Australia (millions)",
     xlab="t")
lines(fitted(fit.ex4),col="blue")
summary(fit.ex4)

graphics.off()
par(mar=c(3,5,2,1))
par(mfrow=c(2,2))
res3 <- ts(resid(fit.ex3),s=1970.25,f=4)
res3
plot.ts(res3,ylab="res (Consumption)")
abline(0,0)
Acf(res3)
res4 <- resid(fit.ex4)
res4
plot(res4,ylab="res (Tourism)")
abline(0,0)
Acf(res4)

par(mfrow=c(2,1))

tslm(AirPassengers ~ guinearice)
plot(AirPassengers)
plot(guinearice)
