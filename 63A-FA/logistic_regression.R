# Logistic Regression
# Import the dataset

setwd("E:\\HHges - Mkt Anyts\\BITS Pilani Bussiness Anallytics\\04.Logistic Regression")

dataset = read.csv('Customer Churn.csv')
summary(dataset)
# Split the dataset into the Training set and Test set

#install.packages('caTools')
library(caTools)


set.seed(2000)
#Split data from vector Y into two sets in predefined ratio 
#while preserving relative ratios of different labels in Y. 
#Used to split the data used during classification into train and test subsets
split = sample.split(dataset$Churn, SplitRatio = 0.75)
tail(dataset)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)





names(training_set)

# Fitting Logistic Regression to the Training set
classifier = glm(formula = Churn ~
                   as.factor(Gender)+
                   Age+
                   EstimatedSalary,
                 family = binomial,
                 data = training_set)

summary(classifier)

# Fitting Logistic Regression to the Training set - Gender is being insignificant is dropped here
classifier = glm(formula = Churn ~ Age+EstimatedSalary,
                 family = binomial,
                 data = training_set)

summary(classifier)$coefficient

# Predicting the Test set results 
# type=reponse is used to give predicted probibilites
prob_pred = predict(classifier, type = 'response', 
                    newdata = test_set)

df_prob_pred = as.data.frame(prob_pred)
head(df_prob_pred)

y_pred = ifelse(prob_pred > 0.5, 1, 0)
y_pred

# Making the Confusion Matrix
cm = table(test_set[,5], y_pred)
cm

forecast::accuracy(test_set[,5], y_pred)
forecast::con