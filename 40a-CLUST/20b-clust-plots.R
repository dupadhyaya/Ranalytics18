# Plotting in Clusters


#Plot1----
library(cluster)
library(fpc)

data(iris)
iris4 <- iris[, -5] # without known classification 
# Kmeans cluster analysis
km1 =  kmeans(iris4, centers=3)
plotcluster(iris4, km1$cluster)

#Plot2
# More complex
clusplot(dat, clus$cluster, color=TRUE, shade=TRUE, 
         labels=2, lines=0)

#plot3
with(iris, pairs(dat, col=c(1:3)[clus$cluster])) 

#plot4
X <- data.frame(c1=c(0,1,2,4,5,4,6,7),c2=c(0,1,2,3,3,4,5,5))
km <- kmeans(X, center=2)
plot(X,col=km$cluster)
points(km$center,col=1:2,pch=8,cex=1)





#Plot5----
library(cluster)
library(HSAUR)
data(pottery)
km    <- kmeans(pottery,3)
dissE <- daisy(pottery) 
dE2   <- dissE^2
sk2   <- silhouette(km$cl, dE2)
plot(sk2)





set.seed(1234); (age = ceiling(rnorm(50, 45, 10)))
set.seed(1234);(income = ceiling(rnorm(50, 100000, 10000)))
set.seed(1234);(children = sample(c(1,2,3), size=50, replace=T, prob=c(.4,.3,.2)))
customers = data.frame(age, income, children)
head(customers)

# No of Clusters
library(NbClust)
nc = NbClust(customers, distance="euclidean", 
             min.nc=2, max.nc=15, method="average")
#without scaling
km1 = kmeans(customers, centers=3)
km1$centers