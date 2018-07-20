#MLR using mtcars dataset
#mtcars
mtcars # mtcars data set
data()  # available dataset in R through libraries
?mtcars  # help on mtcars

dim(mtcars)
names(mtcars)
head(mtcars)
?mtcars

mtcarsfit1 = lm(mpg ~ cyl + disp + hp + drat + wt + qsec + vs + am +gear +carb , data = mtcars)
summary(mtcarsfit1)

mtcarsfit2 = lm(mpg ~ . , data = mtcars)
summary(mtcarsfit2)



library(MASS)
(model1a = lm(mpg ~ ., data=mtcars))
(model1b = lm(mpg ~ 1, data=mtcars))

summary(model1a)
summary(model1b)


stepboth = stepAIC(model1a,   direction='both')
fit1= lm(mpg ~ wt + qsec + am, data=mtcars)
summary(fit1)


stepfwd  = stepAIC(model1b,   direction='forward', scope=list(upper=model1a,lower=model1b))

stepback = stepAIC(model1a,   direction='backward')
?stepAIC


#-----
?step # base package

lm.full = lm(mpg ~ wt + cyl + gear + am +disp, data=mtcars)
model.aic.backward <- step(lm.full, direction = "backward", trace = 1)
summary(model.aic.backward)

lm.null = lm(mpg ~ 1, data=mtcars)
model.aic.forward <- step(lm.null, direction = "forward", trace = 1,scope = ~  wt + cyl + gear + am +disp)

summary(model.aic.forward)


#----
fit1 <- lm(y ~ ., data)
fit2 <- lm(y ~ 1, data)
stepAIC(fit1,direction="backward")
stepAIC(fit2,direction="forward",scope=list(upper=fit1,lower=fit2))
stepAIC(fit2,direction="both",scope=list(upper=fit1,lower=fit2))


(model1a = lm(mpg ~ disp + cyl + hp + drat + wt +
                qsec + carb, data=mtcars))
(model1b = lm(mpg ~ 1, data=mtcars))

