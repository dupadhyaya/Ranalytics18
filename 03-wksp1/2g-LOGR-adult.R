#Logistic Regression : Binary Cls : 0 or 1

#Case Study :  predict if an individual will earn more than $50K using logistic regression based on demographic variables available in the adult data.

#Steps
# Import the data
# Check for class bias
# Create training and test samples
# Compute information value to find out important variables
# Build logit models and predict on test data
# Do model diagnostics

#Data Import ----
#from URL
inputData <- read.csv("http://rstatistics.net/wp-content/uploads/2015/09/adult.csv")
head(inputData)
str(inputData)
names(inputData)
removeColumns = c('FNLWGT','EDUCATION')

data= inputData[,-which(names(inputData) %in% removeColumns)]
names(data)

data$ABOVE50K = factor(data$ABOVE50K)

#train and test sets
library(caret)
Index <- createDataPartition(y=data$ABOVE50K, p=0.70, list=FALSE)
head(Index)
nrow(data)
trainData = data[Index ,]
testData = data[-Index, ]
table(data$ABOVE50K); prop.table(table(data$ABOVE50K))
summary(trainData$ABOVE50K); summary(testData$ABOVE50K)
nrow(trainData) ; nrow(testData); nrow(trainData) + nrow(testData)
prop.table(table(trainData$ABOVE50K))
prop.table(table(testData$ABOVE50K))
str(testData)


#Logistic Regression on selected columns
names(data)
logitMod <- glm(ABOVE50K ~ RELATIONSHIP + AGE + CAPITALGAIN + OCCUPATION , data=trainData, family='binomial')
summary(logitMod)
AIC(logitMod)

#Check the probabilities predicted for test data - 2 methods
predicted <- plogis(predict(logitMod, testData))  
head(predicted)
predicted <- predict(logitMod, testData, type="response")
head(predicted)

#what should be the cutoff value between 0 and 1 to categorise them into 0 or 1, so that accuracy is high (correct splitting)

#cutoff value
library(InformationValue)
(optCutOff <- optimalCutoff(testData$ABOVE50K, predicted)[1] )

#Confusion Matrix
(cm1= confusionMatrix(testData$ABOVE50K, predicted, threshold = optCutOff))
#0 classified as 0, 1 classified as 1



#diagnostics

car::vif(logitMod)
#all X variables in the model to have VIF below 4.

misClassError(testData$ABOVE50K, predicted, threshold = optCutOff)
#Misclassification error is the percentage mismatch of predcited vs actuals, irrespective of 1’s or 0’s. The lower the misclassification error, the better is your model.




ROC
#Receiver Operating Characteristics Curve traces the percentage of true positives accurately predicted by a given logit model as the prediction probability cutoff is lowered from 1 to 0. For a good model, as the cutoff is lowered, it should mark more of actual 1’s as positives and lesser of actual 0’s as 1’s. So for a good model, the curve should rise steeply, indicating that the TPR (Y-Axis) increases faster than the FPR (X-Axis) as the cutoff score decreases. Greater the area under the ROC curve, better the predictive ability of the model.

plotROC(testData$ABOVE50K, predicted)



















#http://r-statistics.co/Logistic-Regression-With-R.html
#https://rpubs.com/H_Zhu/235617


