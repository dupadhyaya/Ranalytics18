#Logistic Regression - German Credit

library(caret)
library(ISLR)
data(Default) ; head(Default); str(Default)
data = Default
data$default = ifelse(data$default=="No",0,1)
head(data)

Train <- createDataPartition(data$default, p=0.6, list=FALSE)
training <- data[ Train, ]
testing <- data[ -Train, ]


head(training); dim(training); dim(testing)
str(training) ; str(training$default)

#Model
logR1 = glm(default ~ income + balance + student, family='binomial', data=training)
predict(logR1, newdata=testing, type="response")



actuals = testing$default
preds = predict(logR1, newdata=testing, type="response")
#best threshold (or cutoff) point to be used in glm models is the point which maximises the specificity and the sensitivity.  This threshold point might not give the highest prediction in your model, but it wouldn't be biased towards positives or negatives.

#-------
library(InformationValue)
(optCutOff <- optimalCutoff(actuals, preds)[1] )

summary(preds)
pred_default = ifelse(preds > optCutOff, 1, 0)

library(caret)
confusionMatrix(actuals, pred_default)
(t1=table(testing$default, pred_default))
accuracy1= caret::confusionMatrix(t1)
#-------
cutoff2 =0.5
pred_default2 = ifelse(preds > cutoff2, 1, 0)
confusionMatrix(actuals, pred_default2)
(t2=table(actuals, pred_default2))
accuracy2= caret::confusionMatrix(t2)
t1;t2
accuracy1; accuracy2
(TP1 = sum(diag(t1))/ sum(t1))
(TP2 = sum(diag(t2))/ sum(t2))
accuracy2
