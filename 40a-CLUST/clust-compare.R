# compare different clustering methods using cluster.stat from the fpc package.

library(fpc)
#Perform the following steps to compare clustering methods.

#install.packages("fpc")

#You then need to use hierarchical clustering with the single method to cluster customer data and generate the object hc_single

single_c = hclust(dist(iris[,1:4]), method="single")
plot(single_c)

hc_single = cutree(single_c, k=3)

#Use hierarchical clustering with the complete method to cluster customer data and generate the object hc_complete

complete_c = hclust(dist(iris[,1:4]), method="complete")

(hc_complete = cutree(complete_c, k=3))

#You can then use k-means clustering to cluster customer data and generate the object km

set.seed(1234)
km = kmeans(iris[1:4], 3, iter.max=1000, algorithm=c("Forgy"))

#Next, retrieve the cluster validation statistics of either clustering method:
  
cs = cluster.stats(dist(iris[1:4]), km$cluster)
cs
#Most often, we focus on using within.cluster.ss and avg.silwidth to validate the clustering method. The within.cluster.ss measurement stands for the within clusters sum of squares, and avg.silwidth represents the average silhouette width.

#within.cluster.ss measurement shows how closely related objects are in clusters; the smaller the value, the more closely related objects are within the cluster.
#avg.silwidth is a measurement that considers how closely related objects are within the cluster and how clusters are separated from each other. The silhouette value usually ranges from 0 to 1; a value closer to 1 suggests the data is better clustered.
cs[c("within.cluster.ss","avg.silwidth")]

#Finally, we can generate the cluster statistics of each clustering method and list them in a table:

cluster.stats(dist(iris[1:4]), km$cluster)[c("within.cluster.ss","avg.silwidth")] 
cluster.stats(dist(iris[1:4]), hc_single)[c("within.cluster.ss","avg.silwidth")] 
cluster.stats(dist(iris[1:4]), hc_complete)[c("within.cluster.ss","avg.silwidth")] 


sapply(list(kmeans = km$cluster, hc_single = hc_single, hc_complete = hc_complete),  function(c) cluster.stats(dist(iris[1:4]), c)[c("within.cluster.ss","avg.silwidth")])

        
#https://en.proft.me/2017/01/29/exploring-hierarchical-clustering-r/
