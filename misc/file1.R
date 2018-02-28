x <- rnorm(15)
y <- x + rnorm(15)
predict(lm(y ~ x))
new <- data.frame(x = seq(-3, 3, 0.5))
predict(lm(y ~ x), new, se.fit = TRUE)


attach(faithful)     # attach the data frame 
?faithful
plot(eruptions, waiting)
plot(faithful)
eruption.lm = lm(eruptions ~ waiting)
#Then we create a new data frame that set the waiting time value.

newdata = data.frame(waiting=80)
#We now apply the predict function and set the predictor variable in the newdata argument. We also set the interval type as "predict", and use the default 0.95 confidence level.

predict(eruption.lm, newdata, interval="predict") 
?lm
m2 = 


#fit    lwr    upr 
#1 4.1762 3.1961 5.1564 
detach(faithful)     # clean up
range(waiting)
attach(faithful)
plot(eruptions, waiting, xlim=c(0,max(eruptions)), ylim=c(0,max(waiting)))
eruptions.lm= lm(waiting ~ eruptions)
abline(eruptions.lm)
predict(eruption.lm, new = data.frame(eruptions=2))
newdata = data.frame

m2 = lm(eruptions ~ waiting)
newdata = data.frame(waiting=80)
plot(waiting, eruptions)
abline(v=80)
abline(m2)
predict(m2, newdata, interval='predict')
