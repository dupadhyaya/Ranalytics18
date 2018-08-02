library(gRapfa)
data(Wheeze)
gRapfa::cross.validate(Data=Wheeze, K = 10, crit = NULL, beagle = TRUE, dir='')

library(adabag)
data(churn)
trainset = churn[1:100,]
churn.baggingcv = bagging.cv(churn ~ .,
                             v=10, data=trainset, mfinal=10)
churn.baggingcv$confusion

churn.baggingcv$error
