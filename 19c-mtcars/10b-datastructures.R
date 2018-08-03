# Data Structures in Slides

?seq
#control+enter when you are in the line to execute
#
# Vectors-----
(x=1:10)
(x=c(1,2,3,4,5,10))
(x=letters[1:10])
(x=c(T,F,T,T))

#access elements
(x = seq(0,10,by=2))
#[1]  0  2  4  6  8 10
x[3]  # access 3rd element
#[1] 4
x[c(2, 4)]     # access 2nd and 4th element
#[1] 2 6
x[-1]          # access all but 1st element
#[1]  2  4  6  8 10
x[c(2, -4)]    # cannot mix positive and negative integers
#Error in x[c(2, -4)] : only 0's may be mixed with negative subscripts
x[c(2.4, 3.54)]    # real numbers are truncated to integers
#[1] 2 4

#modify
(x = -3:2)
#[1] -3 -2 -1  0  1  2
x[2] <- 0; x        # modify 2nd element
#[1] -3  0 -1  0  1  2
x[x<0] = 5; x   # modify elements less than 0
#[1] 5 0 5 0 1 2
x = x[1:4]; x      # truncate x to first 4 elements
#[1] 5 0 5 0

#delete vector
(x = seq(1,5, length.out = 10))
#[1] 1.000 1.444 1.889 2.333 2.778 3.222 3.667 4.111 4.556 5.000
x = NULL
x
#NULL
x[4]
#NULL




#Matrix-----
(m1 = matrix(1:12, nrow=4))
(m2 = matrix(1:12, ncol=3, byrow=T))

class(m1)
#[1] "matrix"
attributes(m1)
#$dim
#[1] 4 3
dim(m1)
#[1] 4 3

#names of cols and rows
m1
(colnames(m1) = paste('C',1:3, sep=''))
(rownames(m1) = paste('R',1:4, sep=''))
m1

#Vector to Matrix
(m3 = 1:24)
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
m2[1:5] # matrix is like vector
m2[c(TRUE,FALSE),c(2,3)] #logical indexing
m2[m2 > 5]

#modify Vector
m2[2,2]
m2[2,2] = 10
m2
m2[m2> 10] = 99
m2
rbind(m2, c(50,60,70))
cbind(m2, c(55,65,75,85))

#row and col wise summary
m1
colSums(m1); rowSums(m1)
colMeans(m1); rowMeans(m1)

t(m1) # transpose
m1
sweep(m1, MARGIN = 1, STATS = c(2,3,4,5), FUN="+" ) #rowise
sweep(m1, MARGIN = 2, STATS = c(2,3,4), FUN="*" ) #colwise

#addmargins
m1
addmargins(m1,1,sum) #colwise function
addmargins(m1,2,mean) #rowwise function
addmargins(m1,c(1,2),mean) #row & col wise function
addmargins(m1,c(1,2),list(list(mean,sum), list(var,sd))) #row & col wise function


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
(marks = floor(rnorm(30, mean=50,sd=10)))
plot(density(marks)); abline(v=50)
(marks2 = ceiling(rnorm(30,40,5)))
plot(density(marks2)); abline(v=c(40,50))
(course = sample(c('BBA','MBA'), size=30, replace=T, prob=c(.5,.5)))
#create DF
df1= data.frame(rollno, sname, gender, marks, marks2, course)
str(df1) #structure of DF
head(df1) #top 6 rows
head(df1,n=3) #top 3 rows
tail(df1) #last 6 rows
class(df1) # DF
summary(df1) #summary

df1  #full data
df1[,c('course')]
df1$course
df1$gender  # one column
df1[ , c(2,4)] #multiple columns
df1[1:10 ,] #select rows, all columns
#as per conditionis
names(df1)
df1[ marks > 50 & gender=='F', c('rollno', 'sname','marks')]
df1[ marks < 50 & gender=='F', c(1,2,3,4)]
df1[ marks > 50 & gender=='F', ]

names(df1)  # names of columns
dim(df1)  #Dimensions

aggregate(df1$marks, by=list(df1$gender), FUN=min)

(df2 = aggregate(cbind(marks,marks2) ~ gender + course, data=df1, FUN=max))




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
table(grades)
(gradesFactor = factor(grades))
(gradesFactorOrdered = factor(grades, ordered=T))
(gradesFactorOrderedLevels = factor(grades, ordered=T, levels=c('D','C','B','A')))
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
