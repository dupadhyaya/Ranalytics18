#hier clust - HW

df = data.frame(x= c(1,4,8,6,3,10,7,11,13,2), y= c(5,9,15,2,12, 7,7, 4,10,13))
nrow(df)
rownames(df) = paste('A',1:10,sep='')     
df                  

hc1 = hclust(dist(df))
attributes(hc1)
plot(hc1, hang=-1)

hc2 = hclust(dist(df), method = "ward.D2")
plot(hc2, hang=-1)

hc3 = hclust(dist(df), method = "ave")
plot(hc3, hang=-1)

plot(as.dendrogram(hc3), cex = 0.6,  horiz = TRUE)

# Cut tree into 4 groups
grp <- cutree(hc3, k = 3)
# Number of members in each cluster
table(grp)
# Get the names for the members of cluster 2
rownames(df)[grp == 2]

plot(hc3, cex = 0.6)
rect.hclust(hc3, k = 3, border = 2:5)
# Cut agnes() tree into 4 groups
ct = cutree(hc3, k = 2)


plot(hc3, cex = 0.6)
rect.hclust(hc3, k = 3, border = 2:5)

#best number of clusters
library(NbClust)
nc = NbClust(data, distance="euclidean",  min.nc=2, max.nc=15, method="average")
