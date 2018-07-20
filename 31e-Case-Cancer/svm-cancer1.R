# Support Vector Machine
#https://rpubs.com/ricardosc/breast-cancer
#https://github.com/kabacoff/RiA2/blob/master/Ch17%20Classification.R

#first setup the data from data-breast.R
source('./cls/case-cancer/data-cancer.R')
library(e1071)
set.seed(1234)

names(df.train)
head(df.train)
summary(df.train)
fit.svm = svm(class ~ . , df.train)
fit.svm
plot(fit.svm, data=df.train)  # will not work
plot(fit.svm, df.train, clumpThickness ~ sizeUniformity)
#    slice = list(Sepal.Width = 3, Sepal.Length = 4))
#http://ugrad.stat.ubc.ca/R/library/e1071/html/plot.svm.html



svm.pred = predict(fit.svm, na.omit(df.validate))
svm.pred
plot(svm.pred)
plot(svm.pred, na.omit(df.validate))


na.omit(df.validate)$class

svm.perf = table(na.omit(df.validate)$class, svm.pred, dnn=c('Actual','Predicted'))
svm.perf                 


#Cannot handle missing values in IV
#scaling done before classification model
#better accuracy but < random forests
# Predicted
# Actual      benign malignant
# benign       116         4
# malignant      3        77

#Tuning
set.see(1234)
#tuned = tune.svm(class ~ ., data=df.train, gamma=10 ^ (-6:1), cost=10^(-10:10))
#tuned

fit.svm = svm(class ~. , df.train, gamma=0.2, cost=1)
fit.svm
svm.pred = predict(fit.svm, na.omit(df.validate))
svm.pred
svm.perf = table(na.omit(df.validate)$class, svm.pred, dnn=c('Actual', 'Predicted'))
svm.perf
# Predicted
# Actual      benign malignant
# benign       116         4
# malignant      3        77

dim(df.validate)
library(caret) 
confusionMatrix(svm.perf)
(116+77) ; 193/220
