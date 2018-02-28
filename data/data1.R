# Importing and Sorting Data
train = read.csv('data/train.csv')
test = read.csv('data/test.csv')
str(train) # has purchase coln extra
str(test)
summary(train)
summary(test)
head(train)
head(train)
y_train = train$Purchase
x_train = train$Occupation
x_test = test$Occupation

