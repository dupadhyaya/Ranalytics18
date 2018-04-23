# data strucutres 

#Vectors----
v1 = c(1,2,3,4,5,4)
class(v1)
v1
v1[v1==4]=7
v1
?class
v2= c('A','B','C','D','e')
v2
class(v2)
v3 =c(TRUE,FALSE,T,F)
class(v3)
v2[3]
v3[4]
v4= c(1,2, 'A')
v4
v5 = c(T,2,F,'A')
v5
class(v4)
v6=c('A', 2,'B')
v6
v1
set.seed(100)
v7 = rnorm(100, mean=60, sd=15)
v7
mean(v7)
sd(v7)
?rnorm
hist(v7)
hist(v7, breaks=15, col=1:15)
hist(v7,freq=F, col='yellow', main='Pune Univ', sub='MBA' , xlab='Marks', ylab='Density of Counts', xlim=c(0, 100), ylim=c(0,0.03))
lines(density(v7), col='red', lty=4, lwd=3)

#title(main=' Pune University', sub='MBA')

#Matrix----
length(100:123)
(m1 =matrix(100:123, ncol=6, byrow = T))
(m2 =matrix(c(100:123), ncol=4, byrow = T))
m2[1 , ]
m2[ , 2]
m2[1:2 , ]
m2
m2[, c(1,4)]
m2[c(2,6), c(1,4)] # 2 & 6th row, 1st & 4th col
m2[2:6, 1:4]
colSums(m2)
colMeans(m2)
rowSums(m2)
rowMeans(m2)
mean(m2[,2])

#x



#Array----
length(100:123)
4*3*2
(a1 = array(100:123, dim=c(4,3,2)))
?array
(loc = paste('loc', 1:4,sep='-'))
(product = paste('p', 1:3,sep='@'))
(coy = paste('coy', 1:2,sep='%'))
dimnames(a1) = list(loc, product, coy)
a1
apply(a1,1, sum)
apply(a1,2, sum)
apply(a1,c(1,2), sum)
apply(a1,c(2,3), sum)
apply(a1,c(1,3), sum)

apply(a1,3, sum)
sum(a1)

#Data Frame----
(rollno = 1:30)
(sname = paste('student',1:30,sep=''))
(gender = sample(c('M','F'), size=30, replace=T, prob=c(.7,.3)))
(marks = floor(rnorm(30, 50,10)))
(marks2 = ceiling(rnorm(30,40,5)))
(course = sample(c('BBA','MBA'), size=30, replace=T, prob=c(.5,.5)))

df1= data.frame(rollno, sname, gender, marks, marks2, course)
head(df1,n=3)
head(df1,3)
?head
tail(df1)
str(df1)
class(df1)
summary(df1)
df1
df1$gender
df1$marks
df1[ , c(2,4)]
df1[1:10 ,]
df1[ marks > 50 & gender=='F', c('rollno', 'sname')]
df1[ marks > 50 & gender=='F', c(1,2)]
df1[ marks > 50 | gender=='F', ]
names(df1)  # names of columns
dim(df1)  #Dimensions

aggregate(df1$marks, by=list(df1$gender), FUN=max)
df2 = aggregate(cbind(marks,marks2) ~ gender + course, data=df1, FUN=max)
df2
pie(x=df2$marks)
barplot(df2$marks, col=1:2)
?aggregate

#using dplyr package
library(dplyr)


#


#List----

#Factors----

(grades = sample(c('A','B','C','D'), size=30, replace=T, prob=c(.3,.2,.4,.1)))
table(grades)
class(grades)
gradesF = factor(grades)
grades
gradesF
gradesF1 = factor(grades, ordered=T)
gradesF1
gradesF2 = factor(grades, ordered=T, levels=c('D','C','B','A'))
gradesF2
x = 1:4
sort(x)
rev(x)




?list
(v1 = 1:30)
(m1 = matrix(1:24, nrow=6))
(a1 = array(1:24, dim=c(4,3,2)))
(df1 = data.frame(rollno=c(1:5), sname=c(paste('S',1:5, sep='-'))))
class(v1); class(m1); class(a1); class(df1)
L1 = list(v1, m1, a1, df1)  # List
L1
L1[1]; L1[2] ; L1[3]; L1[4]
(v2 = c('a','b'))
L2 = list(v2, L1)
L2

