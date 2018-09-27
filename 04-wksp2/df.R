#data frame

#rollno, name, batch, gender, marks1, marks2

(rollno = 1:30)
(name = paste('student',1:30,sep='-'))
(batch = sample(c(2016, 2017,2018), size=30, replace=T))
table(batch)
(gender = sample(c('M', 'F'), size=30, replace=T))
table(gender)
(marks1 = rnorm(30, mean=65, sd=7))
(marks2 = rnorm(30, mean=60, sd=10))

df = data.frame(rollno, name, batch, gender, marks1, marks2, stringsAsFactors = F)
df
summary(df)
str(df)
df$gender = factor(df$gender)
str(df)
df$batch = factor(df$batch, ordered=T, levels=c('2016','2017','2018'))
str(df)
df

summary(df)

df$rollno = as.character(df$rollno)
summary(df)

str(df)  #structure
head(df)  #first 6 rows
tail(df)
head(df, n=2)
dim(df)
nrow(df)  #no of rows
ncol(df)  #no of cols
names(df)  #names of cols
df[1:2,1:4]
df[ c(1,3), c(1,4,5,6)]
df[ df$gender=='M', 3:5 ]  # Males ; Display 3 to 5 th col
df[ df$gender=='M' & df$marks1 > 70, 3:5 ]  # Males ; Display 3 to 5 th col

length(df)
nrow(df[df$gender=='M',])

#sort
sort(df$marks1)
order(df$marks1)
df$marks1
df[ order(df$marks1), ]
sort(df$marks1)
rev(sort(df$marks1))
df[order(gender, batch), ]
df[order(gender, - batch), ]


#summary/ aggregating
aggregate(df$marks1, by=list(df$batch), FUN=mean)
aggregate(marks1 ~ batch, data=df, FUN=mean)
aggregate(cbind(marks1, marks2) ~ batch, data=df, FUN=mean)
aggregate(cbind(marks1, marks2) ~ batch + gender, data=df, FUN=mean)
df2=aggregate(cbind(marks1, marks2) ~ batch + gender, data=df, FUN=mean)
df2

aggregate(cbind(marks1, marks2) ~ batch + gender, data=df, FUN=max)


df
write.csv(df, "./data/bitsgoa.csv")

df3 = read.csv("./data/bitsgoa.csv")
head(df3)
df3 = df3[,-1]
head(df3)
