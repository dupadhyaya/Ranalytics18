#https://cran.r-project.org/web/packages/olsrr/olsrr.pdf
#install.packages('olsrr')
library(olsrr) #install it first

model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
summary(model)
#model <- lm(mpg ~ hp + wt , data = mtcars)
#summary(model)
k <- ols_step_all_possible(model)
#plot(k)
k
summary(lm(mpg ~ wt, data=mtcars))
summary(lm(mpg ~ wt+ hp, data=mtcars))
summary(lm(mpg ~ hp + wt + qsec, data=mtcars))


#library(olsrr)
fit = lm(mpg ~ disp + hp + wt + qsec, data = train)
k = ols_step_all_possible(fit)
plot(k)
k
summary(lm(mpg ~ wt, data= train))
summary(lm(mpg ~ wt + hp, data= train))
finalmodel = lm(mpg ~ wt + hp, data= train)
library(gvlma)
gvmodel = gvlma(finalmodel)
gvmodel

finalmodel = lm(mpg ~ wt + hp, data= train)
(predictedvalues = predict(finalmodel, ndata=test))
cbind(test$mpg, predictedvalues)

