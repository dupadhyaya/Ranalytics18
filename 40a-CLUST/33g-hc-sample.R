#Hierarchical Clustering

hclust()
set.seed(123)
marks = ceiling(rnorm(6, mean=60, sd=10))
m = matrix(marks, nrow=6)
rownames(m) = paste("s",1:6,sep='')
colnames(m) = c('sub1')
m

(d= dist(m))
clust_h = hclust(d)
clust_h
plot(clust_h)
plot(clust_h, hang=-1, cex=.8, main='Average Linkage Clustering')
rect.hclust(clust_h, k=2)
rect.hclust(clust_h, k=3, x=3)
rect.hclust(clust_h, k=3, which=3)
rect.hclust(clust_h, k=3, which=2, border=5)
rect.hclust(clust_h, k=3, which=1, border=6)
rect.hclust(clust_h, k=3, which=c(1,3), border=7)
rect.hclust(clust_h, h=5, which=c(1,2), border=9)

clust_h$height
attributes(clust_h)
names(clust_h)

?rect.hclust

#----
set.seed(123)
x = ceiling(rnorm(20*5, 65,15))
m2 = matrix(x, ncol=5)
rownames(m2) = paste('s',1:20,sep='')
colnames(m2) = paste('sub',1:5,sep='')
head(m2)

#------
d2 = dist(m2)
head(d2)
d2
m2_hclust = hclust(d2)
plot(m2_hclust)
rect.hclust(clust_h, k=4)

plot(m2_hclust, hang=-1,cex=.8)
rect.hclust(m2_hclust, h=60, border=5)

plot(m2_hclust, hang=-1,cex=.8)
rect.hclust(clust_h, k=4, which=2, border='red')

plot(m2_hclust, hang=-1,cex=.8)
abline(h=80,col=3)
rect.hclust(clust_h, h=40, which=c(1,2))

#-----
hca <- hclust(dist(USArrests))
plot(hca,hang=-1)
rect.hclust(hca, k = 3, border = "red")
rect.hclust(hca, h = 50, which = c(2,3,4,7), border = 3:4)

x <- rect.hclust(hca, h = 50, which = c(2,7), border = 3:4)
x
#------

library(fpc)
plotcluster(m, clust_h2$cluster)
plotcluster(m, clust_h2$cluster)
#---
# Ward Hierarchical Clustering with Bootstrapped p values
library(pvclust)
fit <- pvclust(m2, method.hclust="ward.D2",  method.dist="euclidean")
plot(fit) # dendogram with p values
# add rectangles around groups highly supported by the data
pvrect(fit, alpha=.95)

#------
library(factoextra)

clust_h2 = hkmeans(m, 3)
clust_h2
clust_h2$centers
cbind(m, clust_h2$cluster)
# Visualize the tree
fviz_dend(clust_h2, cex = 0.6, palette = "jco", rect = TRUE, rect_border = "jco", rect_fill = TRUE)
# Visualize the final clusters
fviz_cluster(clust_h2, palette = "jco", repel = TRUE, ggtheme = theme_classic())
#needs 2 variables at least
#




# comparing 2 cluster solutions
library(fpc)
cluster.stats(d, fit1$cluster, fit2$cluster)
