# Logisitic Regression : German Credit
#https://www.r-bloggers.com/evaluating-logistic-regression-models/
#
library(caret)
data(GermanCredit)
str(GermanCredit)
Train <- createDataPartition(GermanCredit$Class, p=0.6, list=FALSE)
training <- GermanCredit[ Train, ]
testing <- GermanCredit[ -Train, ]

exp(coef(mod_fit$finalModel))
##            (Intercept)                    Age          ForeignWorker 
##              1.1606762              1.0140593              0.5714748 
##    Property.RealEstate            Housing.Own CreditHistory.Critical 
##              1.8214566              1.6586940              2.5943711
predict(mod_fit, newdata=testing)
predict(mod_fit, newdata=testing, type="prob")

mod_fit_one <- glm(Class ~ Age + ForeignWorker + Property.RealEstate + Housing.Own + 
                     CreditHistory.Critical, data=training, family="binomial")

mod_fit_two <- glm(Class ~ Age + ForeignWorker, data=training, family="binomial")

anova(mod_fit_one, mod_fit_two, test ="Chisq")

library(lmtest)
lrtest(mod_fit_one, mod_fit_two)

library(pscl)
pR2(mod_fit_one)  # look for 'McFadden'
library(MKmisc)
HLgof.test(fit = fitted(mod_fit_one), obs = training$Class)
library(ResourceSelection)
hoslem.test(training$Class, fitted(mod_fit_one), g=10)

library(survey)
regTermTest(mod_fit_one, "ForeignWorker")
## Wald test for ForeignWorker
##  in glm(formula = Class ~ Age + ForeignWorker + Property.RealEstate + 
##     Housing.Own + CreditHistory.Critical, family = "binomial", 
##     data = training)
## F =  0.949388  on  1  and  594  df: p= 0.33027
regTermTest(mod_fit_one, "CreditHistory.Critical")
## Wald test for CreditHistory.Critical
##  in glm(formula = Class ~ Age + ForeignWorker + Property.RealEstate + 
##     Housing.Own + CreditHistory.Critical, family = "binomial", 
##     data = training)
## F =  16.67828  on  1  and  594  df: p= 5.0357e-05
Variable Importance
To assess the relative importance of individual predictors in the model, we can also look at the absolute value of the t-statistic for each model parameter. This technique is utilized by the varImp function in the caret package for general and generalized linear models.

varImp(mod_fit)
## glm variable importance
## 
##                        Overall
## CreditHistory.Critical  100.00
## Property.RealEstate      57.53
## Housing.Own              50.73
## Age                      22.04
## ForeignWorker             0.00

red = predict(mod_fit, newdata=testing)
accuracy <- table(pred, testing[,"Class"])
sum(diag(accuracy))/sum(accuracy)
## [1] 0.705
pred = predict(mod_fit, newdata=testing)
confusionMatrix(data=pred, testing$Class)

ibrary(pROC)
# Compute AUC for predicting Class with the variable CreditHistory.Critical
f1 = roc(Class ~ CreditHistory.Critical, data=training) 
plot(f1, col="red")
## 
## Call:
## roc.formula(formula = Class ~ CreditHistory.Critical, data = training)
## 
## Data: CreditHistory.Critical in 180 controls (Class Bad) < 420 cases (Class Good).
## Area under the curve: 0.5944
library(ROCR)
# Compute AUC for predicting Class with the model
prob <- predict(mod_fit_one, newdata=testing, type="response")
pred <- prediction(prob, testing$Class)
perf <- performance(pred, measure = "tpr", x.measure = "fpr")
plot(perf)
auc <- performance(pred, measure = "auc")
auc <- auc@y.values[[1]]
auc
## [1] 0.6540625

ctrl <- trainControl(method = "repeatedcv", number = 10, savePredictions = TRUE)

mod_fit <- train(Class ~ Age + ForeignWorker + Property.RealEstate + Housing.Own + 
                   CreditHistory.Critical,  data=GermanCredit, method="glm", family="binomial",
                 trControl = ctrl, tuneLength = 5)

pred = predict(mod_fit, newdata=testing)
confusionMatrix(data=pred, testing$Class)