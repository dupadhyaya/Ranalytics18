# Regression - Car Data Set
# http://r-statistics.co/Linear-Regression.html
# 
par(mfrow=c(1, 1))
?cars
plot(x=cars$speed, y=cars$dist)
scatter.smooth(x=cars$speed, y=cars$dist, main="Dist ~ Speed")  # scatterplot

par(mfrow=c(1, 2))  # divide graph area in 2 columns
boxplot.stats(cars$dist)
boxplot(cars$speed, main="Speed", sub=paste("Outlier rows: ", 
        boxplot.stats(cars$speed)$out))  # box plot for 'speed'
boxplot(cars$dist, main="Distance", sub=paste("Outlier rows: ", 
            boxplot.stats(cars$dist)$out))  # box plot for 'distance'


# Check for normality of x 
library(e1071)
par(mfrow=c(1, 2))  # divide graph area in 2 columns
plot(density(cars$speed), main="Density Plot: Speed", 
     ylab="Frequency", sub=paste("Skewness:", round(e1071::skewness(cars$speed), 2))) 
# density plot for 'speed'
polygon(density(cars$speed), col="red")
plot(density(cars$dist), main="Density Plot: Distance", 
     ylab="Frequency", sub=paste("Skewness:", round(e1071::skewness(cars$dist), 2))) 
# density plot for 'dist'
polygon(density(cars$dist), col="red")


# correlation
cor(cars$speed, cars$dist)  # calculate correlation between speed and distance


#LM
linearMod <- lm(dist ~ speed, data=cars)  # build linear regression model on full data
print(linearMod)
#dist = Intercept + (β ∗ speed) #=> dist = −17.579 + 3.932∗speed
summary(linearMod)

#AIC and BIC :For model comparison, the model with the lowest AIC and BIC score is preferred.
AIC(linearMod)  # AIC => 419.1569
BIC(linearMod)  # BIC => 424.8929
?AIC



# Predicting LM
# Create Training and Test data -
set.seed(100)  # setting seed to reproduce results of random sampling
trainingRowIndex <- sample(1:nrow(cars), 0.8*nrow(cars))  # row indices for training data
trainingData <- cars[trainingRowIndex, ]  # model training data
testData  <- cars[-trainingRowIndex, ]   # test data

# Build the model on training data -
lmMod <- lm(dist ~ speed, data=trainingData)  # build the model
distPred <- predict(lmMod, testData)  # predict distance

summary (lmMod)  # model summary

AIC (lmMod)

actuals_preds <- data.frame(cbind(actuals=testData$dist, predicteds=distPred))  # make actuals_predicteds dataframe.
(correlation_accuracy <- cor(actuals_preds))  # 82.7%
head(actuals_preds)

actuals_preds
apply(actuals_preds, 1, min)
apply(actuals_preds, 1, max)
(min_max_accuracy <- mean(apply(actuals_preds, 1, min) / apply(actuals_preds, 1, max))  )
# => (38%) 58.42%, min_max accuracy
(mape <- mean(abs((actuals_preds$predicteds - actuals_preds$actuals))/actuals_preds$actuals)  )
# => 69% (48.38%), mean absolute percentage deviation
# 

#K Fold
library(DAAG)
cvResults <- suppressWarnings(CVlm(data=cars, form.lm=dist ~ speed, m=5, dots=FALSE, seed=29, legend.pos="topleft",  printit=FALSE, main="Small symbols are predicted values while bigger ones are actuals."));  # performs the CV
attr(cvResults, 'ms')  # => 251.2783 mean squared error


# Assumptions
mod <- lm(dist ~ speed, data=cars)
mean(mod$residuals)

par(mfrow=c(2,2))  # set 2 rows and 2 column plot layout
mod_1 <- lm(mpg ~ disp, data=mtcars)  # linear model
plot(mod_1)

mod <- lm(dist ~ speed, data=cars[1:20, ])  #  linear model
plot(mod)

par(mfrow=c(1,1))
#Auto Correlation
# Method 1: Visualise with acf plot
library(ggplot2)
data(economics)
lmMod <- lm(pce ~ pop, data=economics)
acf(lmMod$residuals)  # highly autocorrelated from the picture.


#Assumption 3
#Homoscedasticity of residuals or equal variance
par(mfrow=c(2,2))  # set 2 rows and 2 column plot layout
mod_1 <- lm(mpg ~ disp, data=mtcars)  # linear model
plot(mod_1)



#Assumption 4 :No autocorrelation of residuals
par(mfrow=c(1,1))
# Method 1: Visualise with acf plot
library(ggplot2)
data(economics)
lmMod <- lm(pce ~ pop, data=economics)
acf(lmMod$residuals)  # highly autocorrelated from the picture.

# Method 2: Runs test to test for randomness
lawstat::runs.test(lmMod$residuals)
#=>   Runs Test - Two sided
#=> data:  lmMod$residuals
#=> Standardized Runs Statistic = -23.812, p-value < 2.2e-16

# Method 3: Durbin-Watson test
lmtest::dwtest(lmMod)
#=>   Durbin-Watson test

#=> data:  lmMod
#=> DW = 0.0021559, p-value < 2.2e-16
#=> alternative hypothesis: true autocorrelation is greater than 0
#
# Rectify
library(DataCombine)
econ_data <- data.frame(economics, resid_mod1=lmMod$residuals)
econ_data_1 <- slide(econ_data, Var="resid_mod1", NewVar = "lag1", slideBy = -1)
econ_data_2 <- na.omit(econ_data_1)
lmMod2 <- lm(pce ~ pop + lag1, data=econ_data_2)

#Check 1

acf(lmMod2$residuals)

#Check 2
library(lawstat)
lawstat::runs.test(lmMod2$residuals)  # runs test

#Check 3

lmtest::dwtest(lmMod2)


#Assumption 5
mod.lm <- lm(dist ~ speed, data=cars)
cor.test(cars$speed, mod.lm$residuals)  # do correlation test 

#Assumption 6
dim(cars)

#Assumption 7 
var(cars$speed)


#Assumptions 9
library(car)
mod2 <- lm(mpg ~ ., data=mtcars)
vif(mod2)

library(corrplot)
corrplot(cor(mtcars[, -1]))

mod <- lm(mpg ~ cyl + gear, data=mtcars)
vif(mod)


#Assumption 10 
par(mfrow=c(2,2))
mod <- lm(dist ~ speed, data=cars)
plot(mod)


#Check Auto
par(mfrow=c(2,2))  # draw 4 plots in same window
mod <- lm(dist ~ speed, data=cars)
library(gvlma)
gvlma::gvlma(mod)

summary(gvlma::gvlma(mod))

plot(mod)

mod <- lm(dist ~ speed, data=cars[-c(23, 35, 49), ])
gvlma::gvlma(mod)
plot(mod)

influence.measures(mod)
