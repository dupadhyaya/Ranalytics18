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

income = ceiling(runif(20,10000,300000))
children = round(runif(20,0,5),0)
rent = ceiling(rnorm(20,15000,2000))
df2 = data.frame(income, children, rent)

#Perform Clustering
set.seed(1234)
km2 = kmeans(df2,3)
km2
df2a = cbind(df2, cluster=km2$cluster)
df2a
df2a[ order(df2a$cluster), ]

#Avl components
attributes(km2)
# Calculate distances between each point
#stats::dist(df1$marks1, method = "euclidean")
m2 = as.matrix(stats::dist(df2, method = "euclidean"))
m2
# distance calculated by Algo
#within
km2$withinss
km2$tot.withinss
#between
km2$betweenss
#Other Output of Algo
#Centeriod
km2$centers
#Size of each cluster
km2$size
#Total SS Distance
km2$totss

#Plot the Clusters
fviz_cluster(km2, data = df2, geom = "point", stand = FALSE, ellipse.type = "norm") #work more data reqd
plot(df2$income, col=km2$cluster)

library(cluster)
clusplot(df2, km2$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)

#optimal number of clusters
#Package
set.seed(123)
fviz_nbclust(df2, kmeans, method = "wss") + geom_vline(xintercept = 3, linetype = 2)
#nb <- NbClust(df2, distance = "euclidean", min.nc = 2,               max.nc = 10, method = "complete", index ="all") #Not Working

#Manual way
set.seed(1234)
(kmc1 = kmeans(df2,1)) ; (kmc2 = kmeans(df2,2)); (kmc3 = kmeans(df2,3)) ; (kmc4 = kmeans(df2,4));(kmc5 = kmeans(df2,5))
kmc2$tot.withinss; kmc5$tot.withinss
(wss = sapply(1:5, function(k){kmeans(df2, k )$tot.withinss}))
plot(1:5, wss, type="b")
abline(v = 3, lty =2)

#Scale the data and then do Kmeans
df3 = data.frame(scale(df2))
class(df3)
head(df3)
km3 = kmeans(df3, 3)
km3
km3$tot.withinss
#Plot the Clusters
fviz_cluster(km3, data = df3, geom = "point", stand = FALSE, ellipse.type = "norm") #work more data reqd
plot(df3$income, col=km3$cluster)

#Package
set.seed(123)
fviz_nbclust(df3, kmeans, method = "wss")
(wss3 = sapply(1:5, function(k){kmeans(df3, k )$tot.withinss}))
plot(1:5, wss3, type="b")
abline(v = 3, lty =2)

fviz_nbclust(df3, kmeans, method = "silhouette")
