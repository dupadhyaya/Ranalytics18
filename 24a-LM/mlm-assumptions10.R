# Model Assumptions in Linear Regression
# Diagnostics (https://www.statmethods.net/stats/rdiagnostics.html)

# Assume that we are fitting a multiple linear regression
# on the MTCARS data
library(car)
fit <- lm(mpg~disp+hp+wt+drat, data=mtcars)
# Assessing Outliers
outlierTest(fit) # Bonferonni p-value for most extreme obs
qqPlot(fit, main="QQ Plot") #qq plot for studentized resid 
leveragePlots(fit) # leverage plots
# Influential Observations
# added variable plots 
av.Plots(fit)
# Cook's D plot
# identify D values > 4/(n-k-1) 
cutoff <- 4/((nrow(mtcars)-length(fit$coefficients)-2)) 
plot(fit, which=4, cook.levels=cutoff)
# Influence Plot 
influencePlot(fit,	id.method="identify", main="Influence Plot", sub="Circle size is proportial to Cook's Distance" )


# Normality of Residuals
# qq plot for studentized resid
qqPlot(fit, main="QQ Plot")
# distribution of studentized residuals
library(MASS)
sresid <- studres(fit) 
hist(sresid, freq=FALSE, 
     main="Distribution of Studentized Residuals")
xfit<-seq(min(sresid),max(sresid),length=40) 
yfit<-dnorm(xfit) 
lines(xfit, yfit)

#Non-constant Error Variance ---
# Evaluate homoscedasticity. Shouldhave constant variance
# non-constant error variance test
ncvTest(fit)
# plot studentized residuals vs. fitted values 
spreadLevelPlot(fit)

#Multi-collinearity ----
# Evaluate Collinearity
vif(fit) # variance inflation factors 
sqrt(vif(fit)) > 2 # problem?


#Nonlinearity----
# Evaluate Nonlinearity
# component + residual plot 
crPlots(fit)
# Ceres plots 
ceresPlots(fit)

#Non-independence of Errors----
# Test for Autocorrelated Errors
durbinWatsonTest(fit)


#Additional Diagnostic Help----
#The gvlma( ) function in the gvlma package, performs a global validation of linear model assumptions as well separate evaluations of skewness, kurtosis, and heteroscedasticity.

# Global test of model assumptions
library(gvlma)
gvmodel <- gvlma(fit) 
summary(gvmodel)


#(http://r-statistics.co/Assumptions-of-Linear-Regression.html)
#Simple Linear





#Multiple Linear



#http://r-statistics.co/Assumptions-of-Linear-Regression.html

#Assumption 1----
#The regression model is linear in parameters
#An example of model equation that is linear in parameters 
#Y=a+(β1*X1)+(β2*X2^2)
#Though, the X2 is raised to power 2, the equation is still linear in beta parameters. So the assumption is satisfied in this case.

#Assumption 2----
#The mean of residuals is zero
#How to check?
#Check the mean of the residuals. If it zero (or very close), then this assumption is held true for that model. This is default unless you explicitly make amends, such as setting the intercept term to zero.

mod <- lm(dist ~ speed, data=cars)
mean(mod$residuals)
#=> 2.442491e-17
#Since the mean of residuals is approximately zero, this assumption holds true for this model.

#Assumption 3----
Homoscedasticity of residuals or equal variance
How to check?
  Once the regression model is built, set par(mfrow=c(2, 2)), then, plot the model using plot(lm.mod). This produces four plots. The top-left and bottom-left plots shows how the residuals vary as the fitted values increase.

par(mfrow=c(2,2))  # set 2 rows and 2 column plot layout
mod_1 <- lm(mpg ~ disp, data=mtcars)  # linear model
plot(mod_1)


From the first plot (top-left), as the fitted values along x increase, the residuals decrease and then increase. This pattern is indicated by the red line, which should be approximately flat if the disturbances are homoscedastic. The plot on the bottom left also checks this, and is more convenient as the disturbance term in Y axis is standardized.

In this case, there is a definite pattern noticed. So, there is heteroscedasticity. Lets check this on a different model.

mod <- lm(dist ~ speed, data=cars[1:20, ])  #  linear model
plot(mod)


Assumption 4
No autocorrelation of residuals
This is applicable especially for time series data. Autocorrelation is the correlation of a time Series with lags of itself. When the residuals are autocorrelated, it means that the current value is dependent of the previous (historic) values and that there is a definite unexplained pattern in the Y variable that shows up in the disturbances.

How to check for autocorrelation?
  Below, are 3 ways you could check for autocorrelation of residuals.

Using acf plot
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

With a p-value < 2.2e-16, we reject the null hypothesis that it is random. This means there is a definite pattern in the residuals.

Using Durbin-Watson test.
# Method 3: Durbin-Watson test
lmtest::dwtest(lmMod)
#=>   Durbin-Watson test

#=> data:  lmMod
#=> DW = 0.0021559, p-value < 2.2e-16
#=> alternative hypothesis: true autocorrelation is greater than 0


o, dwtest also confirms our finding.

How to rectify?
  Add lag1 of residual as an X variable to the original model. This can be conveniently done using the slide function in DataCombine package.

library(DataCombine)
econ_data <- data.frame(economics, resid_mod1=lmMod$residuals)
econ_data_1 <- slide(econ_data, Var="resid_mod1", NewVar = "lag1", slideBy = -1)
econ_data_2 <- na.omit(econ_data_1)
lmMod2 <- lm(pce ~ pop + lag1, data=econ_data_2)