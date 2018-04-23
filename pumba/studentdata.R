
(rollno = paste('S',1:30, sep='-'))
#sname = c('S1', 'S2', 'S3')
(sname = paste0('Student',1:30,'- ', 'xyz'))
(gender = sample(c('M','F'), size=30, replace=T, prob=c(.6, .4)))
table(gender)
(age = floor(runif(30, 21, 50)))
(course = sample(c('BTech','MTech','Phd'), size=30, replace=T, prob=c(.5, .3, .2)))
table(course)
pie(table(course))
barplot(table(course))
(marks = round(rnorm(30, 60, 5)))
boxplot(marks)
hist(marks, freq=F)
lines(density(marks))
(married = sample(c(TRUE, FALSE), replace=T, size=30, prob=c(.1,.9)))
table(married)
df = data.frame(rollno, sname, age, course, gender, marks, married)
df

#str, dim, class, summary
str(df)
#filter
df$rollno
df$sname
df[,c(1,2)]


#export to csv
write.csv(df, './data/pumba.csv', row.names = F)



