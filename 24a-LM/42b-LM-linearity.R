#Nonlinearity

# Evaluate Nonlinearity
plot(fit,1)

# component + residual plot 
crPlots(fit)
# Ceres plots 
ceresPlots(fit)

#The regression model is linear in parameters
#An example of model equation that is linear in parameters 
#Y=a+(β1*X1)+(β2*X2^2)

#Assumption 2----
#The mean of residuals is zero
#How to check?
#Check the mean of the residuals. If it zero (or very close), then this assumption is held true for that model. This is default unless you explicitly make amends, such as setting the intercept term to zero.

fit2 <- lm(dist ~ speed, data=cars)
mean(fit2$residuals)
#Since the mean of residuals is approximately zero, this assumption holds true for this model.
