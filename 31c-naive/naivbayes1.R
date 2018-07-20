# Naive Bayes
#https://www.r-bloggers.com/naive-bayes-classification-in-r-part-1/


library(e1071)
model <- naiveBayes(am ~ ., data = mtcars)
class(model)
summary(model)
print(model)

preds <- predict(model, newdata = mtcars)
preds
conf_matrix <- table(preds, mtcars$am)



#----
## Categorical data only:
data(HouseVotes84, package = "mlbench")
head(HouseVotes84)
model <- naiveBayes(Class ~ ., data = HouseVotes84)
predict(model, HouseVotes84[1:10,])
predict(model, HouseVotes84[1:10,], type = "raw")

pred <- predict(model, HouseVotes84)
table(pred, HouseVotes84$Class)

## using laplace smoothing:
model <- naiveBayes(Class ~ ., data = HouseVotes84, laplace = 3)
pred <- predict(model, HouseVotes84[,-1])
table(pred, HouseVotes84$Class)


## Example of using a contingency table:
data(Titanic)
m <- naiveBayes(Survived ~ ., data = Titanic)
m
predict(m, as.data.frame(Titanic))

## Example with metric predictors:
data(iris)
m <- naiveBayes(Species ~ ., data = iris)
## alternatively:
m <- naiveBayes(iris[,-5], iris[,5])
m
table(predict(m, iris), iris[,5])


