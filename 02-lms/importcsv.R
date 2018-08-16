#import from csv

df1 = read.csv('pdpu.csv')
df1
head(df1)
names(df1)
#avg marks gender wise
aggregate(cbind(df1$marks1,df1$marks2), by=list(df1$gender), FUN=mean)
t1=table(df1$gender)
table(df1$batch)
barplot(table(df1$gender), col=1:2)
barplot(t1, col=c('red','green'))
pie(t1)


write.csv(df1,'pdpu2.csv')
write.csv(t1,'pdpu3.csv')


mtcars
str(mtcars)
df2 = mtcars
df3=rbind(df2,mtcars)
dim(df3)
