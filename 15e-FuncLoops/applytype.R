# Apply Functions

#Data Structure
# vector
(v1 = 1:20)

#Array ----
(a1 = array(1:24, dim=c(4,3,2), 
    dimnames = list( c(paste('c',1:4,sep='')), c('d1','d2','d3'),c('s1','s2')) ))

#Matrix ----
seq_len(length.out=5)
m1 = matrix(c(10:1, rep(5,10), rep(c(5,6),5),
        seq_len(length.out=10) ), byrow=F, ncol =4)
colnames(m1) = c('sub1','sub2','sub3','sub4')
rownames(m1) = paste('R',1:10,sep='')
m1

#DataFrame ----
(df1 = data.frame(sub1=10:1, sub2=5, 
        sub3=rep(c(5,6),5), 
        sub4=seq_len(length.out=10)))

#List ----
(list1 = list(sub1=10:1, sub2=rep(5,3), 
      sub3=rep(c(5,6),4),
      sub4=seq_len(length.out=10)))

#print objects
v1
a1
m1
df1
list1

?melt
#apply --------
?apply
#apply(X, MARGIN, FUN, ...)
#X - array or matrix MARGIN=1 (Rows) ; 2 (Columns)
#FUN = mean, median, UDF, .... ... Others eg. na.rm=T
#Applies a function over the margins

#array
(X=a1)
apply(X, 1, sum)  # dimension=1 : c
apply(X, 1, mean)  # dimension=1 : c
X
apply(X, 2, sum)  # d
apply(X, 3, sum) # s
apply(X,c(1,2), sum)  # c & d
apply(X,c(1,2,3), sqrt)  # original  : c d s 
apply(X,c(1,2,3), sum)
apply(X,c(2,3), sum)  # sum over 2 & 3rd dim : d & s


class(apply(X, 1, sum))   # Integer Vector
addmargins(X,1, sum)  # row margin=1
addmargins(X,2, sum)  # col margin=1
addmargins(X,3, sum)  # sum s1 + s2
addmargins(X,c(1,2), sum)  # row & col
addmargins(X,c(1,3), sum)  # sum rows of s1 & s2
addmargins(X,c(2,3), sum)  # sum cols of s1 & s2
class(X)
m1
(m2=matrix(1:12,nrow=3))

addmargins(m2,c(1,2), 
    FUN=list(list(sum,sd), 
  list(mean,var,IQR, sum)))  # row & col
head(mtcars)

#https://www.r-bloggers.com/r-tutorial-on-the-apply-family-of-functions/
  
apply(X, 2, sum)  # dim2 : d
#d1  d2  d3   68 100 132

apply(X, 3, sum)  # dim3 s
#s1  s2   78 222

apply(X,c(3,2), sum)  # s & d : see switch of col & row
#   d1 d2 d3 
#s1 10 26 42 
#s2 58 74 90

apply(X,c(2,3), sum)   # d & s
#   s1 s2 
#d1 10 58 
#d2 26 74 
#d3 42 90

apply(X,c(1,2), sum) # c & d
#   d1 d2 d3 
#c1 14 22 30 
#c2 16 24 32 
#c3 18 26 34 
#c4 20 28 36

apply(X,c(1,3), sum)  # c & s
#    s1 s2 
#c1 15 51 
#c2 18 54 
#c3 21 57 
#c4 24 60

##matrix------- 2 dim
(X=m1)
apply(X, 1, sum) # R's
#R1  R2  R3  R4  R5  R6  R7  R8  R9 R10
#21  22  21  22  21  22  21  22  21  22

apply(X,2,sum) # sub's
#sub1 sub2 sub3 sub4
#55   50   55   55

apply(X,3,sum) # no 3rd dim
#Error in if (d2 == 0L) { : missing value where TRUE/FALSE needed

apply(X,c(3,2), sum)  #Error
apply(X,c(2,3), sum)  #Error

apply(X,c(1,2), sum) # original matrix
#sub1 sub2 sub3 sub4
#[1,]   10    5    5    1

