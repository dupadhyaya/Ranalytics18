#KNN using iris

df <- data(iris) ##load data
head(iris) ## see the studcture
##Generate random numbers that is 90% of the total number of rows in dataset.
ran <- sample(1:nrow(iris), 0.9 * nrow(iris)) 
ran
##the normalization function is created
nor <-function(x) { (x -min(x))/(max(x)-min(x))   }
nor
##Run nomalization on first 4 coulumns of dataset because they are the predictors
iris_norm <- as.data.frame(lapply(iris[,c(1,2,3,4)], nor))
head(iris_norm)
summary(iris_norm)

##extract training set
iris_train <- iris_norm[ran,] 
head(iris_train)

##extract testing set
iris_test <- iris_norm[-ran,] 
head(iris_test)

##extract 5th column of train dataset because it will be used as 'cl' argument in knn function.
iris_target_category <- iris[ran,5]

##extract 5th column if test dataset to measure the accuracy
iris_test_category <- iris[-ran,5]

##load the package class
library(class)

##run knn function
pr <- knn(train=iris_train,test=iris_test,cl=iris_target_category,k=13)

##create confusion matrix
tab <- table(pr,iris_test_category)
tab

##this function divides the correct predictions by total number of predictions that tell us how accurate teh model is.

accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
accuracy(tab)


#read more from here
#https://towardsdatascience.com/k-nearest-neighbors-algorithm-with-examples-in-r-simply-explained-knn-1f2c88da405c


#-----------------------------