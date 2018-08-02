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
train <- subset(dataset,split==TRUE)
test <- subset(dataset,split==FALSE)

# Use logistic regression and the one-vs-all strategy to build a classification model.
multinomModel <- multinom(Species~.,data=train)
summary (multinomModel) # model summary

# Predict on Test Data
predicted_scores <- predict (multinomModel, test, "probs") # predict on new data
predictions <- apply(predicted_scores , 1, which.max)
predictions[which(predictions=="1")] <- unique(dataset$Species)[1]
predictions[which(predictions=="2")] <- unique(dataset$Species)[2]
predictions[which(predictions=="3")] <- unique(dataset$Species)[3]
test$prediction <- predictions

# summarize accuracy
table(test$prediction, test$Species)
