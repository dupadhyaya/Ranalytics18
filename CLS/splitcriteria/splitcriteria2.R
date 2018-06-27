# Split Criteria

library(rpart)
library(rpart.plot)

(target = rep(c(1,0),times=c(5,5)))
(var1 = c(0,0,0,0,1,1,1,0,1,0))
(var2 = c(34,45,54,41,47,51,29,0,65,41))
data = data.frame(target, var1, var2)

set.seed(1234)
fit = rpart(target ~ var1 + var2, data= data, parms=list(split='gini'),  minsplit=4, minbucket=2,cp=.2)
fit
rpart.plot(fit)
printcp(fit)

table(data$target, data$var1, dnn=c('target', 'var1'))
table(data$target, data$var2, dnn=c('target', 'var2'))