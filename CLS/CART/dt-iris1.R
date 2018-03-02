# Iris
#
set.seed(1234)
iris.rp = rpart(Species ~ ., method='class', data=iris, 
                control=rpart.control(minsplit=4, cp=0.00001))
printcp(iris.rp)

iris.rp = rpart(Species ~ ., method='anova', data=iris, 
                control=rpart.control(minsplit=4, cp=0.00001))
printcp(iris.rp)
