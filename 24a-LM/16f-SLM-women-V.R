#Simple Linear Regression : Validation of the Model - women
#Is it good Model for Prediction, Are errors large, 
#Are Coefficient of variables significant

str(women)
fit1 = lm(weight ~ height, data=women)
summary(fit1)

#R2----
#Coefficient of determination : between 0 and 1; higher the better
(summary(fit1))$r.squared  #0.991
(summary(fit1))$adj.r.squared  #0.9903
#99% of variation in weight is explained by Height
#Good Linear Model for Prediction

#HypoTests----
#Hypothesis Tests for Linear coefficient b1
#if b1=0, no relationship between y and x's
#coefficients
coef(fit1)
#p values for b1 are significant as it's p value < 0.05 and coef > 0
summary(fit1)

#FTest----
#Overall Model Test
#FStats : p value
(summary(fit))$fstatistic 
summary(fit)
#p-value of FStats is 1.9e-14 << 0; Significant Model
# Theres is atleast one IV which has significant relationship with DV

#SSE
#std sum of sq errors should be min (0)
residuals(fit)
sum(residuals(fit))
