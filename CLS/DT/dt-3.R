# Simple Example in CT

train1 = data.frame(rollno=c(1,2,3), gender=c('M','M','F'),
                    play=c('Play','NoPlay','Play'))
train1

library(rpart)
?rpart
mytree1 = rpart (play ~ gender, data=train1, method='class')
mytree1

#more data
train2 = data.frame(rollno=c(1,2,3,4), gender=c('M','M','F','F'), 
                    play=c('Play','NoPlay','Play','Play'))
rpart (play ~ gender, data=train2, method='class')
rpart (play ~ gender, data=train2, method='class',
       minsplit=1, minbucket=1)
train2

# Part -2 
train3 = data.frame(rollno=c(1,2,3,4,5,6,7), 
      gender=c('M','M','F','M','F','F','M'),
      play=c('Play','Play','NoPlay','Play','Play','NoPlay','Play'))
mytree3 = rpart (play ~ gender, data=train3, method='class',
        minsplit=2, minbucket=1 )
#method - class uses gini index
mytree3
train3
table(train3$gender,train3$play)
library(rattle)
library(rpart.plot)
library(RColorBrewer)
fancyRpartPlot(mytree3)
predict(mytree3, newdata=data.frame(gender='M'))


# Another method to do 
mytree3a = rpart (play ~ gender, data=train3, method='class',
                 minsplit=2, minbucket=1 )
fancyRpartPlot(mytree3a)

#cp usage
mytree4 = rpart (play ~ gender, data=train3, method='class',
            minsplit=2, minbucket=1, cp=-1 )
mytree4
fancyRpartPlot(mytree4)

# first DF
mytree1b = rpart (play ~ gender, data=train1, method='class',
                 minsplit=2, minbucket=1, cp=-1 )
mytree1b

# Add more columsn to train3
train3$married = c('Married','Single','Married',
            'Married','Married','Single','Single')
train3
mytree4b = rpart (play ~ gender + married, data=train3,
        method='class', minsplit=2, minbucket=1)
fancyRpartPlot(mytree4b)

mytree4b = rpart (play ~ gender + married, data=train3,
          method='class', minsplit=2, minbucket=1, cp=-1 )
mytree4b
fancyRpartPlot(mytree4b)
table(train3$play, train3$gender)
mytree4b$where
train3
# Giving Weights
mytree4c = rpart (play ~ gender + married, data=train3, method='class',
                  minsplit=2, minbucket=1)
fancyRpartPlot(mytree4c)
mytree4c = rpart (play ~ gender, data=train3, method='class',
        weights=c(.3,.1,.1,.1,.1,.1,.2),  minsplit=2, minbucket=1)
fancyRpartPlot(mytree4c)

predict(mytree4b, newdata=data.frame(gender='M',
                  married='Single'))
printcp(mytree4b)
