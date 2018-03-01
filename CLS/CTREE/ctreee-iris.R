# Classification - Party(Ctree) + IRIS
#https://predictoanalycto.wordpress.com/2014/05/30/classification-trees-with-r-programming-language-part-1/

#Load Libraries


str(iris)
#decision tree for classifying the flowers as one of the three Species : “setosa”, “versicolor”, “virginica”
#Attribute X - Condition - Either A or B or ...
#partition data set into two parts: Training  and Testing
#CART,  ID3, C4.5 are most widely used. ctree() uses CART algorithm.

set.seed(1234)
ind <- sample(2, nrow(iris), replace = TRUE, prob = c(0.7,0.3))
ind # 70% samples rows go as Trg, 
trainData <- iris[ind == 1,]
testData <- iris[ind == 2,]
head(trainData) ; head(testData)

library(party) #loads the library party
myFormula <- Species ~ Sepal.Length + Sepal.Width + Petal.Length  + Petal.Width
iris_tree <- ctree(myFormula, data = trainData) #ctree is a part of party package
table(predict(iris_tree), trainData$Species)

#setosa class are correctly classified. 3 objects belonging to versicolor class are classified as virginica and 1 object belonging to virgnica class has been classified as versicolor. 
#These values can differ depending on the seed that you had set previously

print(iris_tree) #To see how plain text version of our classification tree 
plot(iris_tree) #To see the plot of our tree

plot(iris_tree, type = "simple")
# for a condensed decision tree n = 19 y = (0, 0.842, 0.158) means that this node contains 19 training instances
#and they belong to versicolor with a # probability of 0.842

testPred <- predict (iris_tree, newdata = testData)
# Predicts the class name of the testData instances
table(testPred, testData$Species)
# Plots the predicted instances class against actual classes

# Most of the algorithm work similarly. Most of them involve following steps:
#   
# Find split location(attribute) in the dataset that minimizes a certain measure of node impurity.
# Repeat the above step on rest of the attributes until no attribute is left on which split can be achieved or model provides required amount of accuracy on unseen data.
# It is not necessary to use all the attributes of objects in making a decision tree, sometimes less number of attribute tests can also provide satisfactory results.
# Measures of node impurity:
#   
# Entropy = -\sum_{i=0}^{c-1}p(i|t)\log_{2}p(i|t)
# Gini = 1-\sum_{i=0}^{c-1}[p(i|t)]^{2}
# Classification error = 1-max_{i}[p(i|t)]