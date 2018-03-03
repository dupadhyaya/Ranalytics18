#Clustering - Simple dataset - Marks in 2 subjects


A=c(1,1.5,3,5,3.5,4.5,3.5)
B=c(1,2,4,7,5,5,4.5)
marks=data.frame(A,B)
marks

(c1 <- kmeans(marks, 2))
cbind(marks, c1$cluster)
plot(marks, col = c1$cluster)
points(c1$centers, col = 1:2, pch = 8, cex = 2)

#C1- 1, 2 : (1.3, 1.5)
#C2- 3, 4, 5, 6, 7  : (3.9, 5.1)
#
#Specify Coordinates for Centers
mcenters = marks[c(1,4),]
mcenters
(c2 <- kmeans(marks, centers=mcenters))
(c2 <- kmeans(marks, centers=matrix(c(1,1,5,7), ncol=2)))

c2
cbind(marks,c2$cluster)
c2$centers
aggregate(marks,by=list(c2$cluster),FUN=mean)
aggregate(marks,by=list(c2$cluster),FUN=c(length,sum))
library(dplyr)
marks %>% group_by(c2$cluster) %>% 
  summarise_all(funs(sum, mean, median, n()))

# Distances
x1=marks[1,]; x2=marks[2,]
x1;x2
sqrt(sum((x1-x2)^2))
dist(rbind(x1,x2))
euc.dist <- function(x1, x2) sqrt(sum((x1 - x2) ^ 2))
for (i in range(1,7))
  print(euc.dist(marks[i,], marks[1,]))

ref1 = marks[1,];ref1
ref2 = marks[4,]; ref2

(d1= apply(marks,1,function(x)sqrt(sum((x-ref1)^2))))
(d2= apply(marks,1,function(x)sqrt(sum((x-ref2)^2))))
df=cbind(marks, d1,d2)
apply(df, 1, function(x) max(which(x == min(x, na.rm = TRUE))))
df
apply(df[,c(3,4)],1, min)
df3 <-transform(df, mind1d2=apply(df[,c(3,4)],1, min, na.rm = TRUE))
df3
