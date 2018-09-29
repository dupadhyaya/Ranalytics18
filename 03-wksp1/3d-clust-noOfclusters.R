#Optimal Number of Clusters in data
#Reduce total within ss
iris
head(iris)
table(iris$Species)

data = iris[-5]
head(data)

km1= kmeans(data,centers=1)
km1$withinss
km1$tot.withinss

km2= kmeans(data,centers=2)
km2$tot.withinss
km2$withinss

km3= kmeans(data,centers=3)
km3$tot.withinss

km4= kmeans(data,centers=4)
km4$tot.withinss

km5= kmeans(data,centers=5)
km5$tot.withinss

km1$tot.withinss; km2$tot.withinss ; km3$tot.withinss ; km4$tot.withinss ; km5$tot.withinss

#Selecting the number of clusters
library(NbClust)
nc = NbClust(data, distance="euclidean",min.nc=2, max.nc=15, method="average")
?NbClust
kiris = kmeans(data, centers=3)
kiris$centers

cbind(iris$Species, data, kiris$cluster)
aggregate(cbind(Sepal.Length, Sepal.Width) ~ Species, data=iris, mean)

names(mtcars)
data2 = mtcars[c('mpg','disp','hp','wt')]
head(data2)
nc = NbClust(data2, distance="euclidean",min.nc=2, max.nc=15, method="average")
det(as.matrix(mtcars))
?na.action
km3= kmeans(data,centers=3)
km3$tot.withinss

cbind(km1$tot.withinss, km2$tot.withinss, km3$tot.withinss, km4$tot.withinss,km5$tot.withinss)

#we select no clusters at elbow point
#adding more clusters does not significantly reduce total withinss
