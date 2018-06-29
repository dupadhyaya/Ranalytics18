# data into train and test set

#Case-1---
df = mtcars
dim(df)  # 32 11

#Sample Indexes
set.seed(1234)
indexes = sample(1:nrow(df), size=0.2*nrow(df))
# Split data
test = df[indexes,]
dim(test)  # 6 11
train = df[-indexes,]
dim(train) # 26 11

#Case-2----
## 75% of the sample size
(smp_size <- floor(0.75 * nrow(df)))

## set the seed to make your partition reproducible
set.seed(1234)
train_ind <- sample(seq_len(nrow(df)), size = smp_size)

train <- df[train_ind, ]
test <- df[-train_ind, ]
train
test

#Case-3---
require(caTools)
set.seed(1234) 
sample = sample.split(df$mpg, SplitRatio = .75)
train3 = subset(df, sample == TRUE)
test3  = subset(df, sample == FALSE)
dim(train3)
dim(test3)

#Case-4----
bound <- floor((nrow(df)/4)*3)         #define % of training and test set

df <- df[sample(nrow(df)), ]           #sample rows 
df.train4 <- df[1:bound, ]              #get training set
df.test4 <- df[(bound+1):nrow(df), ]    #get test set
dim(df.train4)
dim(df.test4)

#Case-5----
library(dplyr)
df5 = df
rownames(df5) = NULL  #as they were numeric
head(df5)
train5 <-sample_frac(df5, 0.7)
sid <- as.numeric(rownames(train5)) 
sid
test5 <- df5[-sid,]
dim(train5); dim(test5)

#Case-6----
df6 = df
df6$id <- 1:nrow(df6)  # create id var
train6 <- df6 %>% dplyr::sample_frac(.75)
test6  <- dplyr::anti_join(df6, train, by = 'id')
dim(train6); dim(test6)

#Case-7 ----
set.seed(1234)
split7=sample.split(df$mpg,SplitRatio=2/3)
set.seed(1234)
split7a=sample.split(df,SplitRatio=2/3)
split7a
train7=subset(df,split7==TRUE)
test7=subset(df,split7==FALSE)
dim(train7); dim(test7)
train7a=subset(df,split7a==TRUE)
test7a=subset(df,split7a==FALSE)
dim(train7a); dim(test7a)




library(ISLR)
df = Default
names(df)

library(dplyr)
df <- data.frame(x = c(NA, "a.b", "a.d", "b.c"))
df %>% separate(x, c("A", "B"))