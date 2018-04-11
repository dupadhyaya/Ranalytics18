# Logistic Regression

# Load the textbook R package
library(ISLR)
?Default
# Load in the credit data
#Check the structure of Data
#Data Structures
#
head(Default)
str(Default)
summary(Default)

names(Default)
# How many people actual default?

#Plot
Default$default

plot(Default$balance, Default$income, col=Default$default)
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


# Create a new dummy variable for students
#Default$studentD <- 0  # put all zeros
#Default$studentD[Default$student=="Yes"] <- 1  # replace 0 wherever yes is there
#Multiple Logistic Regression
logit = glm(default ~ income + balance + student, family='binomial', data=Default)
summary(logit2)
exp(coef(logit2))

logit2 = glm(default ~ balance + student, family='binomial', data=Default)
summary(logit)
exp(coef(logit))


Default %>% group_by(student) %>% arrange(student, balance) 



# Predict
head(Default)
ndata2 = data.frame(income=c(40000), balance=c(700), student=c('Yes'))
predict(logit, newdata=ndata2, predict='response')

(ndata = (slice(Default, seq(1,n(),500))))

slice(Default, seq(1,n(),1000))
head(ndata)
addmargins(prop.table(table(Default$default,Default$student)))
0.2817/0.9667; 0.0127/0.0333
options(digits=10)

fitted.results = predict(logit, newdata=ndata,type='response')

fitted.results
cbind(ndata, fitted.results)
ndata
ndata %>% mutate(predict = ifelse(fitted.results < 0.5, 0,1))

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
