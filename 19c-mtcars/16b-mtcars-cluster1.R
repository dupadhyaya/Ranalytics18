#Clustering on mtcars

head(mtcars)

#kmeans - select only few column to group them
df = mtcars[, c('mpg', 'cyl', 'wt')]
head(df)
km3 = kmeans(df, centers=3)
km3
km3$centers  #average of each cluster
km3$size  #how many into each cluster


#Plotting Clusters
library(cluster)
library(fpc)

plotcluster(df, km3$cluster)

#Plot2:  PCA
clusplot(df, km3$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)


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
table(mtcars$gear)
table(mtcars$cyl)
table(mtcars$carb)

summary(mtcars)



