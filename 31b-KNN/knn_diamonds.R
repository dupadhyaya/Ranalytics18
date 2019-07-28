##because diamonds dataset is in ggplot2 package
library(ggplot2)
##load data
data(diamonds)

##store it as data frame
dia <- data.frame(diamonds)

##create a random number equal 90% of total number of rows
ran <- sample(1:nrow(dia),0.9 * nrow(dia))

##the normalization function is created
nor <-function(x) { (x -min(x))/(max(x)-min(x))   }

##normalization function is created
dia_nor <- as.data.frame(lapply(dia[,c(1,5,6,7,8,9,10)], nor))

##training dataset extracted
dia_train <- dia_nor[ran,]

##test dataset extracted
dia_test <- dia_nor[-ran,]
##the 2nd column of training dataset because that is what we need to predict about testing dataset
##also convert ordered factor to normal factor
dia_target <- as.factor(dia[ran,2])

##the actual values of 2nd couln of testing dataset to compaire it with values that will be predicted
##also convert ordered factor to normal factor
test_target <- as.factor(dia[-ran,2])

##run knn function
library(class)
pr <- knn(dia_train,dia_test,cl=dia_target,k=20)

##create the confusion matrix
tb <- table(pr,test_target)

##check the accuracy
accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
accuracy(tb)

#In this model we have tried to predict the “cut” variable since it is a categorical variable and we know knn works better for classification problems. we have not taken the 3rd and 4th column into consideration since they were also categorical and would cause ambiguity because other predictive variables are integers. Note that there are ways to run knn on mixture of categorical and integer variables, but we are not discussing it here. The rest of the procedure is same as the iris dataset, and in the end we get the accurate result 71% of the times.