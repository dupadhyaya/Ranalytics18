library(animation)
df = mtcars
data = df[c('mpg','wt')]
str(data)
#kmeans.ani - function provides a demo of the k-Means cluster algorithm for data containing only two variables (columns).
plot(scale(data))
km = kmeans(scale(data),3)
plot(scale(data), col=1:km$cluster)
plotcluster(data, km$cluster)
plotcluster(scale(data), km$cluster)
clusplot(data, km$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)
clusplot(scale(data), km$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)


km2= kmeans.ani(scale(data), 3)
km2
km$cluster == km2$cluster
cbind(km$cluster, km2$cluster)
km$tot.withinss 
km$centers;km2$centers