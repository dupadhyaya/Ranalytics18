# Regression Analysis
# Simple Linear with 1 IV and 1 DV

data(women)
women
names(women)
str(women)

cov(women$height, women$weight)
#69 : which show positive relationship between height and weight

cor(women$height, women$weight)
#0.995 : which shows Strong and Positive relationship betw height & weight
0.995^2 # also equal R^2 value in this case (Simple Linear Regression)

plot(x=women$height, y=women$weight, type='b')
abline(lm(weight ~ height, data=women), col='red')
names(women)  #x- IV, y -DV
fit1 = lm(weight ~ height, data=women)  # creating a model
summary(fit1)  #summary of the Model

#Ho: (F Test) : No relationship between Y and any X
#Ha:  There is relationship between Y and at least one X
# p < 0.05 Reject Ho in favour of Ha

attributes(fit1)  #output of model

#coefficients
coef(fit1)
#p values for b0 & b1 are significant as it is < 0.05
#pvalue1 = 1.71e-09 < 0.05
#pvalue2 = 1.09e-14 < 0.05

coef(fit1)
#Y = -87 + 3.4 * X  # no extrapolations
(Y = -87 + 3.4 * 20)  # weight cannot be negative
range(women$height)
(Y = -87 + 3.4 * 58)
(Y = -87 + 3.4 * 61.5)
(Y = -87 + 3.4 * 72)
range(women$height)
women


#R^2
(summary(fit1))$r.squared  #0.991
(summary(fit1))$adj.r.squared  #0.9903
#99% of variation in weight is explained by Height
#Good Linear Model for Prediction


#FStats : p value
(summary(fit1))$fstatistic 
#pvalue : 1.09e-14  < 0.05 : Model exists
#There is at least 1 IV which explains variation in Y (DV)


#Prediction : for height = 65, 66

(new1 = data.frame(height=c(65,66,66.5)))
new1
(p1=predict(fit1, newdata = new1))
cbind(new1, p1)
#136.7333 140.1833

(new2 = data.frame(height=c(60,69)))
(p2=predict(fit1, newdata = new2))
cbind(new2, p2)

?predict
predict(fit1, newdata = new1, interval='confidence')
predict(fit1, newdata = new1, interval='prediction')

women
women$weight
fitted(fit1) # predicted values of all original Xs
predict(fit1, newdata = data.frame(women$height)) # same as above for single X

new3 = data.frame(women$height)  # DF using height of original data
cbind(women, fitted(fit1), residuals(fit1))  # compare women, predicted, errors
residuals(fit1)  # diff between actual and predicted values of weight
summary(fit1)
summary(residuals(fit1))

plot(fit1)
cor(fitted(fit1), women$weight)
summary(fit1)
