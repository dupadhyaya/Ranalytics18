# Logistic Regression
data()  # datasets available for use in R

# Load the textbook R package
library(ISLR)
?Default   # data set
# Load in the credit data
data("Default")
str(Default)
class(Default)
head(Default)
names(Default)
balance
attach(Default)
balance
str(Default)
Default
dim(Default)
#write.csv(Default,'./data/cclogr.csv')
#Data Structures

head(Default)
str(Default)
summary(Default)

names(Default)
# How many people actual default?
tmp = table(default)
tmp
333/9667

(tmp[[2]]/tmp[[1]])*100
tmp[[2]]/dim(Default)[1] * 100

#Plot
library(ggplot2); library(gridExtra)
## Loading required package: grid
x = qplot(x=balance, y=income, color=default, shape=default, geom='point')+scale_shape(solid=FALSE)
y = qplot(x=default, y=balance, fill=default, geom='boxplot')+guides(fill=FALSE)
z = qplot(x=default, y=income, fill=default, geom='boxplot')+guides(fill=FALSE)
# Plot
x
grid.arrange(y, z, nrow=1)

#Model
logitb = glm(default ~ balance, data=Default, family='binomial')
summary(logitb)
coef(logitb)

exp(coef(logitb))
range(Default$balance)
b1= logitb$coefficients[2]
exp(b1)^1  # due to 1 unit increase in balance 
exp(b1)^100  # due to 100 unit increase in balance
exp(b1)^1000  # due to 1000 unit increase in balance


exp(confint(logitb))

#Assessing impact of predictors on Probability of Outcome

# Create test data between the range
predict(logit, newdata = data.frame(balance=c(0,100,500,1000,1500,1800,2500)), type=c('response'))

head(Default)

top_n(Default, 5, balance)
Default %>% arrange(balance) %>% slice(1:5)
#top_n(Default, 5, desc(balance))
Default %>% arrange(balance) %>% slice(seq(1,n(),1000))

#student
str(Default)
logits = glm(default ~ student, data=Default, family='binomial')
summary(logits)


# Create a new dummy variable for students
#Default$studentD <- 0  # put all zeros
#Default$studentD[Default$student=="Yes"] <- 1  # replace 0 wherever yes is there
#head(Default)

#logit <- glm(default ~ studentD, data=Default, family='binomial')
#summary(logit)
#predict(logit, newdata = data.frame(studentD=c(0)), type=c('response'))
#predict(logit, newdata = data.frame(studentD=c(1)), type=c('response'))


logits <- glm(default ~ student, data=Default, family='binomial')
summary(logits)
predict(logits, newdata = data.frame(student=c('Yes')), type=c('response'))
predict(logits, newdata = data.frame(student=c('No')), type=c('response'))


class(Default)
#Multiple Logistic Regression
logit1 = glm(default ~ income + balance + student, family='binomial', data=Default)
summary(logit1)
exp(coef(logit1))

logit2 = glm(default ~ balance + student, family='binomial', data=Default)
summary(logit2)
exp(coef(logit2))


Default %>% group_by(student) %>% arrange(student, balance) 



# Predict
head(Default)
#ndata2 = data.frame(balance=c(700), student=c('Yes'))
#ndata2
#predict(logit2, newdata=ndata2, predict='response')
seq(1, 10000,500)
Default[c(1,501),]
Default[seq(1, 10000,500),]

library(dplyr)
(ndata = (slice(Default, seq(1,n(),500))))
ndata
slice(Default, seq(1,n(),1000))
head(ndata)
addmargins(prop.table(table(Default$default,Default$student)))
0.2817/0.9667; 0.0127/0.0333
options(digits=10)

fitted.results = predict(logit2, newdata=ndata,type='response')
fitted.results
head(fitted.results)
fitted.results
cbind(ndata, fitted.results)
ndata
ndata %>% mutate(predict = ifelse(fitted.results < 0.5, 'No','Yes'))

fitted.results
ifelse(fitted.results < 0.05, 0,1)


(ndata2 = data.frame(student=c('Yes','No'), balance=mean(Default$balance), income=mean(Default$income)))
(fitted.results2 <- predict(logit, newdata=ndata2,type='response'))



#Accuracy of Model
library(caret)
set.seed(3456)
str(Default)
trainIndex <- createDataPartition(Default$default, p = .67,
        list = FALSE,   times = 1)

Train <- Default[ trainIndex,]
Test  <- Default[-trainIndex,]
head(Train)
head(Test)

# Logistic Regression Model
model = glm(default ~ student, data=Default, family='binomial')
Test$model_prob <- predict(model, Test, type = "response")
head(Test)
Test <- Test  %>% mutate(default_pred = ifelse(model_prob > .5,'Yes','No'))
head(Test)
Test <- Test %>% mutate(accurate = 1*(default == default_pred))
sum(Test$accurate)/nrow(Test)                         
#96% Accuracy

?createDataPartition




Default
head(Default)
logr1 = glm(default ~ student + balance + income, data=Default, family='binomial')
summary(logr1)
logr2 = glm(default ~ student + balance , data=Default, family='binomial')
summary(logr2)
ndata3 = Default[seq(1,nrow(Default), 1000), ]
ndata3
(p1 = predict(logr2, newdata = ndata3, type='response'))
cbind(ndata3, p1, p2= ifelse(p1 < 0.5, 'No', 'Yes'))
