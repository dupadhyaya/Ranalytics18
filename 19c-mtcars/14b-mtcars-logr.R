#Logistic Regression : mtcars
#http://www.r-tutor.com/elementary-statistics/logistic-regression/significance-test-logistic-regression

head(mtcars)
table(mtcars$am)
df = mtcars
df$am = factor(df$am)

#requirement : estimate the probability of a vehicle being fitted with a manual transmission if it has a 120hp engine and weights 2800 lbs.

am.glm = glm(formula=am ~ hp + wt, data=mtcars, family=binomial)
summary(am.glm)
#hp & wt are significant as pvalues < 0.05


#test data
newdata = data.frame(hp=120, wt=2.8)
predict(am.glm, newdata, type="response") 

#For an automobile with 120hp engine and 2800 lbs weight, the probability of it being fitted with a manual transmission is about 64%.
