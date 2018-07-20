#CHAID1

### fit tree to
###  subsample
USvote
library(CHAID)
set.seed(290875)
data(USvote)
attach(USvote)
?USvote
head(USvote)
str(USvote)
names(USvote)
summary(USvote)
dim(USvote)
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
ctrl1 <- chaid_control(minsplit = 100, minbucket = 10, minprob = 0.001)
ctrl2 <- chaid_control(minprob=.002,maxheight = 4, minsplit=2000, minbucket=700)
#parameters - minsplit, minbucket, minprob,  
ctrl2  #see the control values
chaidModel_1 <- chaid(vote3 ~ ., data = train, control = ctrl2)

#summary(chaidModel_1)
print(chaidModel_1)
plot(chaidModel_1)
plot(chaidUS1, type='simple')
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
p1 = predict(chaidModel_1)
head(p1)
sum(complete.cases(train))# there are some missing values
sum(!complete.cases(train))# there are some missing values

length(p1); length(train$vote3)


#Confusion Matrix
library(caret)
confusionMatrix(p1, train[complete.cases(train),]$vote3)


# aggregation
unique(USvote$vote3)
plyr::count(USvote, c('gender','vote3'))
plyr::count(USvote, c('marstat','vote3'))
(t1=ftable(USvote$vote3, USvote$gender))
(t2=ftable(USvote$vote3, USvote$marstat))
prop.table(t2)
(t3=ftable(USvote$vote3, USvote$educr))
prop.table(t3)
(t4=ftable(USvote$vote3, USvote$ager))

chisq.test(t1)
chisq.test(t2)
chisq.test(t3)
chisq.test(t4)


chisq.test(t3)

#https://select-statistics.co.uk/blog/chaid-chi-square-automatic-interaction-detector/
  

#selecting the best variable
names(USvote)
dplyr::count(USvote, vote3 , gender)
library(dplyr)
USvote %>% count(vote3, gender)
USvote %>% group_by(vote3, gender) %>%  summarise(number = n())
USvote %>% group_by(vote3, gender) %>%  tally()


(t1=ftable(USvote$vote3, USvote$gender))
(t2=ftable(USvote$vote3, USvote$ager))
(t3=ftable(USvote$vote3, USvote$empstat))
(t4=ftable(USvote$vote3, USvote$educr))
(t4=ftable(USvote$vote3, USvote$marstat))
chisq.test(t1)

library(EnQuireR)
data(tea)
chisq.desc(tea,c(1,2),c(3,4))

chisq.desc(tea,c(1,2),c(3,4),report=TRUE)