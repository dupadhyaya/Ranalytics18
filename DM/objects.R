# Objects
# 

m1 = matrix(c(10:1, rep(5,10), rep(c(5,6),5),seq_len(length.out=10)), byrow=F, ncol =4)
colnames(m1) = c('sub1','sub2','sub3','sub4')
rownames(m1) = paste('R',1:10,sep='')

a1= array(1:24, dim=c(4,3,2), dimnames = list( c(paste('c',1:4,sep='')), c('d1','d2','d3'),c('s1','s2')) )
a1

df1 = data.frame(sub1=10:1, sub2=5, sub3=rep(c(5,6),5), sub4=seq_len(length.out=10))
df1

# Lists

list1 = list(sub1=10:1, sub2=rep(5,3), sub3=rep(c(5,6),4),sub4=seq_len(length.out=10))
list1

list2 = list(num=1:10, vec=c(1:5, 4:5, 6:8, NA, 9, 12, 17), lg=log(1:5))
list2

#Data Frame df3
newnum = c(2:5, 4:5, 6:8, 9,17)
fac1 = factor(c(rep("A", 3), rep("B", 3), rep("C", 3), rep("D",2)))
fac2 = gl(n=2, k=1, length=11, labels = month.abb[1:2])
newnum
fac2
fac1
df3 = data.frame(response = newnum, pred1 = fac1, pred2 = fac2)
df3
#rm(list=ls())

student1 <- readRDS("student1.rds")
# Dataframe student
str(student1)
s1 = student1[,c('br', 'city','java','dbms', 'dwm','vlsi', 'cpp', 'cbnst')]
str(s1)
student1[,c(15:22)]
