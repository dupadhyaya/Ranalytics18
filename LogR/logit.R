# Logistic Regression
#https://www.youtube.com/watch?v=AVx7Wc1CQ7Y

# Read data file
mydata <- read.csv(file.choose(), header = T)
str(mydata)
mydata$admit <- as.factor(mydata$admit)
mydata$rank <- as.factor(mydata$rank)

# Two-way table of factor variables
xtabs(~admit + rank, data = mydata)

# Partition data - train (80%) & test (20%)
set.seed(1234)
dim(mydata)
ind = sample(2, nrow(mydata), replace = T, prob = c(0.8, 0.2))
ind
?sample
(train = mydata[ind==1,])
(test = mydata[ind==2,])
dim(train)
dim(test)
# Logistic regression model
mymodel <- glm(admit ~ gpa + rank, data = train, family = 'binomial')
summary(mymodel)

# Prediction
p1 <- predict(mymodel, train, type = 'response')
head(p1)
head(train)

# Misclassification error - train data
pred1 <- ifelse(p1>0.5, 1, 0)
tab1 <- table(Predicted = pred1, Actual = train$admit)
tab1
1 - sum(diag(tab1))/sum(tab1)

# Misclassification error - test data
p2 <- predict(mymodel, test, type = 'response')
pred2 <- ifelse(p2>0.5, 1, 0)
tab2 <- table(Predicted = pred2, Actual = test$admit)
tab2
1 - sum(diag(tab2))/sum(tab2)

# Goodness-of-fit test
with(mymodel, pchisq(null.deviance - deviance, df.null-df.residual, lower.tail = F))
