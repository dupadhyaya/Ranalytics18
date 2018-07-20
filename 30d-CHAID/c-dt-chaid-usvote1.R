#CHAID - dataset USvote
#multisplit
# require(rsample) # for dataset and splitting also loads broom and tidyr
require(dplyr);require(ggplot2);theme_set(theme_bw()) ;require(CHAID); require(purrr) ; require(caret)
#install.packages("CHAID", repos="http://R-Forge.R-project.org")
library(CHAID)  #library for performing CHAID decision tree
#Dataset
data(USvote)
?USvote


head(USvote)
str(USvote)
names(USvote)
summary(USvote)
dim(USvote)

#Quick CHAID analysis
set.seed(101)
sample1 = USvote[sample(1:nrow(USvote), 1000),]
chaidModel <- chaid(vote3 ~ ., data = sample1, control=chaid_control(minbucket = 20, minsplit=7, minprob=0))
print(chaidModel)
plot(chaidModel)


#Train and Test Set
require(caTools)
set.seed(101) 
sample = sample.split(USvote$vote3, SplitRatio = .75)
train = subset(USvote, sample == TRUE)
test  = subset(USvote, sample == FALSE)
dim(train); dim(test)

#control Parameters
ctrl <- chaid_control(minsplit = 100, minbucket = 10, minprob = 0.001)
ctrl_1 <- chaid_control(minprob=.002, maxheight = 4, minsplit=2000, minbucket=700)
#parameters - minsplit, minbucket, minprob,  
ctrl_1  #see the control values
chaidModel_1 <- chaid(vote3 ~ ., data = train, control = ctrl_1)

#summary(chaidModel_1)
print(chaidModel_1)
plot(chaidModel_1)
plot(chaidModel_1, type='simple')

#Variable Selection
chisq.test(train$vote3, train$marstat)  #least
#this is why 1st split happens on marstat
chisq.test(train$vote3, train$ager)
chisq.test(train$vote3, train$empstat)


#Plots
plot(chaidModel_1,main = "Testing Graphical Options",
     gp = gpar(fontsize = 8),  type = "simple")

plot(chaidModel_1,  main = "Testing More Graphical Options",
     gp = gpar(col = "blue",  lty = "solid",   lwd = 3,  fontsize = 10
     )
)


#Predict
p1a = predict(chaidModel_1, type='response')
head(p1a)
#“response”, “prob”, “quantile”, “density”, “node”
p1b = predict(chaidModel_1, type='prob')
head(p1b)
p1c = predict(chaidModel_1, type='node')
head(p1c)
#quantile & density for numeric responses




sum(complete.cases(train))# there are some missing values
sum(!complete.cases(train))# there are some missing values

length(p1a); length(train$vote3)


#Confusion Matrix
library(caret)
confusionMatrix(p1a, train[complete.cases(train),]$vote3)


#Now change different parameters of chaid and predict accuracy
#Select best model
ctrl_2 <- chaid_control(minprob=.01, minsplit=1000)
#parameters - minsplit, minbucket, minprob,  
ctrl_2  #see the control values
chaidModel_2 <- chaid(vote3 ~ ., data = train, control = ctrl_2)
p2a = predict(chaidModel_2, type='response')
confusionMatrix(p2a, train[complete.cases(train),]$vote3)
#

#Compare models and select with higher accuracy


