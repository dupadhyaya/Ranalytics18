# NLM using mtcars
# https://stats.stackexchange.com/questions/142443/simple-non-linear-regression-problem
#Load data----

data(mtcars)

# Scatterplot with log-transformation
plot(mpg ~ disp, data=mtcars)
plot(log(mpg)~disp, data = mtcars, las = 1, pch = 16, xlab = "Displacement", ylab = "Log(Miles/Gallon)")

# Linear regression with log-transformation

log.mod <- lm(log(mpg)~disp, data = mtcars)

# Prediction intervals

newframe <- data.frame(disp = seq(min(mtcars$disp), max(mtcars$disp), length = 1000))

pred <- predict(log.mod, newdata = newframe, interval = "prediction")
pred
# Plot prediction intervals on log scale

plot(log(mpg)~disp
     , data = mtcars
     , ylim = c(2, 4)
     , las = 1
     , pch = 16
     , main = "Log scale"
     , xlab = "Displacement", ylab = "Log(Miles/Gallon)")

lines(pred[,"fit"]~newframe$disp, col = "steelblue", lwd = 2)
lines(pred[,"lwr"]~newframe$disp, lty = 2)
lines(pred[,"upr"]~newframe$disp, lty = 2)

# Plot prediction intervals on original scale

plot(mpg~disp
     , data = mtcars
     , ylim = c(8, 38)
     , las = 1
     , pch = 16
     , main = "Original scale"
     , xlab = "Displacement", ylab = "Miles/Gallon")

lines(exp(pred[,"fit"])~newframe$disp, col = "steelblue", lwd = 2)
lines(exp(pred[,"lwr"])~newframe$disp, lty = 2)
lines(exp(pred[,"upr"])~newframe$disp, lty = 2)

# Quadratic regression on original scale

quad.lm <- lm(mpg~poly(disp, 2), data = mtcars)

# Prediction intervals

newframe <- data.frame(disp = seq(min(mtcars$disp), max(mtcars$disp), length = 1000))

pred <- predict(quad.lm, newdata = newframe, interval = "prediction")

# Plot prediction intervals on log scale

plot(mpg~disp
     , data = mtcars
     , ylim = c(7, 36)
     , las = 1
     , pch = 16
     , main = "Original scale"
     , xlab = "Displacement", ylab = "Miles/Gallon")

lines(pred[,"fit"]~newframe$disp, col = "steelblue", lwd = 2)
lines(pred[,"lwr"]~newframe$disp, lty = 2)
lines(pred[,"upr"]~newframe$disp, lty = 2)