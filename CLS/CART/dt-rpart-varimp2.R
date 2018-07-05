# Decision Tree - Variable Importance - rpart

library(rpart)
library(rpart.plot)
library(caret)

#Case-3----
#Create Dataset
set.seed(1234)
gender = sample(x= c('Male','Female'), size=30, replace=T, prob=c(0.7,0.3) )
table(gender)
set.seed(1234)
married = sample(x= c('Married','Single'), size=30, replace=T, prob=c(0.2,0.8) )
table(married)

set.seed(1111)
play = sample(x= c('Play','NotPlay'), size=30, replace=T, prob=c(20/30,10/30) )
table(play)
set.seed(1234)
education = sample(x=c('school','graduate', 'pg'), size=30, replace=T, prob=c(0.3,0.4,.3) )
table(education)
set.seed(1234)
hostel = sample(x=c(TRUE, FALSE), size=30, replace=T, prob=c(.3,.7))
table(hostel)

set.seed(1234)
marks = floor(rnorm(30,70,20))
mean(marks)

students3 = data.frame(gender, married, education, hostel, marks,play)
with(students3, ftable(education, hostel, gender, married,play))
set.seed(1234)
fit3 = rpart(play ~ . , data=students3, minsplit=5, cp=-1)
fit3
varImp(fit3) #at root level 
summary(fit3)
rpart.plot(fit3)

#Split DF - daply & split, subset
library(plyr)
x <- daply(df, .(splitting_variable), function(x)return(x))

(split1 = split(students3, marks >=76.5))
split1$'FALSE'
s3Left = as.data.frame(split1$'FALSE')
s3Right = as.data.frame(split1$'TRUE')
#left node
fitL2 = rpart(play ~ ., data = s3Left, minsplit=5, cp=-1)
fitL2
rpart.plot(fitL2)
varImp(fitL2) # other variable are not important
printcp(fitL2)

fitL2b = rpart(play ~ ., data = s3Left, minsplit=5, cp=.1)
fitL2b
varImp(fitL2b) # other variable are not important
rpart.plot(fitL2b)



#Case-4----
#Create Dataset V is numeric CV
set.seed(1234)
gender = sample(x= c('Male','Female'), size=30, replace=T, prob=c(0.4,0.6) )
table(gender)
set.seed(1234)
married = sample(x= c('Married','Single'), size=30, replace=T, prob=c(0.3,0.7) )
table(married)

set.seed(1234)
play = sample(x= c('Play','NotPlay'), size=30, replace=T, prob=c(10/30,25/30) )
table(play)

set.seed(1234)
income = ceiling(runif(30, 50,100) )
mean(income)

students4 = data.frame(income,gender, married, play)
rownames(students4) = rollno
head(students4)
str(students4)

#Model4
fit4 = rpart(income ~ gender + married + play, data=students4, minsplit=5, cp=-1, method='anova')
fit4
rpart.plot(fit4)