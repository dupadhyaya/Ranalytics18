#Multiple Linear Regression - mtcars

mtcars # mtcars data set
dim(mtcars); names(mtcars)

mtcarsfit1 = lm(mpg ~ cyl + disp + hp + drat + wt + qsec + vs + am +gear + carb , data = mtcars)
summary(mtcarsfit1)
#only wt seems to be significant

#select all variables with .
mtcarsfit2 = lm(mpg ~ . , data = mtcars)
summary(mtcarsfit2)
#still the same

#select random variables and try to test the model
mtcarsfit3 = lm(mpg ~ wt + hp + cyl, data=mtcars)
summary(mtcarsfit3)
#hp not significant
mtcarsfit3b = lm(mpg ~ wt + cyl, data=mtcars)
summary(mtcarsfit3b)
#adjs R2 = .819
head(mtcars[c('wt','cyl')])
ndata=data.frame(wt=c(2.5,3.5),cyl=c(4,6))
predict(mtcarsfit3b,newdata=ndata, type='response')

#Faster method for model selection
#there are large variables, we need a method to select variables, not possible to do one by one elimination

library(MASS)
(model1a = lm(mpg ~ ., data=mtcars)) #full model
#(model1b = lm(mpg ~ 1, data=mtcars)) #wihout any variables

summary(model1a)
#summary(model1b)

#step method to select best model
#works on AIC which should be less
stepboth = stepAIC(model1a,   direction='both')

# select combination of variable where AIC is minimum
#least AIC with wt, qsec, am
fit1= lm(mpg ~ wt + qsec + am, data=mtcars)
summary(fit1)


#Step AIC helps is select the variables from large number of vars
#variable combination which gives least AIC is selected

