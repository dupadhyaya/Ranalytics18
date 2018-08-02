# LR with MT cars
# Forward and Backward

#Data----
str(mtcars)
names(mtcars)
dim(mtcars)
table(mtcars$am)
addmargins(table(mtcars$am))

#Blank Model----
(mtcars.lm = lm(mpg ~ 1, data=mtcars))
summary(mtcars.lm)

#Find Best Predictor----
add1(mtcars.lm, mtcars, test='F')

#Add Best Predictor----
mtcars.lm = lm(mpg ~ wt, data=mtcars)
summary(mtcars.lm)

#Next Best Predictor
add1(mtcars.lm, mtcars, test='F')

mtcars.lm = lm(mpg ~ wt + cyl, data=mtcars)
summary(mtcars.lm)

add1(mtcars.lm, mtcars, test='F')
#None to be added


# compare models
fit1 <- lm(mpg ~ wt, data=mtcars)
fit2 <- lm(mpg ~ wt + cyl, mtcars)
anova(fit1, fit2)  #more,less
#pv < 0.05, adding a variable has significant effect on R2

AIC(fit1,fit2)  #fit2 with wt & cyl better

# Other useful functions 
coefficients(fit) # model coefficients
confint(fit, level=0.95) # CIs for model parameters 
fitted(fit) # predicted values
residuals(fit) # residuals
anova(fit) # anova table 
vcov(fit) # covariance matrix for model parameters 
influence(fit) # regression diagnostics

# diagnostic plots 
layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
plot(fit)






#Backward
#
fit.full <- lm(mpg ~ wt + cyl + hp + am ,data=mtcars)
summary(fit.full)
drop1(fit.full, test='F')
drop1(update(fit.full, ~ . -am), test = "F")
drop1(update(fit.full, ~ . -am - hp), test = "F")


#http://rstudio-pubs-static.s3.amazonaws.com/2899_a9129debf6bd47d2a0501de9c0dc583d.html

# K-fold cross-validation
library(DAAG)
cv.lm(data=mtcars, fit2, m=3, plotit=F) # 3 fold cross-validation
#mse = 7.09
#assess R2 shrinkage via K-fold cross-validation.
#
#
# Assessing R2 shrinkage using 10-Fold Cross-Validation 

fit <- lm(mpg ~wt + cyl,data=mtcars) 

library(bootstrap)
# define functions 
theta.fit <- function(x,y){lsfit(x,y)}
theta.predict <- function(fit,x){cbind(1,x)%*%fit$coef} 

# matrix of predictors
X <- as.matrix(mtcars[c("wt","cyl")])
# vector of predicted values
y <- as.matrix(mydata[c("mpg")]) 

results <- crossval(X,y,theta.fit,theta.predict,ngroup=10)
cor(y, fit$fitted.values)**2 # raw R2 
cor(y,results$cv.fit)**2 # cross-validated R2

names(mtcars)
# Stepwise Regression
library(MASS)
fit <- lm(mpg ~ wt + cyl + hp + am ,data=mtcars)
step <- stepAIC(fit, direction="both")
step$anova # display results


Alternatively, you can perform all-subsets regression using the leaps( ) function from the leaps package. In the following code nbest indicates the number of subsets of each size to report. Here, the ten best models will be reported for each subset size (1 predictor, 2 predictors, etc.).

# All Subsets Regression
library(leaps)
attach(mydata)
leaps<-regsubsets(mpg ~ wt + cyl + hp + am,data=mtcars,nbest=10)
# view results 
summary(leaps)
# plot a table of models showing variables in each model.
# models are ordered by the selection statistic.
plot(leaps,scale="r2")
# plot statistic by subset size 
library(car)
subsets(leaps, statistic="rsq")
Other options for plot( ) are bic, Cp, and adjr2.
Other options for plotting with 
subset( ) are bic, cp, adjr2, and rss

The relaimpo package provides measures of relative importance for each of the predictors in the model. See help(calc.relimp) for details on the four measures of relative importance provided.

# Calculate Relative Importance for Each Predictor
library(relaimpo)
calc.relimp(fit,type=c("lmg","last","first","pratt"),rela=TRUE)

# Bootstrap Measures of Relative Importance (1000 samples) 
boot <- boot.relimp(fit, b = 1000, type = c("lmg", 
      "last", "first", "pratt"), rank = TRUE, 
                    diff = TRUE, rela = TRUE)
booteval.relimp(boot) # print result
plot(booteval.relimp(boot,sort=TRUE)) # plot result


library(rms)
mydata = as.matrix(mtcars)
ols.full <- ols(mpg ~ mpg + wt  , data = mtcars)

fastbw(ols.full, rule = "p", sls = 0.1)
mtcars$cylgr <- with(mtcars,interaction(cyl,gear == "4"))
regular_ols <- ols(mpg ~ wt + cyl + gear + cylgr, data=mtcars)
regular_ols
fastbw(regular_ols, rule='p', sls=0.1)
?ols

lm.full = lm(mpg ~ wt + cyl + gear + am +disp, data=mtcars)
model.aic.backward <- step(lm.full, direction = "backward", trace = 1)
summary(model.aic.backward)
lm.null = lm(mpg ~ 1, data=mtcars)
model.aic.forward <- step(lm.null, direction = "forward", trace = 1,
      scope = ~  wt + cyl + gear + am +disp)
summary(model.aic.forward)

model.aic.both <- step(lm.null, direction ="both",
trace = 1, scope =  ~ wt + cyl + gear + am +disp)
summary(model.aic.both)



