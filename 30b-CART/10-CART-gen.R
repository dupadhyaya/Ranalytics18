#Basic Steps in CART

#Collect Data
#Identify if it is Classification or Regression Model
#Write the formula : y ~ x` + x2  ....

#load libraries 
library(rpart)
library(rpart.plot)
model= rpart(y  ~ ., method='class', data= , control=rpart.control(minsplit=4, cp=0.00001))
rpart.plot()

#Set any control Parameters
control_1 = rpart.control(cp = 0.005, minsplit=10, minbucket = 5)
control_2 = rpart.control(cp = -1)

#using iris dataset
set.seed(123)
irisclass = rpart(Species ~ ., data = iris, control = control_1)
irisclass
rpart.plot(irisclass)
printcp(irisclass)
#--------
irisclass2 = rpart(Species ~ ., data = iris, control = control_2)
irisclass2
rpart.plot(irisclass2, cex=.8)


#----------------------
#regression Tree-----
names(iris)  #which is numeric column - Length
irisregression = rpart(Sepal.Length ~ ., data = iris, method="anova", control = control_1)
irisregression
rpart.plot(irisregression)
printcp(irisregression)
pruneRT = prune(irisregression, cp=.008)
rpart.plot(pruneRT)
