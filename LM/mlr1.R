#Multiple Linear Regression
#
sales3 = read.csv('./data/pcsales.csv', skip=1)
summary(sales3)
sales3$salescapita = as.numeric(gsub("\\$", "", sales3$salescapita))
summary(sales3)
sales4 = sales3[-1]
names(sales4)
fit2 = lm(salescapita ~ ., data=sales4)
summary(fit2)

fit3 = lm(salescapita ~ . -unemrate, data=sales4)
summary(fit3)
#this is ok
head(sales4)
new1 = data.frame(pop=8, pcsales=200, gnp=5000, unemrate=5, eduspend=5)
predict(fit3, newdata=new1)
