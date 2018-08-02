# Choosing K


# OutL2 is the dataset we are working with
iris
summary(iris)
df = iris[-5]
head(df)
# We take the first iteration
wss <- sum(kmeans(df,centers=1)$withinss)
wss

k1 = kmeans(df,3)
k1

k1$withinss  # k=3
k1$tot.withinss  # sum for all k
#tot.withinss = sum(withinss)
(tot.withinss = sum(k1$withinss))

k1$betweenss #1-2, 1-3, 2-3
k1$tot.withinss #as above
k1$totss #
#totss = tot.withinss + betweenss
(totss = k1$tot.withinss + k1$betweenss)


k1$size
k1$iter
k1$centers


# We take iteration 2 to 15
for (i in 2:15) wss[i] <- sum(kmeans(df,centers=i)$withinss)
wss

# We plot the 15 withinss values. One for each k
plot(1:15, wss, type="b", xlab="Number of Clusters",ylab="Within groups sum of squares")


library(cluster)
set.seed(1234)
fit.pam2 = pam(df, k=3, stand=TRUE)
fit.pam2$medoids
clusplot(fit.pam2, main='Bivariate Cluster Plot')
#plot of 1st two PC derived from PCA
summary(fit.pam2)
names(fit.pam2)


