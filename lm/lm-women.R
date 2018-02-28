#Linear Modeling
#Built in Data Set : Women
#Linear Regression

data(women)  # load women data set
women
?women  # weight depends on height
#height	 numeric	 Height (in)
#weight	 numeric	 Weight (lbs)

# Linear Regression y = mx + c 

attach(women)
cov(height,weight)
cor(women$height,women$weight)
(weight.lm = lm(weight ~ height, data=women))

summary(weight.lm)
plot(height, weight )
abline(weight.lm, col='red')
abline(v=c(62,64,66))
abline(h=140)
fitted(weight.lm)
lines(height, weight, col='blue')
lines(height, fitted(weight.lm), col='green')
cbind(height,weight, fitted(weight.lm))
cbind(height,weight, fitted(weight.lm), weight-fitted(weight.lm), residuals(weight.lm))

summary(residuals(weight.lm))
new.data1 = data.frame(height= 70)
new.data2 = data.frame(height=c(70,75,80))

predict(weight.lm, newdata = new.data1, interval='confidence')
predict(weight.lm, newdata = new.data2, interval='prediction')

#Since Line is not passing through all points, try polynomial term


# Polynomial Regression X2
weight.lm2 = lm(weight ~ height + I(height^2), data=women)
weight.lm2
summary(weight.lm2)
plot(women$height, women$weight, xlab='Ht in inch', ylab='Weight in lbs')
lines(women$height, fitted(weight.lm2), col='purple', lwd=2)
text(mean(women$height)+5, mean(women$weight), 'Polynomial', col='purple', cex=.8)
lines(women$height, fitted(weight.lm2), col='red', lwd=3)
text(mean(women$height)-5, mean(women$weight), 'Linear', col='red', cex=.6)

# higher polynomial
weight.lmn = lm(weight ~ height + I(height^2) + I(height^3), data=women)
summary(weight.lmn) # max residual errors reduced

# scatter plot for above data
library(car)
car::scatterplot(weight ~ height, data=women, spread=F, smoother.args= list(lty=2), pch=19, main='Women age 30-39', xlab='Ht in inch', ylab='Wt in lbs' )



#Influence Plot
influencePlot(lm(weight ~ height, data=women), id.method='identify', main='Influence PLot' , sub='Circle size is proportional to Cooks Distance' )

#Plot
fit= lm(weight ~ height, data=women)
plot(x=fitted(fit), y=residuals(fit), main=' Residuals vs Fitted Values')
lines(loess.smooth(x=fitted(fit), y=residuals(fit)))

scatter.smooth(x=fitted(fit), y=residuals(fit), col='red', lpars= list(col='blue', lwd=3,lty=3))
points(x=fitted(fit), y=residuals(fit), col='green', pch=20)
labeltext = paste(rownames(women),paste(paste(women$height, women$weight,sep=','), round(fitted(fit),1),sep='-'), sep='=') 

#Calibrate
data("women")
x = women$height
y = women$weight
mod1 <- lm(y ~ x)
plot(mod1)
plot(x, y, xlim=c(min(x)-5, max(x)+5), ylim=c(min(y)-10, max(y)+10))
abline(mod1, lwd=2)

res <- signif(residuals(mod1), 5)
pre <- predict(mod1) #
segments(x, y, x, pre, col="red")
library(calibrate)
textxy(x, y, res, cx=0.7)
