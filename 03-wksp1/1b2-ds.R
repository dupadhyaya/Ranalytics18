# Data Structures in R

#control+enter when you are in the line to execute
# Vectors-----
c(2,4,6)
seq(2,3,.5)
seq(by=.5, from=2,to=3)
rep(1:3,times=4)
rep(c(3,6,7,2),each=4)
rep(c(3,6,7,2), times=4)

?rep

x=1:10   #create seq of nos from 1 to 10
x
(x1 <- 1:20)

(x1=1:30)
(x2=c(1,2,13,4,5))
class(x2)

(x3=c('a',"ABC"))
class(x3)
(x3=letters[1:10])
class(x3)
LETTERS[1:26]
(x3b = c('a',"Henry",4))
class(x3b)

(x4=c(T,FALSE,TRUE,T,F))
class(x4)
class(c(3,5))
x5a = c(3,5.5)
class(x5a)
as.integer(x5a)

x5=c(3L,5L)
class(x5)
x5a = c(3,5)
class(x5a)
(x5b = c(1, 'a',T, 4L))
class(x5b)
#blank variable ?

#access elements
?seq
(x6 = seq(0,100,by=3))
seq(0,100,3)
seq(to=100,from=0,by=3)
seq(1,5,2)
?seq
#[1]  0  2  4  6  8 10
ls()  #variables in my environment
x6
length(x6)
x6[1:5]
x6[10:20]
x6[ seq(1,length(x6), 2)]
x6[3]  # access 3rd element
#[1] 4
x6[c(2, 4)]     # access 2nd and 4th element
x6[-1]          # access all but 1st element
x6[-c(1:10, 15:20)]
x6[c(2, -4)]    # cannot mix positive and negative integers
#Error in x[c(2, -4)] : only 0's may be mixed with negative subscripts
x6[c(2.4, 3.54)]    # real numbers are truncated to integers
x6[c(2,3)]

x6[-c(1,5,20)]
x6
x6[x6 > 30]

x6[x6 > 30 & x6 < 40]  # 31-39
#or |
length(x6)
x6[-(length(x6)-1)]
(x7 = c(x6, x2))


#modify
x6
set.seed(1234)
(x6 = sample(1:50))
(x6b = sort(sample(1:50)))
sort(x6)
sort(x6[-c(1,2)])
sort(x6, decreasing=T)
x6
rev(x6)

seq(-3, 10, by=.2)
x6[-c(1:12)]
x6
x6[x6> 30 & x6 < 40]
(x = -3:2)
x6
x6[2:10] <- 99; x6        # modify 2nd element
x6[x6 > 30 & x6 < 40] = 999
x6


x6
x7 = x6[1:4]; x7      # truncate x to first 4 elements

1:5
#equal partitions within a range
(x = seq(1,5, length.out = 15))
x
x = NULL
x
#NULL
x[4]
#NULL
?distribution
?rnorm
(x = rnorm(100))
plot(density(x))
abline(v=c(-3,0,3))
mean(x)
(x1 = rnorm(100, mean=50, sd=5))
plot(density(x1))
abline(v=mean(x1),h=0.04)
hist(x1, breaks=7)
hist(x1)
hist(x1, freq=F)
lines(density(x1), col=2)
summary(x1)
quantile(x1)
quantile(x1, seq(0,1,.25))
quantile(x1,c(.1, .5, .8))
quantile(x1,seq(0,1,.01))
stem(x1)

#Matrix-----
100:111
length(100:111)
matrix(1,ncol=3, nrow=4)
(m1 = matrix(100:111, nrow=4))
(m2 = matrix(100:111, ncol=3, byrow=T))

x=101:124
length(x)
matrix(x, ncol=6)
class(m1)
attributes(m1)
dim(m1)
m1

# access elements of matrix
m1[1,]
m1[,1]
m1[,1, drop=F]
m1[,-1]  #remove 1st column
m1[1,2:3]
m1[c(1,3),]
m1[,-c(1,3), drop=F]
m1[m1> 105 & m1 < 108]

#names of cols and rows
m1

paste("C","D",sep="-")
paste("C",1:100,sep="-")
paste("C",1:3,sep='')
(colnames(m1) = paste('C',1:3, sep=''))
m1
(rownames(m1) = paste("R",1:4, sep=''))
m1
attributes(m1)
m1[,c('C1','C3')]
m1[,c(1,3)]
#Vector to Matrix
(m3 = 1:24)
m3
dim(m3)= c(6,4)
m3

#access elements
m2
m2[1,]  #first row
m2[c(1,3,4),]  #1st,3rd,4th row

m2[,1]  #first col
m2[,2:3] # 2nd to 3rd coln

m2[c(1,2),c(2,3)]
m2[,]
m2[-2,] # exclude 2nd row
m2
m2[1:5] # matrix is like vector
m2
m2[c(TRUE,F,T,F),c(F, T, T)] #logical indexing
m2[m2 > 5 & m2 < 10]

m1
m1[1:2,1:2]
m1[c('R1','R2'),c('C1','C2')]
m1[1:2,]
m1[c(T,T,F,F),]
m1

#modify Vector
m2
m2[2,2]
m2[2,2] = 10
m2
m2[,2] = 10
m2
m2[m2> 107] = 9999
m2
rbind(m2, c(50,60,70))
rbind(m2,m2)
m2
cbind(m2, c(55,65,75,85))
m2m2= cbind(m2,m2)
m2m2
m2
cbind(m2,m2)
rbind(m2,m2)
#row and col wise summary