apply(X,c(1,3), sum)  #error no 3rd dim

apply(X,sum)  # error - margins not specified

#dataframe -------------
# this acts like a matrix as all values are numeric
(X=df1)
apply(X, 1, sum)
#[1] 21 22 21 22 21 22 21 22 21 22

apply(X,2,sum)
#sub1 sub2 sub3 sub4    55   50   55   55

apply(X,3,sum)#  Error in if (d2 == 0L) { : missing value where TRUE/FALSE needed
apply(X,c(3,2), sum) #    Error
apply(X,c(2,3), sum) #    Error

apply(X,c(1,2), sum)  # original DF
#sub1 sub2 sub3 sub4
#[1,]   10    5    5    1

apply(X,c(1,3), sum)   #error

apply(X,sum)   #error no dime

#NA Values

m1[5] = NA
# use other function also
X=m1
apply(X,1,mean)
#R1   R2   R3   R4   R5   R6   R7   R8   R9  R10
#5.25 5.50 5.25 5.50   NA 5.50 5.25 5.50 5.25 5.50

apply(X,1,mean,na.rm=T)  # better
#R1   R2   R3   R4   R5   R6   R7   R8   R9  R10
#5.25 5.50 5.25 5.50 5.00 5.50 5.25 5.50 5.25 5.50

apply(X,2,mean)
#sub1 sub2 sub3 sub4
#NA  5.0  5.5  5.5

apply(X,2,mean,na.rm=T)  # better
#sub1 sub2 sub3 sub4
#5.44 5.00 5.50 5.50
    


?lapply # apply over list or vector
#lapply ---------
#lapply(X, FUN, na.rm=T, ...)
(X=list1)
lapply(X,FUN=mean, na.rm=T)
dim(list1)  # list does not have any dimensions
apply(list1, FUN=sum)  # this will give error for apply

#Egs: NA Values
X[[1]][5] = NA
lapply(X,FUN=mean, na.rm=F)


lapply(X,FUN=mean, na.rm=T)

#Unlist  - output as vector
unlist(lapply(X,FUN=mean, na.rm=T))

# simply output of list apply function
# sapply ----- 
?sapply  # returns a vector, matrix or array if appropriate
#like lapply - simplify output
sapply(list1,mean)  # for list
sapply(df1, mean)
sapply(m1, mean)
a1
sapply(a1, sum)
sapply(a1, sum, simplify = 'array')

sapply(v1, summary) # not relevant here

# mapply -----
# mapply - function to multiple list or vector args
?mapply(a1, sum)
mapply(rep, times=1:4, x = 1:4)  # list
rep(1:4,times=1:4)
mapply(rep,1:5,4)  # matrix 1 2 3 4

mapply(FUN=rep, each=1, x = v1, y=v1)
list1
rep(v1,each=1)
rep(m1,each=1)
rep(list1,each=1)

e1 = 1:3
e2 = 6:8
e3 = 10:12
#function : x * y
#1st elements : a = e1 : FUN to each elements
#2nd elements : b = e2: takes this as arguments
#3rd elements : c = e3: takes this as arguments
# arguments are recycled if required
mapply(FUN=function(x,y) x+y, e1, e2 )
e1+e2
mapply(FUN=function(x,y,z) x+y+z, e1, e2 , e3)
e1+e2+e3

mapply(FUN=function(x,y,z) mean(x*y)/ z, e1, e2 , e3)



mapply(FUN=mean, x = list(a1,m1))
mean(a1) ; mean(m1)


mapply(function(x, y) x + y,
       x=c(a =  1, b = 2, c = 3),  # names from first
       y=c(A = 10, B = 0, C = -10))

mapply(function(x, y) x ^ y, USE.NAMES = F, # no names
       x=c(a =2, b = 3, c = 4), 
       y=c(A =2, B = 3, C = 4))


# vapply ------
?vapply # similar to sapply - pre spcfd return type & better speed

vapply(X, FUN, FUN.VALUE, ..., USE.NAMES = TRUE)
vapply(df1, FUN=fivenum,
       c(Min. = 0, "1st Qu." = 0, Median = 0, "3rd Qu." = 0, Max. = 0))
