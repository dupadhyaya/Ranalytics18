
#Wisconsin Breast Cancer
loc='http://archive.ics.uci.edu/ml/machine-learning-databases/'
ds='breast-cancer-wisconsin/breast-cancer-wisconsin.data'
url = paste(loc,ds,sep='')
breast = read.table(url, sep=',' , header=F, na.strings='?' )
names(breast)
#[1] "V1" "V2" "V3" "V4" ..
#'data.frame': 699 obs. of  11 variables:  $ V1 : int  1000025 1002945 $ V2 : int  5 5 3 6
names(breast) = c('ID' , 'clumpThickness', 'sizeUniformity', 'shapeUniformity', 'maginalAdhesion', 'singleEpthelialCellSize', 'bareNuclei', 'blandChromatin', 'normalNucleoli', 'mitosis', 'class')
df = breast[-1]
head(df)
df$class = factor(df$class, levels=c(2,4), labels = c('benign', 'malignant'))
head(df$class)
set.seed(1234)
train = sample(nrow(df), 0.7*nrow(df) )
length(train)
df.train = df[train, ]
head(df.train[,c(1,10)])
df.validate= df[-train, ]
nrow(df.validate)
table(df.train$class)
table(df.validate$class)

?glm

#Eg1
fit.logit = glm(class ~. , data = df.train, family = binomial() )
summary(fit.logit)
prob = predict (fit.logit, df.validate, type='response')
prob
logit.pred = factor(prob > .5, level=c(F,T), labels=c('benign', 'malignant') )
logit.pred
logit.perf = table(df.validate$class, logit.pred, dnn=c('Actual', 'Predicted') )
logit.perf
table(df.validate$class)


#Eg
library(rpart)
set.seed(1234)
str(df.train)
str(df.validate)
dtree = rpart(class ~ ., data=df.train, method= 'class', parms = list(split='information') )
dtree$cptable
print(dtree)
plotcp(dtree)
abline(v=1)
summary(dtree)
dtree.pruned = prune(dtree, cp =.01)
dtree.pruned
library(rpart.plot)
prp(dtree.pruned, type=2, extra = 104, fallen.leaves=T, main='Decision Tree')
dtree.pred = predict(dtree.pruned, df.validate, type='class')
dtree.perf = table(df.validate$class, dtree.pred, dnn=c('Actual', 'Predicted') )
dtree.perf
201/210

#Eg
library(party)
fit.ctree = ctree(class ~ ., data = df.train)
plot(fit.ctree, main='Conditional Inference Tree')
ctree.pred = predict(fit.ctree, df.validate, type='response')
ctree.perf = table(df.validate$class, ctree.pred, dnn=c('Actual', 'Predicted') )
ctree.perf

#Eg
library(randomForest)
set.seed(1234)
fit.forest = randomForest(class ~ ., data=df.train, na.action=na.roughfix, important=T)
fit.forest
importance(fit.forest, type=2)
forest.pred = predict( fit.forest, df.validate)
forest.perf = table(df.validate$class, forest.pred, dnn=c('Actual', 'Predicted') )
forest.perf
(126+73)

#Eg2 : cforest() :: party package
#Eg2 : cforest() :: party package
library(party)
cforest(Species ~ ., data=iris, controls=cforest_control(mtry=2, mincriterion=0))
Random Forest using Conditional Inference Trees Number of trees:  500  Response:  Species  Inputs:  Sepal.Length, Sepal.Width, Petal.Length, Petal.Width  Number of observations:  150
rf <- randomForest(Species ~ ., data=iris)
getTree(rf, 1, labelVar=TRUE)

#Eg3
data(mtcars)
mtcars.rf <- randomForest(mpg ~ ., data=mtcars, ntree=1000, keep.forest=FALSE, importance=TRUE)
plot(mtcars.rf, log="y")
varImpPlot(mtcars.rf)
#Eg4
set.seed(1)
data(iris)
iris.rf <- randomForest(Species ~ ., iris, proximity=TRUE, keep.forest=FALSE)
MDSplot(iris.rf, iris$Species)

#Eg1
library(e1071)
set.seed(1234)
fit.svm = svm(class ~., data = df.train)
fit.svm
svm.pred = predict(fit.svm, na.omit(df.validate))
svm.perf = table(na.omit (df.validate)$class, svm.pred, dnn=c('Actual', 'Predicted') )
svm.perf


#Eg2
set.seed(1234)
tuned = tune.svm(class ~., data = df.train, gamma = 10^ (-6:1), cost(10^(-10:10)))

                 tuned
fit.svm = svm(class ~., data=df.train, gamma=0.01, cost=1 )
svm.pred = predict(fit.svm, na.omit(df.validate))
svm.perf = table(na.omit (df.validate)$class, svm.pred, dnn=c('Actual', 'Predicted') )
svm.perf
                 