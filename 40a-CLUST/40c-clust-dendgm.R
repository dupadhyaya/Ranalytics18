# Dendrograms - Hierarchical Clustering


# Load data
data(USArrests)
# Compute distances and hierarchical clustering
dd <- dist(scale(USArrests), method = "euclidean")
hc <- hclust(dd, method = "ward.D2")
hc

#plot(x, labels = NULL, hang = 0.1, main = "Cluster dendrogram", sub = NULL,   xlab = NULL, ylab = "Height")

# Default plot
plot(hc)

# Put the labels at the same height: hang = -1
plot(hc, hang = -1, cex = 0.6)

# Convert hclust into a dendrogram and plot
hcd <- as.dendrogram(hc)
# Default plot
plot(hcd, type = "rectangle", ylab = "Height")

# Triangle plot
plot(hcd, type = "triangle", ylab = "Height")

# Zoom in to the first dendrogram
plot(hcd, xlim = c(1, 20), ylim = c(1,8))

# Define nodePar
nodePar <- list(lab.cex = 0.6, pch = c(NA, 19), 
                cex = 0.7, col = "blue")
# Customized plot; remove labels
plot(hcd, ylab = "Height", nodePar = nodePar, leaflab = "none")

# Horizontal plot
plot(hcd,  xlab = "Height",
     nodePar = nodePar, horiz = TRUE)

# Change edge color
plot(hcd,  xlab = "Height", nodePar = nodePar, 
     edgePar = list(col = 2:3, lwd = 2:1))

# install.packages("ape")
library("ape")
# Default plot
plot(as.phylo(hc), cex = 0.6, label.offset = 0.5)


Cladogram
plot(as.phylo(hc), type = "cladogram", cex = 0.6, 
     label.offset = 0.5)

# Unrooted
plot(as.phylo(hc), type = "unrooted", cex = 0.6,
     no.margin = TRUE)

# Fan
plot(as.phylo(hc), type = "fan")

# Radial
plot(as.phylo(hc), type = "radial")

# Cut the dendrogram into 4 clusters
colors = c("red", "blue", "green", "black")
clus4 = cutree(hc, 4)
plot(as.phylo(hc), type = "fan", tip.color = colors[clus4],
     label.offset = 1, cex = 0.7)

# Change the appearance
# change edge and label (tip)
plot(as.phylo(hc), type = "cladogram", cex = 0.6,
     edge.color = "steelblue", edge.width = 2, edge.lty = 2,
     tip.color = "steelblue")

install.packages("ggdendro")

library("ggplot2")
library("ggdendro")

# Visualization using the default theme named theme_dendro()
ggdendrogram(hc)

# Rotate the plot and remove default theme
ggdendrogram(hc, rotate = TRUE, theme_dendro = FALSE)

# Build dendrogram object from hclust results
dend <- as.dendrogram(hc)
# Extract the data (for rectangular lines)
# Type can be "rectangle" or "triangle"
dend_data <- dendro_data(dend, type = "rectangle")
# What contains dend_data
names(dend_data)

# Extract data for line segments
head(dend_data$segments)

# Extract data for labels
head(dend_data$labels)

# Plot line segments and add labels
p <- ggplot(dend_data$segments) + 
  geom_segment(aes(x = x, y = y, xend = xend, yend = yend))+
  geom_text(data = dend_data$labels, aes(x, y, label = label),
            hjust = 1, angle = 90, size = 3)+
  ylim(-3, 15)
print(p)


data <- scale(USArrests)
dist.res <- dist(data)
hc <- hclust(dist.res, method = "ward.D2")
dend <- as.dendrogram(hc)
plot(dend)

dend <- USArrests[1:5,] %>% # data
  scale %>% # Scale the data
  dist %>% # calculate a distance matrix, 
  hclust(method = "ward.D2") %>% # Hierarchical clustering 
  as.dendrogram # Turn the object into a dendrogram.
plot(dend)

library(dendextend)
Create a dendrogram and plot it
dend <- USArrests[1:5,] %>%  scale %>% 
  dist %>% hclust %>% as.dendrogram
dend %>% plot

# Change the labels, and then plot:
dend %>% set("labels", c("a", "b", "c", "d", "e")) %>% plot

# Change color and size for labels
dend %>% set("labels_col", c("green", "blue")) %>% # change color
  set("labels_cex", 2) %>% # Change size
  plot(main = "Change the color \nand size") # plot

# Color labels by specifying the number of cluster (k)
dend %>% set("labels_col", value = c("green", "blue"), k=2) %>% 
  plot(main = "Color labels \nper cluster")
abline(h = 2, lty = 2)






library(pvclust)
data(lung) # 916 genes for 73 subjects
set.seed(1234)
result <- pvclust(lung[1:100, 1:10], method.dist="cor", 
                  method.hclust="average", nboot=10)
# Default plot of the result
plot(result)
pvrect(result)

# pvclust and dendextend
result %>% as.dendrogram %>% 
  set("branches_k_color", k = 2, value = c("purple", "orange")) %>%
  plot
result %>% text
result %>% pvrect


#circular -----
iris <- datasets::iris
iris2 <- iris[,-5]
species_labels <- iris[,5]
library(colorspace) # get nice colors
species_col <- rev(rainbow_hcl(3))[as.numeric(species_labels)]
d_iris <- dist(iris2) # method="man" # is a bit better
hc_iris <- hclust(d_iris, method = "complete")
iris_species <- rev(levels(iris[,5]))

library(dendextend)
dend <- as.dendrogram(hc_iris)
# order it the closest we can to the order of the observations:
dend <- rotate(dend, 1:150)
par(mar = rep(0,4))
par(mar = rep(1,4))
par(mar =c(1,1,1,1))
dend <- hang.dendrogram(dend,hang_height=0.1)
circlize_dendrogram(dend)
