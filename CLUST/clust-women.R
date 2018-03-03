#Clustering on women data set
#http://dni-institute.in/blogs/k-means-clustering-algorithm-explained/
library(cluster)
library(fpc)

data(women)
df = women
set.seed(101)
wc1 = kmeans(df, centers=3, iter.max=1)
wc1

set.seed(101)
wc2 = kmeans(df, centers=3, iter.max=5)
wc2

# Plot
plot(df,col=wc2$cluster)
points(wc2$center,col=1:2,pch=8,cex=1)

fpc::plotcluster(df, wc2$cluster)

#plot(df, wc2)
cluster::clusplot(df, wc2$cluster, color=TRUE, shade=TRUE, 
         labels=3, lines=1)
points(wc2$centers, col = 1:2, pch = 15, cex = 5)

with(df, pairs(df, col=c(1:3)[wc2$cluster])) 
