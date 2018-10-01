# Data Structures in Slides

#control+enter when you are in the line to execute
#
# Vectors-----
x=1:10   #create seq of nos from 1 to 10
x
x1 <- 1:20
x1

(x1=1:30)
(x2=c(1,2,13,4,5))
class(x2)

(x3=letters[1:10])
class(x3)
LETTERS[1:26]
?c
(x3b = c('a',"Dhiraj","4"))
class(x3b)

(x4=c(T,FALSE,TRUE,T,F))
class(x4)

x5=c(3L,5L)
class(x5)
x5a = c(3,5)
class(x5a)
(x5b = c(1, 'a',T, 4L))
class(x5b)

#access elements
(x6 = seq(0,100,by=3))
methods(class='numeric')
?seq
#[1]  0  2  4  6  8 10
ls()  #variables in my environment
x6
length(x6)
x6[20]
x6[3]  # access 3rd element
#[1] 4
x6[c(2, 4)]     # access 2nd and 4th element
x6[-1]          # access all but 1st element
x6[-c(1:10, 15:20)]
x6[c(2, -4)]    # cannot mix positive and negative integers
#Error in x[c(2, -4)] : only 0's may be mixed with negative subscripts
x6[c(2.4, 3.54)]    # real numbers are truncated to integers
x6[-c(1,5,20)]
x6
length(x6)
x6[-(length(x6)-1)]
(x7 = c(x6, x2))
#modify
x6
sort(x6)
sort(x6[-c(1,2)])
sort(x6, decreasing=T)
rev(x6)

seq(-3, 10, by=.2)
x6[-c(1:12)]

(x = -3:2)
x[2] <- 10; x        # modify 2nd element
#[1] -3  0 -1  0  1  2
x
x < 0
x[x<= 1 & x >= -1] = 100; x   # modify elements less than 0
x


x = x[1:4]; x      # truncate x to first 4 elements
#[1] 5 0 5 0


#delete vector
(x = seq(1,5, length.out = 15))
#[1] 1.000 1.444 1.889 2.333 2.778 3.222 3.667 4.111 4.556 5.000
x = NULL
x
#NULL
x[4]
#NULL


(x = rnorm(100))
plot(density(x))
mean(x)
(x1 = rnorm(1000000, mean=50, sd=5))
plot(density(x1))
abline(v=mean(x1),h=0.04)


#Matrix-----
100:111
(m1 = matrix(1:12, nrow=4))
(m2 = matrix(1:12, ncol=3, byrow=T))
x=101:124
length(x)
matrix(x, ncol=6)
class(m1)
attributes(m1)
dim(m1)
m1

# access elements of matrix
m1[1,2:3]
m1[c(1,3),]
m1[,-c(1,3)]
#names of cols and rows
m1

paste("C","D",sep="-")
paste("C",1:100,sep="-")

(colnames(m1) = paste('C',1:3, sep=''))
m1
(rownames(m1) = paste('R',1:4, sep=''))
m1
attributes(m1)

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
m2
m2[1:5] # matrix is like vector
m2
m2[c(TRUE,F,T,F),c(F, T, T)] #logical indexing
m2[m2 > 5 & m2 < 10]

m1
m1[1:2,1:2]
m1[c('R1'),c('C1','C3')]
m1[1:2,]
m1[c(T,T,F,F),]
m1

#modify Vector
m2
m2[2,2]
m2[2,2] = 10
m2
m2[m2> 10] = 99
m2
rbind(m2, c(50,60,70))
m2
cbind(m2, c(55,65,75,85))
rbind(m2,m2)

m2
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
?addmargins
addmargins(m1,margin=1,sum) #colwise function
addmargins(m1,1,sd) #colwise function

addmargins(m1,2,mean) #rowwise function
addmargins(m1,c(1,2),mean) #row & col wise function

addmargins(m1,c(1,2),list(list(mean,sum,max), list(var,sd))) #row & col wise function


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
(marks = floor(rnorm(30,mean= 50,sd=10)))
(marks2 = ceiling(rnorm(30,40,5)))
(course = sample(c('BBA','MBA'), size=30, replace=T, prob=c(.5,.5)))
rollno; sname; gender
marks ; marks2; course

#create DF
df1= data.frame(rollno, sname, gender, marks, marks2, course, stringsAsFactors = F)
str(df1) #structure of DF
head(df1) #top 6 rows
head(df1,n=3) #top 3 rows
tail(df1) #last 6 rows
class(df1) # DF
summary(df1) #summary
df1$gender = factor(df1$gender)
df1$course = factor(df1$course)
str(df1)
summary(df1)


df1  #full data
df1$gender  # one column
df1[ , c(2,4)] #multiple columns
df1[1:10 ,] #select rows, all columns
#as per conditionis
df1[ marks > 50 & gender=='F', c('rollno', 'sname','gender', 'marks')]
df1[ marks > 50 & gender=='F', c(1,2)]
df1[ marks > 50 | gender=='F', ]

names(df1)  # names of columns
dim(df1)  #Dimensions

aggregate(df1$marks, by=list(df1$gender), FUN=max)
aggregate(marks ~ gender, data=df1, FUN=max)


(df2 = aggregate(cbind(marks,marks2) ~ gender + course, data=df1, FUN=mean))




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

pie(summary(gradesFactorOrderedLevels))
barplot(summary(gradesFactorOrderedLevels))

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


#lets draw some simple graphs