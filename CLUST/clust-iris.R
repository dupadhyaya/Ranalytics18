# Clustering - IRIS data set

head(iris)
irisFeatures = iris[-5]
iriskm1 = kmeans(irisFeatures,3)
iriskm1$size # no of rows in in each cluster
iriskm1$cluster # row no to clusters
plot(irisFeatures$Sepal.Length, col=iriskm1$cluster)
plot(irisFeatures$Sepal.Length, col=1:3)

km  # understand the output

#Method2 - Scaling 
irisFeatures2 = irisFeatures
scaleiris = scale(irisFeatures2) # scaling dataset if they are in different range
head(scaleiris) #use this scaleiris for kmeans and plots; this becomes data
irisKM = kmeans(scaleiris, 2)
irisKM$cluster

library(fpc)
library(cluster)
clusplot(scaleiris, irisKM$cluster, color= T, lines=0)
# using PCA technique - finds most Principal Components

#Method3
irisKM2 = kmeans(scaleiris, 3, iter.max= 5)
irisKM2
clusplot(scaleiris, irisKM2$cluster, color=T, lines=0)  
