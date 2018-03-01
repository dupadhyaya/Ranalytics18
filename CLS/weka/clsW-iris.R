R Cls4
Sys.getenv("JAVA_HOME")

Sys.setenv(JAVA_HOME="C:\\Program Files\\Java\\jre1.8.0_111")


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



