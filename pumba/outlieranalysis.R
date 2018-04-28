# Outlier Analysis - BA
#outlier not predicted well in by fitted regression model

marks1 = c(1:80, 100)
marks2 = c(1:80,100, 1000)
summary(marks1)
summary(marks2)

par(mfrow=c(1,2))  # multiple frames per row
boxplot(marks1)
(q1= quantile(marks1, c(.0,.25,.50,.75,1)))
abline(h=q1, col=1:6)
text(1, q1+2, labels=c('min','1Q','median','3Q','max'), col=1:5)
title(main='Marks1')

boxplot(marks2)
(q2= quantile(marks2, c(.0,.25,.50,.75,1)))
abline(h=q2, col=1:6)
text(1, q2+2, labels=c('min','1Q','median','3Q','max'), col=1:5)
title(main='Marks2')

mean(marks1); mean(marks2)  # diff in means due to outlier
; mean(marks2, trim=.1)# trim extreme values
median(marks1); median(marks2)  # not much diff

# when you have large values how to identify outlier rows
#Identify---
set.seed(482)
(y = c(rnorm(100,50,10), 150, 170,200))
boxplot(y)
identify(rep(1, length(y)), y, labels = seq_along(y))
y[c(101,102,103)]

# How do outlier effect Regressions : Identify them

names(mtcars)
mtcarslm = lm(mpg ~ wt + cyl + hp + am + gear, data=mtcars)
boxplot(mtcars)
mtv1 = c('hp', 'disp')  # few variables only
boxplot(mtcars[mtv1])
boxplot(mtcars[c(-mtv1)])
ix= match(mtv1,names(mtcars))
boxplot(mtcars[,-ix])
?match
library(car)
car::outlierTest(mtcarslm)

car::influencePlot(mtcarslm)