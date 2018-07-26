#Clustering using amap package

library(amap)
A=c(1,1.5,3,5,3.5,4.5,3.5)
B=c(1,2,4,7,5,5,4.5)
marks=data.frame(A,B)
marks
?amap::Kmeans
#Kmeans(x, centers, iter.max = 10, nstart = 1, method = "euclidean")
(c1a =amap::Kmeans(marks,centers= 2))
(c2a =amap::Kmeans(marks,centers= marks[c(1,4),] ))
anova(c1a, cs2a)
c1a$cluster

library(fpc)
?cluster.stats
cluster.stats(c1a$cluster, c2a$cluster)
