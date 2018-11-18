
#http://r-statistics.co/Linear-Regression.html
head(cars) 
fit2=lm(dist ~ speed, data=cars)
summary(fit2)
predict(fit2, newdata=data.frame(speed=c(5,8)))
plot(fit2)
nrow(cars)

index = sample(1:nrow(cars), size=0.8 * nrow(cars))
index
length(index)
length(unique(index))
traindata = cars[index,]
traindata
testdata = cars[-index,]
testdata
nrow(traindata) + nrow(testdata)

model1 = lm(dist ~ speed, data = traindata)
coef(model1)
(P1 = predict(model1, newdata = testdata))
df_test = cbind(testdata, P1)
cor(df_test$dist, P1)
(error = testdata$dist - P1)

AIC(model1)
BIC(model1)
(MAPE_error = mean(abs(error)/testdata$dist))

library(forecast)
accuracy(model1)
accuracy(error)

#https://www.ritchieng.com/machine-learning-evaluate-linear-regression-model/
#https://www.guru99.com/r-decision-trees.html
#http://www.sthda.com/english/articles/35-statistical-machine-learning-essentials/141-cart-model-decision-tree-essentials/
  