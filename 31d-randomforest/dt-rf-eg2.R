#random Forests in R
#https://www.r-bloggers.com/how-to-implement-random-forests-in-r/

# Data Source: https://archive.ics.uci.edu/ml/machine-learning-databases/car/

#install.packages("randomForest")
library(randomForest)

df1 = read.csv('https://archive.ics.uci.edu/ml/machine-learning-databases/car/car.data')
head(df1)
data1 = df1
head(data1)
str(data1)
names(data1) = c("BuyingPrice", "Maintenance", "NumDoors", "NumPersons", "BootSpace" , "Safety" , "Condition")
summary(data1)
head(data1)

# Split into Train and Validation sets
# Training Set : Validation Set = 70 : 30 (random)
set.seed(100)
train <- sample(nrow(data1), 0.7*nrow(data1), replace = FALSE)
TrainSet <- data1[train,]
ValidSet <- data1[-train,]
summary(TrainSet)
summary(ValidSet)

summary(TrainSet)
summary(ValidSet)

# Create a Random Forest model with default parameters
model1 <- randomForest(Condition ~ ., data = TrainSet, importance = TRUE)
model1

# Fine tuning parameters of Random Forest model
model2 <- randomForest(Condition ~ ., data = TrainSet, ntree = 500, mtry = 6, importance = TRUE)
model2

# Predicting on train set
predTrain <- predict(model2, TrainSet, type = "class")
# Checking classification accuracy
table(predTrain, TrainSet$Condition)

# Predicting on Validation set
predValid <- predict(model2, ValidSet, type = "class")
# Checking classification accuracy
mean(predValid == ValidSet$Condition)                    
table(predValid,ValidSet$Condition)

# To check important variables
importance(model2)        
varImpPlot(model2)

# Using For loop to identify the right mtry for model
a=c()
i=5
for (i in 3:8) {
  model3 <- randomForest(Condition ~ ., data = TrainSet, ntree = 500, mtry = i, importance = TRUE)
  predValid <- predict(model3, ValidSet, type = "class")
  a[i-2] = mean(predValid == ValidSet$Condition)
}

a

plot(3:8,a)


#compare with dtree
# Compare with Decision Tree

#install.packages("rpart")
#install.packages("caret")
#install.packages("e1071")

library(rpart)
library(caret)
library(e1071)

model_dt = train(Condition ~ ., data = TrainSet, method = "rpart")
model_dt_1 = predict(model_dt, data = TrainSet)
table(model_dt_1, TrainSet$Condition)

mean(model_dt_1 == TrainSet$Condition)

# Running on Validation Set
model_dt_vs = predict(model_dt, newdata = ValidSet)
table(model_dt_vs, ValidSet$Condition)

mean(model_dt_vs == ValidSet$Condition)
