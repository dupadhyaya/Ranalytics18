# CART Models - HH Case Study - Regression
library(rpart)
library(rpart.plot)
library(forecast)

library(gsheet)
url='https://docs.google.com/spreadsheets/d/1PWWoMqE5o3ChwJbpexeeYkW6p4BHL9hubVb1fkKSBgA/edit#gid=1941519952'
data = as.data.frame(gsheet2tbl(url))
str(data)

# Summarize the dataset
summary(data)
names(data)
# Random Sampling
set.seed(777) # To ensure reproducibility
Index = sample(x = 1:nrow(data), size = 0.7*nrow(data))
Index

# Create Train dataset
train= data[Index, ]
nrow(train)

# Create Test dataset
test = data[-Index, ]
nrow(test)
nrow(test) + nrow(train)

########################### Modeling #################################

trainModel = rpart(Annual_Sales ~ . , data = train[,-1], method = "anova")
trainModel
mean(train$Annual_Sales)

# Plot the Regression Tree
rpart.plot(trainModel, type = 4,fallen.leaves = T, cex = 1.0, nn=T)

#cp selection
printcp(trainModel)
trainModel_prune = prune(trainModel, cp=0.01)
rpart.plot(trainModel_prune)

#Predict and check accuracy
predictSales_test = predict(trainModel_prune, newdata = test, type = "vector")
predictSales_test  #vector to print values of sales predicted

library(forecast)
# Validate RMSE and MAPE calculation with a function in R
ModelAccuarcy = accuracy(predictSales_test, test$Annual_Sales)
ModelAccuarcy
#RMSE should be as less as possible

