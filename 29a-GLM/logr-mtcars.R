# Logistic Regression

# Contingency Table for Tx of Cars
data(mtcars)
?mtcars
(t= table(mtcars$am))
(amt = addmargins(t))
(ppt = prop.table(t))
p1 = 19/32   #automatic Probability
# Prob that am=Manual
(p0a = 1 - 19/32 )
# Odds Ratio
(p1 = 19/13 )
(p2 = 13/19 )

#glm
attach(mtcars)
(base = glm(am ~ 1, data=mtcars, family = binomial()))
summary(base)
anova(base)

#Fit 1
(fit1 = glm(am ~ mpg + disp + hp + wt, data
            = mtcars, family = binomial() ))
summary(fit1)
anova(fit1)

layout(matrix(c(1,2,3,4), 2,2))
plot(fit1)


#Fit2
(fit2 = glm(am ~ mpg + hp + wt, data
            = mtcars, family = binomial() ))
summary(fit2)

AIC(fit1, fit2)

anova(fit2)
layout(matrix(c(1,2,3,4), 2,2))
plot(fit2)

anova(fit1, fit2)

#Fit3
(fit3 = glm(am ~ hp + wt, data=mtcars, family = binomial()))
summary(fit3)
anova(fit3)
plot(fit3)
anova(fit2, fit3)
AIC(fit2,fit3)


#Final Model
newdata = data.frame(wt=2, hp=150)
predict(fit3, newdata, type='response')
