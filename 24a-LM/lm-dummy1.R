#Regression with Dummy Variables
mycars <- mtcars
mycars$cyl <- factor(mycars$cyl)
contrasts(mycars$cyl)
fit <- lm( mpg ~ wt+cyl, data=mycars, x=T )
summary(fit)
?lm
fit$contrasts
head(fit$x)
cbind(mycars$mpg, fitted(fit))

# 2 Dummy Variables
mycars <- mtcars
mycars$cyl = factor(mycars$cyl)
mycars$am  = factor(mycars$am)
contrasts(mycars$cyl)
contrasts(mycars$am)
fit2 <- lm( mpg ~ wt + cyl + am, data=mycars, x=T )
summary(fit2)
head(fit2$x)
cbind(mycars$mpg, fitted(fit))
