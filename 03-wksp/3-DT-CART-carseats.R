# Decision Trees : - regression tree

library(ISLR)
data(Carseats)
data = Carseats
head(data)

#Libraries for Decision Tree
library(rpart)
library(rpart.plot)

#Model
tree1 = rpart(Sales ~ . , data=data, method='anova' )
tree1
rpart.plot(tree1, cex=.8)

#this is large tree, so prune it: check cp
printcp(tree1)
prunetree = prune(tree1, cp=0.05)
prunetree
rpart.plot(prunetree, nn=T)

#improve the plot
rpart.plot(prunetree, nn=T, cex=.8, type=4)

(testdata = sample_n(data,2))
predict(prunetree, newdata=testdata, type='vector')

#https://www.datacamp.com/community/tutorials/decision-trees-R

