# Decision Tree - Splitting Criteria

# Gini Index

library(rpart)
library(rpart.plot)

education=factor(c(3,2,2,3,2,2,3,2,2,2))
married=factor(c('S','M','S','M','M','M','S','S','M','S'))
income=c(125,100,70, 120, 95, 60, 220, 85, 75, 90)
buy=factor(c(0,0,0,0,1,0,0,1,0,1))
(data= data.frame(buy, education, married, income))

fit = rpart(buy ~ education + married, data=data, parms=list(split='gini'),  minsplit=4, minbucket=2,cp=-1)
fit
rpart.plot(fit)
printcp(fit)

fit1 = rpart(buy ~ education + married + income, data=data, parms=list(split='gini'),  minsplit=4, minbucket=2,cp=.2)
fit1
rpart.plot(fit1)
printcp(fit1)

fit2 = rpart(buy ~ education + married + income, data=data, parms=list(split='gini'),  minsplit=4, minbucket=2,cp=-1)
fit2
rpart.plot(fit2)
printcp(fit2)






