# Model Assumptions in Linear Regression
# Diagnostics (https://www.statmethods.net/stats/rdiagnostics.html)

# Assume that we are fitting a multiple linear regression
# on the MTCARS data
library(car)
fit <- lm(mpg~disp+hp+wt+drat, data=mtcars)

# Assessing Outliers----
outlierTest(fit) # Bonferonni p-value for most extreme obs
qqPlot(fit, main="QQ Plot") #qq plot for studentized resid 
leveragePlots(fit) # leverage plots


# Influential Observations----
# added variable plots 
car::avPlots(fit)

# Cook's D plot
# identify D values > 4/(n-k-1) 
cutoff <- 4/((nrow(mtcars)-length(fit$coefficients)-2)) 
plot(fit, which=4, cook.levels=cutoff)

# Influence Plot 
influencePlot(fit,	id.method="identify", main="Influence Plot", sub="Circle size is proportial to Cook's Distance" )


# Normality of Residuals----
# qq plot for studentized resid - 
qqPlot(fit, main="QQ Plot")
# distribution of studentized residuals - should be normal
library(MASS)
residuals(fit) # standardise them
sresid <- studres(fit) 
hist(sresid, freq=FALSE, main="Distribution of Studentized Residuals")
plot(density(sresid))

xfit<-seq(min(sresid),max(sresid),length=40) 
yfit<-dnorm(xfit) 
lines(xfit, yfit)

#Non-constant Error Variance ---
# Evaluate homoscedasticity. Shouldhave constant variance
# non-constant error variance test
car::ncvTest(fit)
# plot studentized residuals vs. fitted values 
spreadLevelPlot(fit)
#spread is scattered

#Multi-collinearity ----
# Evaluate Collinearity
vif(fit) # variance inflation factors 
sqrt(vif(fit)) > 2 # if > 2, there is aproblem?


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








