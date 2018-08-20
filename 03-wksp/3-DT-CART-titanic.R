# Decision Tree - Classification

path = 'https://raw.githubusercontent.com/thomaspernet/data_csv_r/master/data/titanic_csv.csv'
titanic <-read.csv(path)
head(titanic)
names(titanic)
data = titanic[,c('plcass','survived','sex','age')]
data = titanic[,c(2,3,5,6,7)]
head(data)

#Decision Tree

library(rpart)
library(rpart.plot)
fit <- rpart(survived~., data = data, method = 'class')
fit
rpart.plot(fit, extra = 106, cex=.8,nn=T)

printcp(fit)

