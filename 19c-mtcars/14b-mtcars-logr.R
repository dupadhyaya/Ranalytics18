#Logistic Regression : mtcars
#http://www.r-tutor.com/elementary-statistics/logistic-regression/significance-test-logistic-regression

head(mtcars)
table(mtcars$am)
df = mtcars
df$am = factor(df$am)

#requirement : estimate the probability of a vehicle being fitted with a manual transmission if it has a 120hp engine and weights 2800 lbs.
(ndata = data.frame(hp=120, wt=2.8))
cbind(ndata, data.frame(probTx=c('?')))  #0 or 1

#create Model
am.glm = glm(am ~ hp + wt, data=df, family=binomial)

summary(am.glm)
#hp & wt are significant as pvalues < 0.05

#test data
(ndata = data.frame(hp=120, wt=2.8))

#predict
predict(am.glm, newdata=ndata, type="response") 

cbind(ndata, prob=predict(am.glm, newdata=ndata, type="response") )

#For an automobile with 120hp engine and 2800 lbs weight, the probability of it being fitted with a manual transmission is about 64%.

