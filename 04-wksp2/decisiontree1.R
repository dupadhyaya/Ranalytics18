#Decision Tree

library(rpart)
library(rpart.plot)

education=factor(c(3,2,2,3,2,2,3,2,2,2))
married=factor(c('S','M','S','M','M','M','S','S','M','S'))
income=c(125,100,70, 120, 95, 60, 220, 85, 75, 90)
buy=factor(c(0,0,0,0,1,0,0,1,0,1))
(data= data.frame(buy, education, married, income))
head(data)

xtabs( ~ buy + education, data=data)

table(data$buy, data$education)

dtree1 = rpart(buy ~ education + married + income, data=data)
dtree1
dtree1 = rpart(buy ~ education + married , data=data,   minsplit=4, minbucket=2,cp=-1)
table(data$buy)
dtree1
rpart.plot(dtree1, nn=T)
printcp(dtree1)

head(data)
(ndata1 = data.frame(education=factor(c(2,3)), married=factor(c('S','M')), income=c(110,120)))
(p1=predict(dtree1, newdata=ndata1, type='class'))

(p2=predict(dtree1, newdata=ndata1, type='prob'))
cbind(ndata1, p1,p2)

