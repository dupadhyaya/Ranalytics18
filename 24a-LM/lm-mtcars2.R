# Multiple Regression in R
mtcars
(model1 = lm(mpg ~ disp + cyl + hp
            + drat + wt + qsec + carb, data=mtcars))

summary(model1)
anova(model1)
vcov(model1)

layout(matrix(c(1,2,3,4),2,2))
plot(model1)

(model1 = lm(mpg ~ disp + cyl + hp
             + drat + wt + qsec + carb, data=mtcars))
summary(model1)
(model2 = lm(mpg ~ disp + cyl + wt , data=mtcars))
summary(model2)

anova(model1, model2)
anova(model2, model1)

(model3 = lm(mpg ~ cyl + wt , data=mtcars))
summary(model3)

anova(model3, model2)

plot(model3)

anova(model3, model1)
anova(model1, model3)


#Interaction Effects
(model4 = lm(mpg ~ cyl + wt + cyl*wt, data=mtcars))
summary(model4)

anova(model3, model4)

#AIC
library(MASS)
(model1a = lm(mpg ~ disp + cyl + hp
             + drat + wt + qsec + carb, data=mtcars))
step = stepAIC(model1a, direction='both')

step$anova


#Polynomial Regression
(model5 = lm(mpg ~ cyl + wt + I(wt^2), data=mtcars))
summary(model5)



#LOOCV
library(ISLR)
library(boot)
str(Auto)
(model1 = glm(mpg ~ horsepower, data = Auto))
mse_loocv = cv.glm(Auto , model1)
mse_loocv

par(mfrow=c(1,1))
#Kfold
library(DAAG)
(model2 = lm(mpg ~ horsepower, data=Auto))
(mse_fold = cv.lm(Auto, model2, m=3))
summary(mse_fold)
n=nrow(Auto)
sumcv = sum(mse_fold$cvpred)
(msecalc = sqrt(n/sumcv))
attributes(mse_fold)$ms
