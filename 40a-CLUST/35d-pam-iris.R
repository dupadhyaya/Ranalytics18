# Clustering 2 : K Mediods ####
#http://www.rdatamining.com/docs/data-clustering-with-r
# cluster is represented with its center in k means algo
#but with object closest to the center of the cluster in the k mediods clustering
# more robusst than k means in presence of outliers
#PAM and CLARA in package cluster, pamk in fpc (cant choose k)
library(fpc)
iris2 = iris
iris2$Species = NULL # making it pure numeric DF
pamk.result = pamk(iris2)
str(iris2)
pamk.result$nc # no of clusters
table(pamk.result$pamobject$clustering,iris$Species)
# two clusters - setso and mixture of versi& virgin
layout(matrix(c(1,2),1,2)) # 2 graphs per page
plot(pamk.result$pamobject)
# left - 2 dim clusplot of 2 clusters & lines shows distance betw clusters
# right - silhouetters higher s more cluster
layout(matrix(1)) # reverse layout

#pam
library(cluster)
pam.result = pam(iris2,3) # k=3
table(pam.result$clustering,iris$Species)
# cluster 1 seperated from 2 & 3
# cluster 2 mainly made of versicolor
# cluster 3 mainly of virigina
layout(matrix(c(1,2),1,2))
plot(pam.result)
layout(matrix(1)) # reverse layout
# 3 Clusters identified 

# Hierarchical Clustering ####
set.seed(2835)
idx = sample(1:dim(iris)[1],40)
idx
irisSample = iris[idx,]
# remove class label
irisSample$Species = NULL
# hierarchical clustering
hc = hclust((dist(irisSample)),method='ave')
# plot clusters
plot(hc,hang=-1,labels = iris$Species[idx])
# cut tree into 3 clusters
rect.hclust(hc,k=3)
# get clusterids
groups = cutree(hc,k=3)

# Density Based Clustering
#DBSCAN min points, reachability
library(fpc)
iris2 = iris[-5] # remove class tags
str(iris2)
ds = dbscan(iris2, eps=0.42, MinPts = 5)
ds
table(ds$cluster,iris$Species)
# 1 to 3 identified clusters; 0 due to noise
plot(ds,iris2)
plot(ds,iris2[c(1,2)])
plotcluster(iris2, ds$cluster)


# Prediction with Clustering Model
set.seed(435)
idx = sample(1:nrow(iris),10)
idx
# remove class label
new.data = iris[idx,-5]
head(new.data)
# add random noise
new.data = new.data + matrix(runif(10*4,min=0,max=0.2),nrow=10,ncol=4)
head(new.data)
#label new data
pred = predict(ds,iris2, new.data)
pred
table(pred, iris$Species[idx]) # check cluster labels
# 3 + 3 + 2 = 8 out of 10 objects assigned with correct classes labels
plot(iris2[c(1,4)],col=1 + ds$cluster)
points(new.data[c(1,4)], pch='+',col=1+pred,cex=3)
