#Clustering - Simple dataset - Marks in 2 subjects

A=c(1,1.5,3,5,3.5,4.5,3.5)
B=c(1,2,4,7,5,5,4.5)
marks=data.frame(A,B)
marks
?kmeans
(c1 = kmeans(marks,centers=3))  #??
#no of clusters or initial distinct cluster centers
c1$iter
cbind(marks, c1$cluster)
c1$centers

plot(marks, pch=10,col = c1$cluster)
c1$centers
points(c1$centers, col = 1:3, pch = 8, cex = 3)

c1$iter #?

#C1- 1, 2 : (1.3, 1.5)
#C2- 3, 4, 5, 6, 7  : (3.9, 5.1)
#
#Specify Coordinates for Centers
mcenters = marks[c(1,5),]
mcenters
(c2a <- kmeans(marks, centers=mcenters))
cbind(marks, c2a$cluster)
matrix(c(1,1,5,7), ncol=2)
?matrix
(c2b <- kmeans(marks, centers=matrix(c(1,1,5,7), ncol=2)))

c2a
cbind(marks,c2a$cluster)
c2a$centers
aggregate(marks,by=list(c2a$cluster),FUN=mean)
c2a
c2a$iter

library(dplyr)
marks
marks %>% group_by(c2a$cluster) %>% summarise_all(funs(sum, mean, median, n()))


# Distances
x1=marks[1,]; x2=marks[2,]
x1;x2
sqrt(sum((x1-x2)^2))
sqrt(1.25)
dist(rbind(x1,x2))
euc.dist <- function(x1, x2) sqrt(sum((x1 - x2) ^ 2))
for (i in 1:7)
  print(paste(i, round(euc.dist(marks[i,], marks[1,]),2),sep='-'))

ref1 = marks[1,]; ref1
ref2 = marks[4,]; ref2

(d1= apply(marks,1,function(x)sqrt(sum((x-ref1)^2))))
(d2= apply(marks,1,function(x)sqrt(sum((x-ref2)^2))))
df=cbind(marks, d1,d2)
df

apply(df, 1, function(x) max(which(x == min(x, na.rm = TRUE))))
df
apply(df[,c(3,4)],1, min)
df3 <-transform(df, mind1d2=apply(df[,c(3,4)],1, min, na.rm = TRUE))
df3




gender = c('M','F','M')
gender
genderF = factor(gender)
genderF
grades = c('A','B','C')
grades
gradesF = factor(grades)
gradesF
gradesF1 = factor(grades, ordered=T)
gradesF1
gradesF2 = factor(grades, ordered=T, levels=c('C','B','A'))
gradesF2
marks = rnorm(3, 50,10)
df = data.frame(genderF, gradesF, marks)
df
str(df)

