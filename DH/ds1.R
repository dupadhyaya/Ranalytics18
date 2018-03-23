# Data Structures in R

#Vectors----
(v1 = c('A', 'B','C'))
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

(v8 = 1:5)
names(v8) = c('anish','shlok','jaimin', 'bhavya','nihali')
v8['shlok']
v8[2]

str(v8)
str(v1)
class(v8)
class(v1)

df = data.frame(rollno=c(1,2,3), name=c('Rohit','Lalit', 'Hitesh'), course=c('MBA','BBA','MCA'), dept=c('Dept1','Dept1','Dept2'),marks=floor(runif(3,50,100)))
df
df = fix(df)
df
str(df)
class(df)



ls()
#rm(list=ls())
ls()
v4

(mylist1 = list( 1, df, v4))

?matrix

(mymatrix = matrix(1:24,ncol=4))
(mymatrix = matrix(1:24,ncol=4, byrow=TRUE))

(myarray = array(1:24, dim=c(4,3,2)))
(myarray = array(1:24, dim=c(4,3,2), dimnames = list(c('S1','S2','S3','S4'), c('Sub1','Sub2','Sub3'), c('Dept1','Dept2'))))
?array

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
df$grades
df$grades = factor(df$grades, ordered=T, labels=c('C','B','A'))
df$grades



table(df$course,df$dept)

apply(mymatrix, 1, sum)  
apply(mymatrix, 2, sum)  
apply(myarray, 3, sum)  
df
tapply(df$marks, df$course, sum)

?tapply

stack(df)




