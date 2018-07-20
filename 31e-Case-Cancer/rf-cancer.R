# Random Forests
#http://www.instituteofanalytics.com/forum/uploads/editor/ls/4kivialj5lvj.pdf

library(randomForest)
set.seed(1234)

fit.forest = randomForest(class ~ . , data=df.train, na.action = na.roughfix, importance=T)
fit.forest

importance(fit.forest, type=2)

forest.pred = predict(fit.forest, df.validate)
forest.perf = table(df.validate$class, forest.pred, dnn=c('Actual', 'Predicted'))
forest.perf

caret::confusionMatrix(forest.perf)


#Plot Random Forests
library(reprtree)
getTree(fit.forest, 1, labelVar=TRUE)
  
library(reprtree)

cforest(Species ~ ., data=iris, controls=cforest_control(mtry=2, mincriterion=0))



#----
library(devtools)
if(!('reprtree' %in% installed.packages())){
  install_github('araastat/reprtree')
}
