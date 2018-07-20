#Clustering - iris Data Set

?iris
head(iris)
library(dplyr)
str(iris)
iris %>% group_by(Species) %>% summarise_all(mean)

head(iris[,1:4])

irisFeatures = iris[-5]
head(irisFeatures)
names(irisFeatures)

iriskm1 = kmeans(irisFeatures,3)

iriskm1$size # no of rows in in each cluster
iriskm1$cluster # row no to clusters
plot(irisFeatures$Sepal.Length, col=iriskm1$cluster)
plot(irisFeatures$Sepal.Width, col=iriskm1$cluster)

head(irisFeatures)
iriskm1$cluster
cbind(irisFeatures,  iriskm1$cluster, iris$Species)


km  # understand the output

#Method2 - Scaling 
irisFeatures2 = irisFeatures
scaleiris = scale(irisFeatures2) # scaling dataset if they are in different range
head(scaleiris) #use this scaleiris for kmeans and plots; this becomes data
irisKM = kmeans(scaleiris, 3)
irisKM$cluster

library(fpc)
library(cluster)
clusplot(scaleiris, irisKM$cluster, color= T, lines=0)
# using PCA technique - finds most Principal Components

#Method3
irisKM2 = kmeans(scaleiris, 3, iter.max= 5)
irisKM2
clusplot(scaleiris, irisKM2$cluster, color=T, lines=0)  
