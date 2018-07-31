# AUC 

library(pROC)

auc(predictions$survived, predictions$pred)

?aSAH

# load the dataset
data(aSAH)

# Gender, outcome and set
with(aSAH, table(gender, outcome))

summary(aSAH$s100b)

head(aSAH)
auc(aSAH$outcome, aSAH$s100b)
#Area under the curve: 0.7314