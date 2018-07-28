#CART Regression Tree

#Load Libraries
library(rpart)  #does only binary splits; CART
library(rpart.plot)

#DataSet
str(iris)
head(iris)

table(iris$Species)

library(dplyr)
sample_n(iris, 3)
sample_frac(iris, .1)
# Classification Tree
summary(iris)
set.seed(1234)
#Predict Species
ctree = rpart(Species ~ ., method='class', data=iris)
ctree
rpart.plot(ctree, main='Classification Tree', nn=T, type=4, cex=1,extra=104)
printcp(ctree)
ctreeprune = prune(ctree, cp=0.44)
ctreeprune
rpart.plot(ctreeprune, main='Classification Tree', nn=T, type=4, extra=104)
# Regression Tree - Predict Continuous Value Length
#Predict Sepal.Length
rtree = rpart(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width + Species, method="anova", data=iris )
rtree
rpart.plot(rtree, main='Regression Tree', nn=T, type=2, cex=1)

#another way to plot
plot(rtree, uniform=TRUE, main="Regression Tree for Sepal Length")
text(rtree, use.n=TRUE, cex = 1)

#CP
printcp(rtree)
rsq.rpart(rtree)  #r2 on anova only

rtreeprune = prune(rtree, cp=0.023)
rpart.plot(rtreeprune, main='Pruned Regression Tree', nn=T, type=2, cex=1)



#https://analytics4all.org/2016/11/23/r-decision-trees-regression/


#Predict : Class  : Category of Flower
str(iris)
testData1  = data.frame ( Sepal.Length = 5, Sepal.Width = 4, Petal.Length =1.2, Petal.Width=0.3)
predict(ctree, testData1, method = "class")  #setosa


#Predict : Continous Value : Length

testData2  = data.frame (Species = 'setosa', Sepal.Width = 4, Petal.Length =1.2, Petal.Width=0.3)
predict(rtree, testData2, method = "anova") #5.17

