# Simple Linear Regression : Built in Data Set Women
# Check for assumptions of Regression in the data Set

str(women)
fit = lm(weight ~ height, data=women)

#Initial Checks
cor(women$height, women$weight)
#there is Strong and Positive Relationship between height and weight
plot(women$height, women$weight)
plot(fit)

#Assumptions Regression
#Linearity----
#Linearity of the data. The relationship between the predictor (x) and the outcome (y) is assumed to be linear.
# component + residual plot 
plot(women$height, fitted(fit))
plot(residuals(fit) ~ fitted(fit))
plot(fit, which=1)
#residuals should be randomly distributed and not increase or decrease 


#Normality----
#Normality of residuals. The residual errors are assumed to be normally distributed.
plot(density(resid(fit)))
plot(fit, which=2)

#Homoscedasticity----
#Homogeneity of residuals variance. The residuals are assumed to have a constant variance (homoscedasticity - opposite of heteroscedasticity)
plot(fit, which=3)
#No funnel shape, random distribution of residuals
plot(fit, which=4)

#Auto-Correlation----
#Independence of residuals error terms. (Not dependent on previous values)
durbinWatsonTest(fit)
#pvalue < 0; Ho that there is no correlation (r2=0) is accepted

#Outliers
plot(fit, which=4)
#potential outliers are highlighted 1, 14, 15 row
women[c(1,14,15),]

#Lets remove these values and then find R2
fit2 = lm(weight ~ height, data=women[-c(1,14,15),])
summary(fit2)
(summary(fit))$r.squared
(summary(fit2))$r.squared
AIC(fit, fit2) #lower value of AIC is better


#Potential Problems
#Non-linearity of the outcome - predictor relationships
#Heteroscedasticity: Non-constant variance of error terms.
#Presence of influential values in the data that can be:
#Outliers: extreme values in the outcome (y) variable
#High-leverage points: extreme values in the predictors (x) variable

#All these assumptions and potential problems can be checked by producing some diagnostic plots visualizing the residual errors.


