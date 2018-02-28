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
