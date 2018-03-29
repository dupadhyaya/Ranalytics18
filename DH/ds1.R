# Data Structures in R

#Vectors----
v1 = c('A', 'B','C')
v1
class(v1)
(v2 = c(1,2,3))
(v3 = c(TRUE, FALSE, TRUE))
V3a = c(T,F,T)
v4 = 100:200
v5 = seq(1,10,2)
v4; v5
v4[-c(1,3,4)]
v4[v4 == 150]
v7 = c('A','C')
v1[v1 %in% v7]
v1['A']
v1[1]

(v8 = 10:15)

names(v8) = c('E','F','G','H','I','J')
v8
v8['G']
v8[c('G','I')]

v8[3:5]

str(v8)
str(v1)
class(v8)
class(v1)

df = data.frame(rollno=c(1,2,3), name=c('Rohit','Lalit', 'Hitesh'), course=c('MBA','BBA','MCA'), dept=c('Dept1','Dept1','Dept2'),marks=floor(runif(3,50,100)))
df
#df = fix(df)
df
str(df)
class(df)
summary(df)

#?ls
ls()
rm(list=ls())
ls()
v4

(mylist1 = list( 1, df, v4))

?matrix
'a':'Z'
mym = matrix(c('a','b',2,'d'), ncol=2)
mym

(mymatrix = matrix(1:24,ncol=4))
mymatrix[2:4,3:4]
mymatrix[5,3]
mymatrix
?matrix
(mymatrix = matrix(1:24,ncol=4, byrow=TRUE))
dimnames(mymatrix) = list(c(paste('R',1:6, sep='_')), c(paste('C',1:4,sep='')))
mymatrix
paste('C',1:4, sep='')

(myarray = array(101:124, dim=c(4,3,2)))

(myarray = array(1:24, dim=c(4,3,2), dimnames = list(c('S1','S2','S3','S4'), c('Sub1','Sub2','Sub3'), c('Dept1','Dept2'))))
?array

df
df=fix(df)
df[3:4,1:2]
df
df$course
df$name
df$gender = c('M','F','M','M')
df
str(df)
df$gender = factor(df$gender)
str(df)
df$grades = c('A', 'B', 'A', 'C')
df
str(df)
df$grades = factor(df$grades, ordered=T)
str(df)
df$grades
df$grades = factor(df$grades, ordered=T, levels=c('C','B','A'))
df$grades



table(df$course,df$gender)
mymatrix
apply(mymatrix, 1, sum)  
apply(mymatrix, 2, sum)  
apply(mymatrix, 2, sd)  
myarray
apply(myarray, 1, sum)  
df
?apply
df
tapply(df$marks, df$gender, mean)
?tapply
df
df$gender = NULL
df
df[df$dept == 'Dept1',]
df[df$marks >= 80,]





