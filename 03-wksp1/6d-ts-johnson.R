#Johnson Case - TS
#time series analysis
#plot, decompose, forecast, 
JohnsonJohnson
?JohnsonJohnson

monthplot(JohnsonJohnson)
quarters.Date(Sys.Date())

stl_jj = stl(JohnsonJohnson, s.window = 'periodic')
plot(stl_jj)
plot(JohnsonJohnson)
monthplot(stl_jj, choice='seasonal')
monthplot(stl_jj, choice='trend')
monthplot(stl_jj, choice='remainder')

library(forecast)
ets_jj = ets(JohnsonJohnson, model = "MAM")
forecast(ets_jj,h=3)
plot(forecast(ets_jj,h=3))


#---
require(stats); require(graphics)
JJ <- log10(JohnsonJohnson)
plot(JohnsonJohnson)
plot(JJ)

## This example gives a possible-non-convergence warning on some
## platforms, but does seem to converge on x86 Linux and Windows.
(fit <- StructTS(JJ, type = "BSM"))
tsdiag(fit)
sm <- tsSmooth(fit)
plot(cbind(JJ, sm[, 1], sm[, 3]-0.5), plot.type = "single",
     col = c("black", "green", "blue"))
abline(h = -0.5, col = "grey60")

monthplot(fit)