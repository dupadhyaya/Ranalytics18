#Sleep Data Set

library(ggplot2)
data("msleep")
?msleep
str(msleep)
df = msleep[, c(3,4,6,10,11)]
df
str(df)
head(df)

#Build a Regression Tree
#Predicting Sleeping Hours based on other IVs
library(rpart)
library(rpart.plot)
rtree1= rpart(sleep_total ~ . , data=df, method='anova')
rtree1
rpart.plot(rtree1, type=3, digits=3, fallen.leaves = T)

#dataset could test data instead of df
p1 = predict(rtree1, df)
p1
#Lower MAE the better
MAE = function(actual, predicted) { mean(abs(actual - predicted))}
MAE(df$sleep_total, p1)

