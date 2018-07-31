acc = read.csv("path to data")
View(acc)

set.seed(1)
index  <- sample(1:nrow(acc), round(0.75*nrow(acc)))
train  <- acc[index,]
test   <- acc[-index,]
fitTrn <- glm(isOneday~., data=train, family=binomial(link="logit")) 
fitted.results <- predict(fitTrn, newdata=test, type='response')

library(ROCR)
p   <- predict(fitTrn, newdata=test, type="response")
pr  <- prediction(p, test$isOneday)
prf <- performance(pr, measure="tpr", x.measure="fpr")
auc <- performance(pr, measure="auc")