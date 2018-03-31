
#mtcars
mtcars
dim(mtcars)
names(mtcars)
head(mtcars)
?mtcars

library(MASS)
(model1a = lm(mpg ~ disp + cyl + hp + drat + wt +
                qsec + carb, data=mtcars))
step = stepAIC(model1a,
               direction='both')
?stepAIC
