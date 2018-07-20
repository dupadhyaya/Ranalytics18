#LM - Sample Cases

#Case1----
#Different Data
x <- c(173, 169, 176, 166, 161, 164, 160, 158, 180, 187)
y <- c(80, 68, 72, 75, 70, 65, 62, 60, 85, 92)
mod2 <- lm(y ~ x)
plot(x, y, xlim=c(min(x)-5, max(x)+5), ylim=c(min(y)-10, max(y)+10))
abline(mod2, lwd=2)
res <- signif(residuals(mod2), 5)
pre <- predict(mod2)
segments(x, y, x, pre, col="red")
library(calibrate)
textxy(x, y, res, cx=0.7)