vapply(df1, FUN=mean, FUN.VALUE=c(mean=0))
vapply(1:5, identity)
## [1] 1 2 3 4 5
vapply(integer(), identity)
## integer(0



#tapply
(df1a = df1)
df1a$course = sample(c('MSC','PG'),10, prob=c(.7,.3), replace=T)
df1a
tapply(X=df1a$sub1, INDEX=df1a$course, mean)
df1a$gender = sample(c('M','F'),10, prob=c(.6,.4), replace=T)
tapply(X=df1a$sub1, INDEX=df1a$gender, mean)
# 2 indices
tapply(X=df1a$sub1, INDEX=list(df1a$gender,df1a$course), mean)
# 3 indices
df1a$hostel = sample(c('Y','N'),10, prob=c(.5,.5), replace=T)
tapply(X=df1a$sub1, INDEX=list(df1a$hostel), mean)
tapply(X=df1a$sub1, INDEX=list(df1a$hostel,df1a$gender), mean)
tapply(X=df1a$sub1, INDEX=list(df1a$hostel,df1a$course), mean)

tapply(X=df1a$sub1, INDEX=list(df1a$hostel, df1a$gender,df1a$course), sum)
tapply(X=df1a$sub1, INDEX=list(df1a$hostel, df1a$gender,df1a$course), length)

df1a

?aggregate
aggregate(x, by, FUN, ..., simplify = TRUE, drop = TRUE)
aggregate(formula, data, FUN,
          subset, na.action = na.omit)
#Aggregate --------
cat(names(mtcars))
aggregate(mtcars[c('disp', 'hp', 'wt')],
          by=list(mtcars$cyl,mtcars$gear),
          FUN=mean, na.rm=TRUE, simplify = T)
aggregate(mtcars[c('disp', 'hp', 'wt')],
          by=list(Cylinder=mtcars$cyl,Gears=mtcars$gear),
          FUN=mean, na.rm=TRUE, simplify = T)[,1:3]

aggregate(mtcars[c('cyl', 'mpg','wt')],
          by=list(mtcars$cyl),
          FUN=mean)
aggregate(cyl ~ . , data= mtcars, FUN='mean') 
# formula  variables ~ groupingvars
aggregate(. ~ cyl , data= mtcars, FUN='mean') 
aggregate(. ~ cyl + am , data= mtcars, FUN='mean')
aggregate(. ~ cyl + am , data= mtcars, subset=(wt < 15), FUN='mean')

aggregate(am ~ cyl , data= mtcars, FUN='mean') #' FUN in single quote
# cyl ~ all variables
aggregate(cyl ~ mpg + wt, data= mtcars, FUN='mean',
          subset=(wt > 4)) 
aggregate(cyl  ~ mpg  + wt,
      data=subset(mtcars,wt>=5 & gear==c(3,4)), FUN='mean')
summary(mtcars$cyl)

head(df1a)
# some colns are non-numeric, exclude them
aggregate(x=df1a[c('sub1', 'sub2', 'sub3')], by=list(df1a$course), FUN=mean)
(dftemp = aggregate(x=df1a[c('sub1', 'sub2', 'sub3')], 
          by=list(df1a$course, df1a$hostel, df1a$gender), FUN=mean))
dftemp[order(dftemp$Group.1, dftemp$Group.2, dftemp$Group.3),]

(dftemp = aggregate(x=df1a[c('sub1', 'sub2', 'sub3')], 
      by=list(gpcourse = df1a$course, gphostel=df1a$hostel,gpgender= df1a$gender), FUN=mean))
dftemp[order(dftemp$gpcourse, dftemp$gpgender, 
             dftemp$gphostel),]
dftemp[order(dftemp$gpcourse, dftemp$gpgender, 
             dftemp$gphostel),][,c('gphostel', 'sub1')]
dftemp[order(dftemp$gpcourse, dftemp$gpgender, 
             dftemp$gphostel),][,c(3,2,1,4,5,6)]
