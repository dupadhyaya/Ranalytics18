# Data Frames
#data frame
#(rollno= c('MBA-01', 'MBA-02'))
(rollno= paste('MBA',1:60,sep='-'))

#(name = c('Student1', 'Student2'))
(name= paste('Student',1:60,sep='-'))

set.seed(1234)
(gender = sample(c('M','F'),size=60, replace=T, prob=c(.4, .6)))
table(gender)
prop.table(table(gender))

(marks = rnorm(60, mean=60, sd=15))
x = c(23.3, 34.742)
floor(x); ceiling(x); trunc(x); round(x,1)
floor(marks)
(grades= sample(c('Excellent','Good','Poor'), size=60, replace = T, prob=c(.2, .3, .5)))
table(grades)
grades = factor(grades, levels=c('Poor','Good','Excellent'), ordered=T)
grades
summary(grades)


df = data.frame(rollno, name, gender,marks, grades, stringsAsFactors = F)
df
head(df, n=3); tail(df)
str(df)
summary(df)
df$gender =factor(df$gender)
str(df)
summary(df)
dim(df)
class(df)

aggregate(df$marks, by=list(df$gender), FUN=sum)
aggregate(df$marks, by=list(df$gender), FUN=mean)
aggregate(marks ~ gender, data=df, FUN=mean)
aggregate(marks ~ gender + grades, data=df, FUN=mean)

df$marks2 = runif(60,50,100)
head(df)

aggregate(cbind(marks, marks2) ~ gender , data=df, FUN=mean)


df
df[ df$gender=='M',]
df[ df$gender=='M', c(1,2,4)]
df[ df$gender=='M', c('rollno', 'gender')]