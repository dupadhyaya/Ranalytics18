#Clustering Plots

### some sample data
require(vegan)
data(dune)

# kmeans
kclus <- kmeans(dune,centers= 4, iter.max=1000, nstart=10000)

# distance matrix
dune_dist <- dist(dune)

# Multidimensional scaling
cmd <- cmdscale(dune_dist)
head(cmd)

# plot MDS, with colors by groups from kmeans
groups <- levels(factor(kclus$cluster))
ordiplot(cmd, type = "n")
cols <- c("steelblue", "darkred", "darkgreen", "pink")
for(i in seq_along(groups)){
  points(cmd[factor(kclus$cluster) == groups[i], ], col = cols[i], pch = 16)
}

# add spider and hull
ordispider(cmd, factor(kclus$cluster), label = TRUE)
ordihull(cmd, factor(kclus$cluster), lty = "dotted")



#Plot2----
#install.packages("devtools") ## To be able to download packages from github
library(devtools)
#install_github("pablo14/clusplus")
library(clusplus)

## Create k-means model with 3 clusters
fit_mtcars=kmeans(mtcars,3)

## Call the function
plot_clus_coord(fit_mtcars, mtcars)
