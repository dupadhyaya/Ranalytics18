# Logistic Regression

subscribe = read.csv('./data/subscribe.csv')
summary(subscribe)
table(subscribe$subyn)
fitlr = glm(subyn ~ age, data=subscribe, family= binomial())
summary(fitlr)

coef(fitlr)
exp(coef(fitlr))
new1 = data.frame(age=24)
predict(fitlr, newdata=new1, type='response')

