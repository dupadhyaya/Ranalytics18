# Clustering - Video Lesson

library(cluster) #computing pam, analyzing cluster silhouettes
library(factoextra) # visualizing clusters using ggplot2 plotting system
library(NbClust) # finding the optimal number of clusters
#Case-1: One Numeric Variable
#libraries
library(cluster)
library(factoextra)
library(NbClust)
#create data
set.seed(1234)
marks1 = ceiling(runif(20,50,90))
df1 = data.frame(marks1)
#Perform Clustering
set.seed(1234)
km1 = kmeans(df1,3)
km1
df1a = cbind(df1, cluster=km1$cluster)
df1a
df1a[ order(df1a$cluster), ]
#Avl components
attributes(km1)
# Calculate distances between each point
#stats::dist(df1$marks1, method = "euclidean")
m1 = as.matrix(stats::dist(df1$marks1, method = "euclidean"))
m1
# distance calculated by Algo
#within
km1$withinss
km1$tot.withinss
#between
km1$betweenss
#Other Output of Algo
#Centeriod
km1$centers
#Size of each cluster
km1$size
#Total SS Distance
km1$totss

#Plot the Clusters
fviz_cluster(km1, data = df1, geom = "point", stand = FALSE, ellipse.type = "norm") #Less than 2 Not work
plot(df1$marks1, col=km1$cluster)
library(cluster)
clusplot(df1, km1$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)
#optimal number of clusters
#Package
set.seed(123)
fviz_nbclust(df1, kmeans, method = "wss") + geom_vline(xintercept = 3, linetype = 2)
nb <- NbClust(df1, distance = "euclidean", min.nc = 2,               max.nc = 10, method = "complete", index ="all") #Not Working

#Manual way
set.seed(1234)
(kmc1 = kmeans(df1,1)) ; (kmc2 = kmeans(df1,2)); (kmc3 = kmeans(df1,3)) ; (kmc4 = kmeans(df1,4));(kmc5 = kmeans(df1,5))
kmc1$tot.withinss; kmc5$tot.withinss
(wss = sapply(1:5, function(k){kmeans(df1, k )$tot.withinss}))
plot(1:5, wss, type="b")
abline(v = 3, lty =2)
