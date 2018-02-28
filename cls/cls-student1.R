#Classification

data <- read.csv("E:/rWork/Projects/edm/studentdata.csv")
data$class = sample(c('Pass','Fail'), size=100, replace=TRUE, prob=c(0.6,0.4))
str(data)
head(data[c(1:4,13)])
data1 = data[-c(2,3)]
str(data1)
head(data1)
library(rpart)
set.seed(1234)
train = sample(nrow(data1),
              0.7*nrow(data1) )
data1.train = data1[train, ]
data1.train
data1.validate= data1[-train, ]
table(data1.train$class)
table(data1.validate$class)

dtree = rpart(class ~ ., data=data1.train,
              method= 'class', parms =
                list(split='information') )
print(dtree)
summary(dtree)
dtree$cptable
plotcp(dtree)
dtree.pruned = prune(dtree, cp =.01)
library(rpart.plot)

prp(dtree.pruned, type=2, extra = 104,
    fallen.leaves=T, main='Decision Tree')
dtree.pred = predict(dtree.pruned, data1.validate, type='class')
dtree.perf = table(data1.validate$class, dtree.pred, dnn=c('Actual', 'Predicted') )
dtree.perf


#Method2
#Eg  Character Value not supported
library(party)
fit.ctree = ctree(class ~ ., data = data1.train)

#Logistics
fit.logit = glm(class ~. , data = data1.train, family = binomial() )
