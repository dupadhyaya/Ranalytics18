# Decision Tree - Loan Default or Churn
# age, gender, status, 

library(rpart)
# Part -2 : increase data points
age = floor(runif(50,30,60))
age
gender = sample(c('M','F'), size=50, replace=T)
gender
churn = sample(c('Yes','No'), size=50, replace=T, prob=c(.6,.4))
churn
mobilecust = data.frame(age, gender, churn)
str(mobilecust)


mytree1 = rpart (churn ~ age + gender, data=mobilecust, method='class', minsplit=10, minbucket=5)

summary(mytree1)
plotcp(mytree1)
plot(mytree1)
library(rpart.plot)
library(RColorBrewer)
fancyRpartPlot(mytree1)



#Case2  : Larger Data
#https://www.ibm.com/communities/analytics/watson-analytics-blog/guide-to-sample-datasets/
churn2 = read.csv('./data/churn.csv') 
summary(churn2)
sapply(churn2, function(x) sum(is.na(x)))
churn2 <- churn2[complete.cases(churn2), ]
names(churn2)
tree2 <- ctree(Churn ~ Contract + tenure  +PaperlessBilling, data=churn2)
plot(tree2)
fancyRpartPlot(tree2)
