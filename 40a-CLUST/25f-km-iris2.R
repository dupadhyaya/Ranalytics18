# Clustering 1 ####
# Types - k menas with kmeans
# kmediods with pam() and pamk()
#hierarchical clustering
# density based clustering with DBScan
#KMEANS

set.seed(8953)
iris2 = iris
iris2
head(iris2)
iris2$Species = NULL  # remove values
str(iris2)
(kmeans.result = kmeans(iris2,3))
head(iris2)
#check clustering against class labels Species
kmeans.result$cluster
table(iris$Species,kmeans.result$cluster)
#class setosa is distinct, other 2 are overlapping
plot(iris2[c("Sepal.Length", "Sepal.Width")], col = kmeans.result$cluster)
points(kmeans.result$centers[, c("Sepal.Length", "Sepal.Width")],
       col = 1:3, pch = 8, cex = 2) # plot cluster centers
