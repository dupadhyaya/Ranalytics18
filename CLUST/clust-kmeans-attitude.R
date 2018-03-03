#Clustering - kmeans 

library(datasets)
data(attitude)
attitude

# Subset the attitude data
dat = attitude[,c(3,4)]

# Plot subset data
plot(dat, main = "% of favourable responses to
     Learning and Privilege", pch =20, cex =2)

# Perform K-Means with 2 clusters
set.seed(7)
km2 = kmeans(dat, 2, nstart=100)
km2$withinss
km2$tot.withinss

# Plot results
plot(dat, col =(km2$cluster +1) , main="K-Means result with 2 clusters", pch=20, cex=2)

km3 = kmeans(dat, 3, nstart=100)
km3$withinss
km3$tot.withinss

# Check for the optimal number of clusters given the data

mydata <- dat
wss <- (nrow(mydata)-1)*sum(apply(mydata,2,var))
for (i in 2:15)
    wss[i] <- sum(kmeans(mydata, centers=i)$withinss)
plot(1:15, wss, type="b", xlab="Number of Clusters", ylab="Within groups sum of squares", main="Assessing the Optimal Number of Clusters with the Elbow Method", pch=20, cex=2)


# Perform K-Means with the optimal number of clusters identified from the Elbow method
set.seed(7)
km6 = kmeans(dat, 6, nstart=100)
km10 = kmeans(dat, 10, nstart=100)

# Examine the result of the clustering algorithm
km6    
km1$tot.withinss; km2$tot.withinss;
km3$tot.withinss; km4$tot.withinss

# Plot results
plot(dat, col =(km6$cluster +1) , main="K-Means result with 6 clusters", pch=20, cex=2)

?kmeans
