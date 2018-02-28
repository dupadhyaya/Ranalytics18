# Decision Tree 2

refund=c('Yes','No' ,'No', 'Yes','No','No', 'Yes','No','No','No')
married=c('S','M','S','M','D','M','D','S','M','S')
income=c(125,100,70, 120, 95, 60, 220, 85, 75, 90)
cheat=c('No','No','No','No','Yes','No','No','Yes','No','Yes')
train= data.frame(refund, married, income, cheat)
train
library(rpart)
fit1 = rpart(cheat ~ ., data=train)
fit1
library(rpart.plot)
rpart.plot(fit1)
