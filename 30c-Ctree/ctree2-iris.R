# Classification ####
# Decision Treee Eg 1 ####
#http://www.rdatamining.com/examples/decision-tree

library("party")
str(iris)
#Call function ctree to build a decision tree. The first parameter is a formula, which defines a target variable and a list of independent variables.

iris_ctree <- ctree(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, data=iris)
print(iris_ctree)
plot(iris_ctree)
plot(iris_ctree,type='simple')




# 2nd Example
head(iris)
table(iris$Species, predict(iris.ct), dnn = c("Actual species", "Predicted species"))
new.iris
predict(iris.ct, newdata = new.iris)
predict(iris.ct, newdata = new.iris, type = "node")
#https://www.r-bloggers.com/package-party-conditional-inference-trees/
#

