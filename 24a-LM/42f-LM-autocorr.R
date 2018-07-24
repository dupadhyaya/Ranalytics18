#Non-independence of Errors

# Test for Autocorrelated Errors
durbinWatsonTest(fit)


#No autocorrelation of residuals
#This is applicable especially for time series data. Autocorrelation is the correlation of a time Series with lags of itself. When the residuals are autocorrelated, it means that the current value is dependent of the previous (historic) values and that there is a definite unexplained pattern in the Y variable that shows up in the disturbances.

par(mfrow=c(1,1))
#M1:Using acf plot
# Method 1: Visualise with acf plot
library(ggplot2)
data(economics)
fit1 <- lm(pce ~ pop, data=economics)
acf(fit1$residuals)  # highly autocorrelated from the picture.

fit2 = lm(weight ~ height, data = women)
acf(fit2$residuals)  # no autocorrelation


# Method 2: Runs test to test for randomness
lawstat::runs.test(fit1$residuals)
#=>   Runs Test - Two sided  # Ho: Random Ha: Relation
#With a p-value < 0.05, we reject the null hypothesis that it is random. This means there is a definite pattern in the residuals.

# Method 3: Durbin-Watson test
lmtest::dwtest(fit1)
#=>   Durbin-Watson test
#pvalue < 0.05; Auto Corr > 0 ie there is auto corr

lmtest::dwtest(fit2)
#pvalue < 0.05 but the dat is cross sectional

#How to rectify?----
# Add lag1 of residual as an X variable to the original model. This can be conveniently done using the slide function in DataCombine package.

library(DataCombine)
econ_data <- data.frame(economics, resid_mod1=fit1$residuals)
econ_data_1 <- slide(econ_data, Var="resid_mod1", NewVar = "lag1", slideBy = -1)
econ_data_2 <- na.omit(econ_data_1)
fit1a <- lm(pce ~ pop + lag1, data=econ_data_2)

lmtest::dwtest(fit1a)
#now p-value > 0.05 ; hence Ho accept, Auto corr=0
