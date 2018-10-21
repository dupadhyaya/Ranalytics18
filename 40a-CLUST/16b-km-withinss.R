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
km1 = kmeans(df1,3,nstart=5)
#nstart option attempts multiple initial configurations and reports on the best one. For example, adding nstart=25 will generate 25 initial random centroids and choose the best one for the algorithm

km1
(df1a = cbind(df1, cluster=km1$cluster))
df1a[ order(df1a$cluster), ]

#Avl components
str(km1)
attributes(km1)
# Calculate distances between each point
#stats::dist(df1$marks1, method = "euclidean")
m1 = as.matrix(stats::dist(df1$marks1, method = "euclidean"))
?kmeans
m1
rownames(m1) = df1$marks1
colnames(m1) = df1$marks1
m1
#distance between 1st and 2nd 
sqrt((diff(df1$marks1[c(1,20)]))^2)
useful::topright(m1)

# distance calculated by Algo
#within : inside a cluster : sum of sq differences of each point from centeriod
km1$withinss
#cluster 1 : 
km1$withinss[1]
#calculate manually
(c1 = df1[km1$cluster==1,])
(m1 = km1$centers[1])
sum((c1 - m1)^2)

#sum all within cluster sum sq differences
km1$tot.withinss
km1$withinss ; sum(km1$withinss)

#between each cluster centerioids
km1$betweenss
km1$centers
diff(km1$centers)
(comb1 = combn(km1$centers,2))
(diff1 = apply(comb1, 2, diff))
diff1^2
sum(diff1^2)

c(diff(km1$centers))
sum(as.numeric(dist(km1$centers))^2)

sum((abs(apply(combn(km1$centers,2), 2, diff))^2))

#total distance : tot.within + between
km1$totss
km1$tot.withinss + km1$betweenss

#Other Output of Algo
#Centeriod
km1$centers
#Size of each cluster
km1$size
#Total SS Distance
km1$totss

#Plot the Clusters
#dim of plot should > 2
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



#doing with 2 variables
(df2=women)
km2 = kmeans(df2, 3)
str(km2)
df2$cluster=factor(km2$cluster)
fviz_cluster(km2, data = df2[1:2], geom = "point", stand = FALSE, ellipse.type = "norm") # 2 cols required

clusplot(df2, km2$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)
animation::kmeans.ani(df2[1:2],3)
(centers=as.data.frame(km2$centers))

g= ggplot(data=df2[1:3], aes(x=height, y=weight, color=cluster,size=10 )) + geom_point()
g
g + geom_point(data=centers, aes(x=height,y=weight, colour=unique(df2$cluster)), size=67, alpha=.3) + theme(legend.position = "none")

