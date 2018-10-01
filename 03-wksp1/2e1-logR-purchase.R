# Logistic Regression : Predict Purchase


# Import the dataset
df1 = read.csv('./data/logr2.csv')
head(df1)

url="https://docs.google.com/spreadsheets/d/1Md_ro2t3M7nA9JMH1DsE12jfeX7qq-UPw6p8WQd6A2Y/edit#gid=120271978"
library(gsheet)
df2 = as.data.frame(gsheet2tbl(url))
head(df2)

dataset=df2  #or df2 if data is imported from google sheets
head(dataset)
str(dataset)
summary(dataset)
dim(dataset)
View(dataset)
dataset$gender = factor(dataset$gender)


# Split the dataset into the Training set and Test set
#install.packages('caTools')
library(caTools)
set.seed(2000)
split = sample.split(dataset$purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

dim(dataset); dim(training_set); dim(test_set)
names(dataset)


# Logisitic Model on Training Set
logitmodel1 = glm(purchased ~ gender + age + salary, family = binomial,  data = training_set)
summary(logitmodel1)

# gender not insignificant dropped here
logitmodel2 = glm(purchased ~ age + salary, family = binomial, data = training_set)
summary(logitmodel2)

#summary(logitmodel2)$coefficient  # they are in log terms
head(training_set)
#predict on sample data
test_set2 = data.frame(age=c(40,65), gender=c('Male', 'Female'), salary=c(40000, 50000))
test_set2
(prob_pred2 = predict(logitmodel1, type = 'response', newdata = test_set2))
cbind(test_set2, prob_pred2)
#age=65 person likely to purchase

# Predicting the Test set results from testset
head(test_set)
prob_pred = predict(logitmodel1, type = 'response', newdata = test_set)
summary(prob_pred)
head(cbind(test_set,prob_pred ),10)

#if prob > 0.5 make it 1, else 0
y_pred = ifelse(prob_pred > 0.5, 1, 0)
head(cbind(test_set$purchased, y_pred),100)

# Making the Confusion Matrix
cm = table(test_set[,5], y_pred)
cm
library(caret)
caret::confusionMatrix(cm)

names(dataset)


