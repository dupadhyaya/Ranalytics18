#mtcars linear regression



#https://cran.r-project.org/web/packages/olsrr/olsrr.pdf
#install.packages('olsrr')
library(olsrr)
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
k <- ols_step_all_possible(model)
plot(k)
k
(m1 = lm(mpg ~ wt, data=mtcars))
(m2 = lm(mpg ~ wt+ hp, data=mtcars))
anova(m1, m2)  #if p value is < 0.05 reject Ho
#Ho : Model m1, is better : m1 should be subset of m2

summary(m1) ; summary(m2)
