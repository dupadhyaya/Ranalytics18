#Clustering on mtcars

#kmeans - select only few column to group them
df = mtcars[, c('mpg', 'cyl', 'wt')]
km1 <- kmeans(df, centers=3)
km1
km1$centers  #average of each cluster
km1$size  #how many into each cluster




#Plotting Clusters
library(cluster)
library(fpc)

plotcluster(df, km1$cluster)

#Plot2
clusplot(df, km1$cluster, color=TRUE, shade=TRUE, 
         labels=2, lines=0)


#2nd Set
#kmeans - select only few column to group them

df = mtcars[, c('mpg', 'cyl', 'wt')]
km2 <- kmeans(df, centers=2)
km2
km2$centers  #average of each cluster
km2$size  #how many into each cluster

cbind(df, mtcars$am, km2$cluster)



df = mtcars[, c('mpg', 'cyl', 'wt')]
km4 <- kmeans(df, centers=4)
km4
km4$centers  #average of each cluster
km4$size  #how many into each cluster
cbind(df, mtcars$gear, km4$cluster)





