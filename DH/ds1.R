# Data Structures in R

Vectors
v1 = c('A', 'B','C')
v2 = c(1,2,3)
v3 = c(True, False, True)
v4 = 1:10
v5 = seq(1,10,2)

df = data.frame(rollno=c(1,2,3), name=c('Rohit','Lalit', 'Hitesh'), course=c('MBA','BBA','MCA'), dept=c('Dept1','Dept1','Dept2'),marks=floor(runif(3,50,100)))
df
df = fix(df)
ls()
#rm(list=ls())
v4
(mylist1 = list( 1, df, v4))
(mymatrix = matrix(1:24,ncol=4))
(mymatrix = matrix(1:24,ncol=4, byrow=TRUE))
(myarray = array(1:24, dim=c(4,3,2)))
(myarray = array(1:24, dim=c(4,3,2), dimnames = list(c('S1','S2','S3','S4'), c('Sub1','Sub2','Sub3'), c('Dept1','Dept2'))))

table(df$course,df$dept)

apply(mymatrix, 1, sum)  
apply(mymatrix, 2, sum)  
apply(myarray, 3, sum)  
df
tapply(df$marks, df$course, sum)

?tapply

stack(df)
