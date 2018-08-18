# Clustering - IRIS data set

head(iris)
str(iris$Species)
table(iris$Species)
irisFeatures = iris[,-5]
head(irisFeatures)
iriskm1 = kmeans(irisFeatures,centers=3)
iriskm1
iriskm1$centers
colMeans(irisFeatures[iriskm1$cluster==1,])
iriskm1$iter
(iris[iriskm1$cluster==1,])

iriskm1$size # no of rows in in each cluster
iriskm1$cluster # row no to clusters
plot(irisFeatures$Sepal.Length, col=iriskm1$cluster)
plot(irisFeatures$Sepal.Length, col=1:3)
x= cbind(irisFeatures, cl=iriskm1$cluster, cat=iris$Species)
head(x)
x
iriskm1  # understand the output

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

