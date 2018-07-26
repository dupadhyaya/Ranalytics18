# Clustering - Number of Clusters

income = ceiling(runif(100,60,100))
age = ceiling(rnorm(100, 35,5))

df = data.frame(income, age)
head(df)
data = scale(df)

fit.km3 = kmeans(data,centers=3)
fit.km3$tot.withinss
fit.km4 = kmeans(data,centers=4)
fit.km4$tot.withinss
fit.km10 = kmeans(data,centers=10)
fit.km10$tot.withinss

# Second set of data
n = 100; g = 6 
set.seed(g)
d <- data.frame(x = unlist(lapply(1:g, function(i) rnorm(n/g, runif(1)*i^2))), y = unlist(lapply(1:g, function(i) rnorm(n/g, runif(1)*i^2))))
d
plot(d)

data=d

#Selecting the number of clusters
library(NbClust)
nc = NbClust(data, distance="euclidean", 
              min.nc=2, max.nc=15, method="average")
par(opar)
table(nc$Best.n[1,])
barplot(table(nc$Best.n[1,]), xlab="Numer of Clusters", ylab="Number of Criteria", main="Number of Clusters Chosen by 26 Criteria") 

#Method2
wss <- (nrow(data)-1)*sum(apply(data,2,var))
for (i in 2:15) wss[i] <- sum(kmeans(data,
   centers=i)$withinss)
plot(1:15, wss, type="b", xlab="Number of Clusters",
     ylab="Within groups sum of squares")


#Method : usin PAM
library(fpc)
pamk.best <- pamk(data)
cat("number of clusters estimated by optimum average silhouette width:", pamk.best$nc, "\n")
plot(pam(data, pamk.best$nc))


#Method we could also do:Not Working
library(fpc)
asw <- numeric(20)
for(k in 2:20) asw[[k]] = pam(data, k)$silinfo$avg.width
k.best = which.max(asw)
cat("silhouette-optimal number of clusters:", k.best, "\n")

#Method----
require(vegan)
fit <- cascadeKM(scale(data, center = TRUE,  scale = TRUE), 1, 10, iter = 1000)
plot(fit, sortg = TRUE, grpmts.plot = TRUE)
calinski.best <- as.numeric(which.max(fit$results[2,]))
cat("Calinski criterion optimal number of clusters:", calinski.best, "\n")
# 3 clusters!

#Method : Bayesian
library(mclust)
# at least 1 model and up 20.
d_clust <- Mclust(as.matrix(data), G=1:20)
d_clust
m.best <- dim(d_clust$z)[2]
cat("model-based optimal number of clusters:", m.best, "\n")
# 4 clusters
plot(d_clust)

#Method----
library(apcluster)
d.apclus <- apcluster(negDistMat(r=2), data)
cat("affinity propogation optimal number of clusters:", length(d.apclus@clusters), "\n")
# 
heatmap(d.apclus)
plot(d.apclus, data)


#Method
library(cluster)
clusGap(data, kmeans, 10, B = 100, verbose = interactive())


#Method
library(NbClust)
nb <- NbClust(data,  distance = "euclidean",  min.nc=2, max.nc=15, method = "kmeans",  index = "alllong", alphaBeale = 0.1)
#diss="NULL" remove
hist(nb$Best.nc[1,], breaks = max(na.omit(nb$Best.nc[1,])))


#Method
d_dist <- dist(as.matrix(data))   # find distance matrix 
plot(hclust(d_dist)) 
clusters <- identify(hclust(d_dist))
clusters


#Method
library(apcluster)
apclus = apcluster(negDistMat(r=2), data)
show(apclus)

sim = corSimMat(data, method="spearman")
apclus = apcluster(s=sim)
apclus


#Method - Weka
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre1.8.0_144')
library(RWeka)

# Print a list of available options for the X-Means algorithm
WOW("XMeans")
WPM("refresh-cache")
WPM("list-packages", "installed")
WPM("list-packages", "available")
WPM("install-package", 'XMeans')
WOW("XMeans")
# Create a Weka_control object which will specify our parameters
weka_ctrl <- Weka_control(
  I = 1000,  # max no. of overall iterations
  M = 1000,  # max no. of iterations in the kMeans loop
  L = 20,    # min no. of clusters
  H = 150,   # max no. of clusters
  D = "weka.core.EuclideanDistance", # dist metric Euclidean
  C = 0.4,   # cutoff factor ???
  S = 12     # random number seed (for reproducibility)
)

# Run the algorithm on your data, d
x_means <- XMeans(data, control = weka_ctrl)

# Assign cluster IDs to original data set
data$xmeans.cluster <- x_means$class_ids
data$xmeans.cluster


#Method
set.seed(2)
x=matrix(rnorm(50*2), ncol=2)
hc.complete = hclust(dist(x), method="complete")
plot(hc.complete)
cutree(hc.complete,k = 2)
cutree(hc.complete,h = 4.9)


#
library(pvclust)
library(MASS)
data(Boston)
boston.pv <- pvclust(Boston)
plot(boston.pv)
