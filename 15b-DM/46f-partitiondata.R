# Data Set Partition

#random basis

df = mtcars
nrow(df)

sample(x=1:32, size=10, replace=F)
sample(x=32, size=10, replace=F)

indexnos = sample(x=1:32, size=10, replace=F)
train1= df[indexnos,]

#other indexnos
test1 = df[-indexnos]
train1 
test1

#----
## 75% of the sample size
smp_size <- floor(0.75 * nrow(df))

## set the seed to make your partition reproducible
set.seed(123)
seq_len(nrow(df))  #generate a seq of number upto no of rows
indexnos = sample(seq_len(nrow(df)), size = smp_size)

train2 = df[indexnos, ]
test2 = df[-indexnos, ]
train2
test2

#Using Package
require(caTools)
set.seed(121) 
#sample.split  - preserves relative ratios in each set
gender = sample(c('M','F'), size=100, replace=T, prob=c(.6,.4))
marks = floor(rnorm(100,mean=50,sd=10))
students = data.frame(gender, marks)
table(students$gender)
prop.table(table(students$gender))

samples = sample.split(students$gender, SplitRatio = 0.75)
table(samples)
set1 = subset(students, samples == TRUE)
table(tra$gender)
prop.table(table(set1$gender))

set2 = subset(students, samples == FALSE)
prop.table(table(set2$gender))

#proportion is almost same


#Method
library(caret)
table(df$am)
prop.table(table(df$am))
?createDataPartition
trainnos = createDataPartition(y=df$am , p=0.7,list=FALSE)
trainnos
train4 = df[trainnos,]
test4 =  df[-trainnos,]
train4
test4
prop.table(table(train4$am))
prop.table(table(test4$am))



library(dplyr)
set.seed(275) #to get repeatable data

data.train <- sample_frac(Default, 0.7)

train_index <- as.numeric(rownames(data.train))
data.test <- Default[-train.index, ]