m1
colSums(m1)
rowSums(m1)
colMeans(m1)
rowMeans(m1)

t(m1) # transpose
m1
sweep(m1, MARGIN = 1, STATS = c(2,3,4,5), FUN="+" ) #rowise
sweep(m1, MARGIN = 2, STATS = c(2,3,4), FUN="*" ) #colwise

#addmargins
m1
?addmargins
addmargins(m1,margin=1,sum) #colwise function
addmargins(m1,1,sd) #colwise function

addmargins(m1,2,mean) #rowwise function
addmargins(m1,c(1,2),mean) #row & col wise function
?addmargins
(M1sum= addmargins(m1,c(1,2),list(list(mean,sum,max, min), list(var,sd, max, min)))) #row & col wise function
round(M1sum,0)

#Array-----
length(100:123)
4*3*2
#2 coys, 3 products, 4 locations sold qty
(a1 = array(100:123, dim=c(4,3,2)))
(loc = paste('loc', 1:4,sep='-'))
(product = paste('p', 1:3,sep='@'))
(coy = paste('coy', 1:2,sep='%'))
dimnames(a1) = list(loc, product, coy)
a1
apply(a1,1, sum) #locationwise
apply(a1,2, sum) #productwise
apply(a1,c(1,2), sum) #product-location wise
apply(a1,c(2,3), sum) #product-coy wise
apply(a1,c(1,3), sum) #coy-location
apply(a1,3, sum) #coywise
sum(a1) #total


#DataFrame----
#create Vectors to be combined into DF
(rollno = 1:30)
(sname = paste('student',1:30,sep=''))
(gender = sample(c('M','F'), size=30, replace=T, prob=c(.7,.3)))
(marks1 = floor(rnorm(30,mean= 50,sd=10)))
(marks2 = ceiling(rnorm(30,40,5)))
(course = sample(c('BBA','MBA'), size=30, replace=T, prob=c(.5,.5)))
rollno; sname; gender
marks1 ; marks2; course

#create DF
df1= data.frame(rollno, sname, gender, marks1, marks2, course, stringsAsFactors = F)
str(df1) #structure of DF
head(df1) #top 6 rows
head(df1,n=3) #top 3 rows
tail(df1) #last 6 rows
class(df1) # DF
summary(df1) #summary
nrow(df1) 
dim(df1)
length(df1)
df1$course
df1$gender = factor(df1$gender)
df1$course = factor(df1$course)
#df1$sname = as.character(df1$sname)
str(df1)
summary(df1)
boxplot(marks1 ~ gender + course, data=df1)

df1  #full data
df1$gender  # one column
head(df1[ , c(2,4)]) #multiple columns
df1[1:10 ,] #select rows, all columns
df1[1:5,1:4]
#as per conditionis
df1[ marks1 > 50 & gender=='F', c('rollno', 'sname','gender', 'marks1')]
df1[ marks1 > 50 & gender=='F', c(1,2)]
df1[ marks1 > 50 | gender=='F', ]

names(df1)  # names of columns
dim(df1)  #Dimensions

aggregate(df1$marks1, by=list(df1$gender), FUN=sum)
aggregate(marks1 ~ gender, data=df1, FUN=max)
aggregate(cbind(marks1, marks2) ~ gender, data=df1, FUN=max)


(df2 = aggregate(cbind(marks1,marks2) ~ gender + course, data=df1, FUN=mean))
df2

df1





#List -----
g ="My First List"
h = c(25, 26,18,39)
j = matrix(1:10,nrow=2)
k = c('one','two','three')
mylist = list(title=g, ages=h, j, h)
mylist
mylist[2]
mylist[[2]]
mylist[['ages']]
mylist$ages





#Factor -----

(grades = sample(c('A','B','C','D'), size=30, replace=T, prob=c(.3,.2,.4,.1)))
summary(grades)
table(grades)
(gradesFactor = factor(grades))
summary(gradesFactor)

(gradesFactorOrdered = factor(grades, ordered=T))
summary(gradesFactorOrdered)

(gradesFactorOrderedLevels = factor(grades, ordered=T, levels=c('D','C','B','A')))
summary(gradesFactorOrderedLevels)
gradesFactor
gradesFactorOrdered
gradesFactorOrderedLevels
pie(c(10,15,17))
pie(summary(gradesFactorOrderedLevels))
barplot(summary(gradesFactorOrderedLevels), col=1:4)

class(grades)
class(gradesFactorOrdered)
class(gradesFactorOrderedLevels)



# Object Properties
#vector
v1= 1:100
class(v1) ; typeof(v1)
v2=letters[1:10]
class(v2) ; typeof(v2)
length(v2)
summary(v1)

#matrix
m1= matrix(1:24,nrow=6)
class(m1)
summary(m1)
dim(m1)
str(m1)

#Array
a1 =array(1:24, dim=c(4,3,2))
class(a1)
str(a1)
dim(a1)
summary(a1)



#DF
#data() #built in datasets
df1= iris 
str(df1)
summary(df1)
class(df1); dim(df1)
nrow(df1) ; names(df1) ;NROW(df1)
colnames(df1)
rownames(df1)

#list
list1 = list(v1,m1,a1,df1)
str(list1)

#Statistical Description
library(Hmisc)
describe(df1)


#Next Topics
x= c(123.2234, 33333.544, 43243.8442)
floor(x)
ceiling(x)
trunc(x)
round(x,-2)
round(x, digits = 5)
