# Clustering

data <- read.csv("E:/rWork/Projects/edm/studentdata.csv")
str(data1)
data1 = data[-(1:6)]
sdata1 = data.frame(scale(data[-(1:6)]))
str(sdata1)
# K-Means
k.means.fit <- kmeans(sdata1, 5) # k = 5 clusters
attributes(k.means.fit)

# Centroids:
k.means.fit$centers

# Clusters:
k.means.fit$cluster
# Cluster size:
k.means.fit$size

wssplot <- function(data, nc=15, seed=1234){
  wss <- (nrow(data)-1)*sum(apply(data,2,var))
  for (i in 2:nc){
    set.seed(seed)
    wss[i] <- sum(kmeans(data, centers=i)$withinss)}
  plot(1:nc, wss, type="b", xlab="Number of Clusters",
       ylab="Within groups sum of squares")}

wssplot(sdata1, nc=6) 

library(cluster)
clusplot(sdata1, k.means.fit$cluster,  color=TRUE, shade=TRUE,
         main='2D representation of the Cluster solution',
        labels=2, lines=0)
# which student in which cluster
table(data1[,1],k.means.fit$cluster)

# Hierarchical
d <- dist(sdata1, method = "euclidean") # Euclidean distance matrix.
H.fit <- hclust(d, method="ward.D2")

plot(H.fit) # display dendogram
groups <- cutree(H.fit, k=5) # cut tree into 5 clusters
# draw dendogram with red borders around the 5 clusters
rect.hclust(H.fit, k=5, border="red") 
table(data1[,1],groups)


# Clustering 2 Method

library(NbClust)
nb = NbClust(sdata1,
             distance='euclidean', min.nc=2,
             max.nc=15, method='average')
par(mfrow=c(1,1))
barplot(nb$Best.n[1, ], xlab='No of Clusters', 
        ylab='No of Criteria', main='No of Clusters Chosen by 26 Criteria')
library(flexclust)
d = dist(sdata1)
fit.average = hclust(d, method = 'average')
plot(fit.average, hang=-1, cex=.8,
     main='Average Linkage Clustering')
clusters = cutree(fit.average, k=2)
sort(clusters)
table(clusters)
aggregate(data1,
          by=list(cluster=clusters), median)
aggregate(as.data.frame(sdata1),
          by=list(cluster=clusters), median)
x=2
plot(fit.average, hang=-1, cex=.8, main=paste( 'Average Linkage Clustering \n', x,   'Cluster Solution'))
rect.hclust(fit.average, k=2)


#Pam
#
str(data)
fit.pam = pam(data[-(1:6)], k=2, stand=T)
fit.pam
fit.pam$medoids
clusplot(fit.pam, main='Bivariate Cluster Plot')
ct.pam = table(data$course,
               fit.pam$clustering)
ct.pam
randIndex(ct.pam)

