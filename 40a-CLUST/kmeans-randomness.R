#kmeans - everytime new values of withinss
#https://rpubs.com/mohammadshadan/273129
# Set up 2 x 3 plotting grid

par(mfrow = c(2, 3))

# Set seed
set.seed(1)
(x = iris[,1:2])
for(i in 1:6) {
  # Run kmeans() on x with three clusters and one start
  km.out <- kmeans(x, centers=3, nstart=1)
  
  # Plot clusters
  plot(x, col = km.out$cluster, 
       main = km.out$tot.withinss, 
       xlab = "", ylab = "")
}
url <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_1903/datasets/WisconsinCancer.csv"

#Download the data: wisc.df
wisc.df <- read.csv(url)
head(wisc.df)
# Convert the features of the data: wisc.data
wisc.data <- as.matrix(wisc.df[3:32])

# Set the row names of wisc.data
row.names(wisc.data) <- wisc.df$id
head(wisc.data)
# Create diagnosis vector
diagnosis <- as.numeric(wisc.df$diagnosis == "M")
head(diagnosis)
colnames(wisc.data)
length(grep("_mean", colnames(wisc.data)))
colnames(wisc.data)[(grep("_mean", colnames(wisc.data)))]
table(diagnosis)

# Execute PCA, scaling if appropriate: wisc.pr
wisc.pr <- prcomp(wisc.data, scale=TRUE)

# Look at summary of results
summary(wisc.pr)

# Create a biplot of wisc.pr
biplot(wisc.pr)
# Scatter plot observations by components 1 and 2
plot(wisc.pr$x[, c(1, 2)], col = (diagnosis + 1), 
     xlab = "PC1", ylab = "PC2")
# Repeat for components 1 and 3
plot(wisc.pr$x[, c(1, 3)], col = (diagnosis + 1), 
     xlab = "PC1", ylab = "PC3")
# Do additional data exploration of your choosing below (optional)
plot(wisc.pr$x[, c(1, 4)], col = (diagnosis + 1), 
     xlab = "PC1", ylab = "PC3")

par(mfrow = c(1, 2))

# Calculate variability of each component
pr.var <- wisc.pr$sdev^2

# Variance explained by each principal component: pve
pve <- pr.var/sum(pr.var)

# Plot variance explained for each principal component
plot(pve, xlab = "Principal Component", 
     ylab = "Proportion of Variance Explained", 
     ylim = c(0, 1), type = "b")

# Plot cumulative proportion of variance explained
plot(cumsum(pve), xlab = "Principal Component", 
     ylab = "Cummulative Proportion of Variance Explained", 
     ylim = c(0, 1), type = "b")

wisc.pr$rotation[rownames(wisc.pr$rotation)=="concave.points_mean",]

wisc.pr$rotation[rownames(wisc.pr$rotation)=="concave.points_mean",][1]

round(colMeans(wisc.data),1)

# Scale the wisc.data data: data.scaled
data.scaled <- scale(wisc.data)

# Calculate the (Euclidean) distances: data.dist
data.dist <- dist(data.scaled)

# Create a hierarchical clustering model: wisc.hclust
wisc.hclust <- hclust(data.dist, method="complete")
plot(wisc.hclust)

# Cut tree so that it has 4 clusters: wisc.hclust.clusters
wisc.hclust.clusters <- cutree(wisc.hclust, k=4)

# Compare cluster membership to actual diagnoses
table(wisc.hclust.clusters, diagnosis)
