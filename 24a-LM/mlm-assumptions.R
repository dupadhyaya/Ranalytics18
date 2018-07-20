# Model Assumptions in Linear Regression
# Diagnostics (https://www.statmethods.net/stats/rdiagnostics.html)
#(http://www.sthda.com/english/articles/39-regression-model-diagnostics/161-linear-regression-assumptions-and-diagnostics-in-r-essentials/)


#The regression has five key assumptions:
#1.Linear relationship.
#Multivariate normality.
#No or little multicollinearity.
#No auto-correlation.
#Homoscedasticity.

btech -->  java , cpp, maths
sales figures over 1 year


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
# Evaluate homoscedasticity. Should have constant variance
# non-constant error variance test
ncvTest(fit)
# plot studentized residuals vs. fitted values 
spreadLevelPlot(fit)

#Multi-collinearity ----
# Evaluate Collinearity
vif(fit) # variance inflation factors 
sqrt(vif(fit)) > 2 # problem?

summary(fit)
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

#Plot command
plot(fit)

#(http://r-statistics.co/Assumptions-of-Linear-Regression.html)
#Simple Linear

#Multiple Linear

#http://r-statistics.co/Assumptions-of-Linear-Regression.html
