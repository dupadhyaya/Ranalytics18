#Sleep Data Set

library(ggplot2)
data("msleep")
str(msleep)
df = msleep[, c(3,4,6,10,11)]
df
str(df)
head(df)

#Build a Regression Tree
#Predicting Sleeping Hourse based on other IVs
library(rpart)
library(rpart.plot)
m1 = rpart(sleep_total ~ . , data=df, method='anova')
m1
rpart.plot(m1, type=3, digits=3, fallen.leaves = T)

#dataset could test data instead of df
p1 = predict(m1, df)
p1
#Lower MAE the better
MAE = function(actual, predicted) { mean(abs(actual - predicted))}
MAE(df$sleep_total, p1)

