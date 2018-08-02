# Housing Rent on factors

house = read.table("http://www.rossmanchance.com/iscam2/data/housing.txt", header = T, sep = "\t")
house

attach(house)
names(house)
fit = lm(price ~ sqft + City + bedrooms + baths)
summary(fit)

panel.cor <- function(x, y, digits = 2, prefix = "", cex.cor, ...) {
  usr <- par("usr")
  on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  r <- cor(x, y)
  txt <- format(c(r, 0.123456789), digits = digits)[1]
  txt <- paste0(prefix, txt)
  text(0.5, 0.5, txt)
}
pairs(cbind(price, sqft, bedrooms, baths), lower.panel = panel.cor, pch = 18)

summary(lm(price ~ sqft))

summary(lm(price ~ bedrooms))

par(mfrow = c(1, 2))
plot(lm(price ~ sqft)$fitted, lm(price ~ sqft)$resid, xlab = "fitted w sqft", 
     ylab = "resid", pch = 18)
abline(h = 0)
plot(lm(price ~ bedrooms)$fitted, lm(price ~ bedrooms)$resid, xlab = "fitted w bed", 
     ylab = "resid", pch = 18)
abline(h = 0)

par(mfrow = c(1, 2))
plot(lm(log(price) ~ sqft)$fitted, lm(log(price) ~ sqft)$resid , xlab = "fitted w sqft", 
     ylab = "resid for ln", pch = 18)
abline(h = 0)
plot(lm(log(price) ~ bedrooms)$fitted, lm(log(price) ~ bedrooms)$resid, xlab = "fitted w bed", 
     ylab = "resid for ln", pch = 18)
abline(h = 0)
summary(lm(log(price) ~ sqft + bedrooms))

summary(lm(log(price) ~ sqft))


predict(lm(log(price) ~ sqft), newdata = data.frame(sqft = 2000), interval = "confidence")
predict(lm(log(price) ~ sqft), newdata = data.frame(sqft = 2000), interval = "prediction")

par(mfrow=c(1,1))
plot(sqft, log(price), pch = 18)
sqftlm = lm(log(price) ~ sqft)
abline(sqftlm, col = "red")
newX = seq(min(sqft), max(sqft), 1)
prd.CI = predict(sqftlm, newdata = data.frame(sqft = newX), interval = "confidence", 
                 level = 0.95)
lines(newX, prd.CI[, 2], col = "blue", lty = 2)
lines(newX, prd.CI[, 3], col = "blue", lty = 2)
prd.PI = predict(sqftlm, newdata = data.frame(sqft = newX), interval = "prediction", 
                 level = 0.95)
lines(newX, prd.PI[, 2], col = "green", lty = 3)
lines(newX, prd.PI[, 3], col = "green", lty = 3)

