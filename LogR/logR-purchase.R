# Logistic Regression : Predict Purchase
# Financial Analytics Case Study

# Import the dataset
dataset = read.csv('./data/logr2.csv')

str(dataset)
View(dataset)

# Split the dataset into the Training set and Test set
#install.packages('caTools')
library(caTools)
set.seed(2000)
split = sample.split(dataset$purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
class(dataset$gender)
names(training_set)

# Fitting Logistic Regression to the Training set
logitmodel1 = glm(purchased ~ gender + age + salary, family = binomial,  data = training_set)
summary(logitmodel1)

# Fitting Logistic Regression to the Training set - being insignificant is dropped here
logitmodel2 = glm(purchased ~ age + salary, family = binomial, data = training_set)

summary(logitmodel2)
summary(logitmodel2)$coefficient

test_set2 = data.frame(age=c(40,65), salary=c(40000, 50000))
# Predicting the Test set results from testset
test_set
prob_pred = predict(logitmodel2, type = 'response', newdata = test_set)
df_prob_pred = as.data.frame(prob_pred)
summary(df_prob_pred)
head(df_prob_pred)

y_pred = ifelse(prob_pred > 0.5, 1, 0)
y_pred

# Making the Confusion Matrix
cm = table(test_set[,5], y_pred)
cm
caret::confusionMatrix(cm)



