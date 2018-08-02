# Cross Validation using Auto dataset

split(mtcars[,1:4] , f = rep_len(1:4, nrow(mtcars) ) )

library(ISLR)
library(boot)
ISLR::Auto
attach(Auto)
(model1 = glm(mpg ~ horsepower, data =Auto))
(mse_loocv = cv.glm(Auto, model1))

(model2 = lm(mpg ~ horsepower, data=Auto))
(mse_fold = cv.glm(Auto, model1, K=3))

library(DAAG)
mydata=women
(fit = lm(weight ~ height, data=mydata))
plot( mydata$height , mydata$weight)
DAAG::CVlm(data=mydata, form.lm=formula(
       weight ~ height), m=3, plotit="Observed" )


#Eg2
library(DAAG)
mydata=Auto
(fit = lm(mpg ~ horsepower, data=mydata))
plot( y=mydata$horsepower , mydata$mpg)
nrow(Auto)
DAAG::CVlm(data=mydata, form.lm=fit, m=3, plotit="Observed" )

