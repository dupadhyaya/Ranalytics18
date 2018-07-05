library(rpart)
library(rpart.plot)

#Case-2----
#Create Dataset
set.seed(1234)
gender = sample(x= c('Male','Female'), size=30, replace=T, prob=c(0.4,0.6) )
table(gender)
gender = factor(gender)
set.seed(1234)
married = sample(x= c('Married','Single'), size=30, replace=T, prob=c(0.3,0.7) )
table(married)
married = factor(married)
set.seed(1234)
play = factor(sample(x= c('Play','NotPlay'), size=30, replace=T, prob=c(10/30,20/30) ))
table(play)

students2 = data.frame(gender, married, play)
#rownames(students2) = rollno
head(students2)
ftable(students2)

#Model2
set.seed(1234)
fit2 = rpart(play ~ gender + married, data=students2, minsplit=5, cp=-1)
fit2 ; rpart.plot(fit2)
summary(fit2)
names(fit2)
library(caret)
library(caret)
varImp(fit2)


#Plot
rpart.plot::rpart.plot(fit2, nn=T, main='Model2 : Classification Tree')

rpart.plot::rpart.plot(fit2, extra=104, box.palette="GnBu", branch.lty=3, shadow.col="gray", nn=TRUE)

rpart.plot::prp(fit2, extra=104, box.palette="GnBu", branch.lty=3, shadow.col="gray", nn=TRUE, fallen.leaves = T)


#Predict

predict(fit2, newdata = data.frame(gender='Male', married='Married'))
testdata = data.frame(gender=c( 'Male','Male','Female','Female'), married=c('Married', 'Single','Married','Single'))
testdata

(p1 = predict(fit2, newdata = testdata, type='vector'))
(p2 = predict(fit2, newdata = testdata, type='class'))
(p3 = predict(fit2, newdata = testdata, type='prob'))
cbind(testdata, p1, p2, p3)
predict(fit2, newdata= testdata, type = "matrix")


#Variable Importance

set.seed(1234)
data(mtcars)
library(randomForest)
mtcars.rf <- randomForest(mpg ~ ., data=mtcars, ntree=1000, keep.forest=FALSE,
                          importance=TRUE)
varImpPlot(mtcars.rf)



str(students2)
students2.rf <- randomForest(play ~ gender + married, data=students2, ntree=1000, keep.forest=FALSE,importance=TRUE)
?randomForest
varImpPlot(students2.rf)
importance(students2.rf)

#Mean Decrease in Accuracy the number or proportion of observations that are incorrectly classified by removing the feature (or values from the feature) in question from the model?"


