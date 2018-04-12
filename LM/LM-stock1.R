# Regression on Stock Prices
#Stock Prices

Yprice = c(80.13, 79.57, 79.93, 81.69, 80.82, 81.02)
Xprice = c(72.86, 72.88, 71.72, 71.54, 71, 71.78)
data = data.frame(Yprice, Xprice)
plot(y=data$Yprice, x=data$Xprice)
LinearR.lm = lm(Yprice ~ Xprice, data = data)
coef(LinearR.lm)
LinearR.lm
summary(LinearR.lm)$r.squared
