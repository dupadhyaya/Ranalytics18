
#vector

#ND with mean 80 , sd 10, 100 values

sales = rnorm(10000000, mean=80, sd=10 )
sales              
#trunc, round, floor, ceiling
sales = trunc(sales)
sales
summary(sales)
boxplot(sales)
mean(sales)
median(sales)
hist(sales)
plot(density(sales))
#10-50
range(sales)
#matrix
m1 = matrix(100:123, ncol=2)
m1
colSums(m1)
colMeans(m1)
m1[,1]
colnames(m1) =c('A','B')
head(m1)
tail(m1)

#DF
(sname = paste('Student', 1:30,sep='_'))
(marks = trunc(runif(n=30, max=90, min=50)))
runif(30)
(gender = sample(c('M','F'), replace=T, size=30, prob=c(.7,.3)))
?runif
df1 = data.frame(sname, marks, gender)
head(df1)

library(dplyr)
df1 %>% group_by(gender) %>% summarise(mean(marks), n(), min(marks), max(marks))
#name, marks (descending order); no gender
names(df1)
str(df1)
summary(df1)

df1[(order(df1$marks, decreasing = T)), c('sname', 'marks')]
df1[(order(df1$marks, decreasing = T)), -3]
#use dplyr
df1 %>% select(sname, marks )  %>% arrange(desc(marks))
names(df1)
df1[sample(1:30, size=5),2] = NA
#5 missing values on random location in marks column 
sum(complete.cases(df1))
sum(!complete.cases(df1))

df1[!complete.cases(df1),2] = mean(df1$marks, na.rm=T)
mean(df1$marks, na.rm=T)
df2 = df1[complete.cases(df1), ]
sum(is.na(df1))
sum(is.na(df2))

sample(1:30, size=5)
df1
df1 %>% sample_n(3)
df1 %>% sample_frac(.3)

# Linear Regression

# Logistic Regression

# 
df = read.csv(file.choose())
head(df)
