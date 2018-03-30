# Logistic Regression
# Import the dataset

setwd("d:\\Users\\XPS\\Desktop\\Logistic Regression")

dataset = read.csv('./regr/Social_Network_Ads.csv')
#dataset = dataset[, 3:5]
View(dataset)
# Split the dataset into the Training set and Test set

#install.packages('caTools')
library(caTools)
set.seed(2000)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
dim(training_set); dim(test_set)
names(training_set)
# Feature Scaling
#training_set[, 1:2] = scale(training_set[, 1:2])
#test_set[, 1:2] = scale(test_set[, 1:2])

# Fitting Logistic Regression to the Training set
classifier = glm(formula = Purchased ~ as.factor(Gender)+Age+EstimatedSalary,family = binomial, data = training_set)

summary(classifier)

# Fitting Logistic Regression to the Training set - Age being insignificant is dropped here
classifier = glm(formula = Purchased ~ as.factor(Gender)+EstimatedSalary, family = binomial, data = training_set)

summary(classifier)
summary(classifier)$coefficient


# Predicting the Test set results
prob_pred = predict(classifier, type = 'response', newdata = test_set)
df_prob_pred = as.data.frame(prob_pred)

head(df_prob_pred)
y_pred = ifelse(prob_pred > 0.5, 1, 0)
y_pred

# Making the Confusion Matrix
cm = table(test_set[,5], y_pred)
cm
caret::confusionMatrix(cm)
