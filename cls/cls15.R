R Cls4
#Eg1
library(RWeka)
data(iris)
fit <- J48(Species~., data=iris)
summary(fit)
predictions <- predict(fit, iris[,1:4])
table(predictions, iris$Species)
#Eg2
library(RWeka)
data(iris)
fit <- PART(Species~., data=iris)
summary(fit)
predictions <- predict(fit, iris[,1:4])
table(predictions, iris$Species)
