#Clear All
rm(list=ls())

# Load libraries
library(datasets)
library(caTools)
library(nnet)

# Load the dataset
dataset <- iris 
#Structure of the data
str(dataset)

#Split data into train and test
set.seed(123)
split <- sample.split(dataset$Species,SplitRatio = 0.80)
split
train <- subset(dataset,split==TRUE)
test <- subset(dataset,split==FALSE)
dim(dataset)
dim(train)
dim(test)

# Use logistic regression and the one-vs-all strategy to build a classification model.
multinomModel <- multinom(Species~.,data=train)
summary (multinomModel) # model summary

# Predict on Test Data
(predicted_scores <- predict (multinomModel, test, "class")) # predict on new data

predicted_scores <- predict (multinomModel, test, "probs") # predict on new data
predicted_scores
predictions <- apply(predicted_scores, 1, which.max)
predictions
names(test)[apply(predicted_scores, 1, which.max)]
predictions[which(predictions=="1")] <- unique(dataset$Species)[1]
predictions
unique(dataset$Species)[1]
predictions[which(predictions=="2")] <- unique(dataset$Species)[2]
predictions[which(predictions=="3")] <- unique(dataset$Species)[3]
test$prediction <- predictions
test$prediction
test$Species
# summarize accuracy
table(test$prediction, test$Species)
(10 + 9 + 10)/((10 + 9 + 10 + 1))


df <- data.frame(a = rnorm(5), b = rnorm(5), c = rnorm(5), x = rnorm(5), y = rnorm(5), z = rnorm(5))
df
df2 = df[,4:6]
df2
names(df2)[apply(df2, 1, which.max)]
