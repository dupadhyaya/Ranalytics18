#mtcars linear regression
#https://cran.r-project.org/web/packages/olsrr/olsrr.pdf
#install.packages('olsrr')
library(olsrr)
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
k <- ols_step_all_possible(model)
plot(k)
k

#create model and check which model is better
(m1 = lm(mpg ~ wt, data=mtcars))
summary(m1)
(m2 = lm(mpg ~ hp + wt + qsec , data=mtcars))
summary(m2)

anova(m1, m2)  #if p value is < 0.05 reject Ho
#Ho : Model m1, is better : m1 should be subset of m2

AIC(m1, m2)
AIC(m1)
#m2 AIC < m2 AIC

#what is AIC
#alkaline information criteria : way to check which model is better
