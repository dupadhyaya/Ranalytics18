# Data Structures in R

#Vectors----
v1 = c('A', 'B','C')   #create a vector
v1   #print the vector
class(v1)  #print the class of vector
(v2 = c(1,2,3))
v2
class(v2)
(v3 = c(TRUE, FALSE, TRUE))
class(v3)
V3a <- c(T,F,T)
v4 = 100:200
length(v4)
v4
v5 = seq(1,10,2)
v4; v5
v4
v4[-c(1,3,4)]
v4[v4 > 150]
v7 = c('A','C')
v1
v1[!v1 %in% v7]
v1
v1['A']  #wrong/ error
v1[1]
v1


v4(v8 = 10:15)

names(v8) = c('E','F','G','H','I','J')
v8
v8['G']
v8[c('G','I')]

v8[3:5]

str(v8)
str(v1)
class(v8)
class(v1)

#Dataframe----
rollno=c(1,2,3)
name=c('Rohit','Lalit', 'Hitesh')
course=c('MBA','BBA','MCA')
dept=c('Dept1','Dept1','Dept2')
marks=floor(rnorm(3,50,10))
?rnorm
rnorm(3,50,10)         
students = data.frame(rollno, name, course, dept, marks)
students
class(students)
str(students)
summary(students)          


df = data.frame(rollno=c(1,2,3), name=c('Rohit','Lalit', 'Hitesh'), course=c('MBA','BBA','MCA'), dept=c('Dept1','Dept1','Dept2'),marks=floor(runif(3,50,100)))
df
class(df)
#df = fix(df)
df
str(df)
class(df)
summary(df)

#List
listL1 = list('dhiraj', v1, students, mymatrix, myarray)
listL1


#?ls
ls()
rm(list=ls())
ls()


(mylist1 = list( 1, df, v4))

?matrix
'a':'Z'
mym = matrix(c('a','b',2,'d'), ncol=2)
mym
1:24
(mymatrix = matrix(1:24,ncol=6,byrow=T))
#(mymatrix = matrix(11:34,nrow=6,byrow=T))
length(11:35)
mymatrix[,1]
mymatrix[2:4,3:4]
mymatrix[5,3]
mymatrix
?matrix
(mymatrix = matrix(1:24,ncol=4, byrow=TRUE))
rows1= c('R_1','R_2')
1:6
rn = paste('R',1:6, sep='-')
cn = paste('C',1:4, sep='-')
dimnames(mymatrix) = list(c(rn), c(cn))
mymatrix
?dimnames
dimnames(mymatrix) = list(c(paste('R',1:6, sep='_')), c(paste('C',1:4,sep='')))
mymatrix
paste('C',1:4, sep='')
mymatrix[c('R-1'),]
mymatrix[,c('C-3')]
mymatrix[c('R-1','R-3'),]
mymatrix[c(1,3),]

mymatrix
colSums(mymatrix)
rowSums(mymatrix)
rowMeans(mymatrix)
colMeans(mymatrix)

#--
(myarray = array(101:124, dim=c(4,3,2)))

(myarray = array(1:24, dim=c(4,3,2), dimnames = list(c('S1','S2','S3','S4'), c('Sub1','Sub2','Sub3'), c('Dept1','Dept2'))))
myarray
apply(myarray,1,sum)
apply(myarray,2,mean)
apply(myarray,3,sum)
apply(myarray,c(2,3),mean)
apply(myarray,c(1,3),sd)
apply(myarray,c(1,2),max)



# Factors
name = c('S1','S2','S3','S4','S5')
course = c('PHD', 'MTECH', 'BTECH','BTECH','PHD')
gender = c('M', 'F', 'M', 'F','M')
grades = c('A','B','C','A','F')
marks =  c(runif(5, 50, 100))
df = data.frame(name, course, gender, grades, marks)
df
str(df)
df[1:2,]
df[,1:3]
df$name = as.character(df$name)
str(df)
df$grades = factor(df$grades, ordered=F, levels=c('A','B','C','D','E','F'))
str(df)
df$grades
df$gender = factor(df$gender, ordered=T, levels=c('M','F'))

df$gender
#x



#

students
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





