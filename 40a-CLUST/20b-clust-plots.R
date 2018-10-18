# Plotting in Clusters


#Plot1----
library(cluster)
library(fpc)

data(iris)
data = iris[, -5] # without known classification 
# Kmeans cluster analysis
km1 =  kmeans(data, centers=3)
plotcluster(data, km1$cluster)

#Plot2
# More complex
clusplot(data, km1$cluster, color=TRUE, shade=TRUE, 
         labels=2, lines=0)

#plot3
with(iris, pairs(data, col=c(1:3)[km1$cluster])) 

#plot4
X <- data.frame(c1=c(0,1,2,4,5,4,6,7),c2=c(0,1,2,3,3,4,5,5))
km <- kmeans(X, center=2)
plot(X,col=km$cluster)
points(km$center,col=1:2,pch=8,cex=1)





#Plot5----
library(cluster)
library(HSAUR)
data(pottery)
km    <- kmeans(pottery,3)
dissE <- daisy(pottery) 
dE2   <- dissE^2
sk2   <- silhouette(km$cl, dE2)
plot(sk2)





set.seed(1234); (age = ceiling(rnorm(50, 45, 10)))
set.seed(1234);(income = ceiling(rnorm(50, 100000, 10000)))
set.seed(1234);(children = sample(c(1,2,3), size=50, replace=T, prob=c(.4,.3,.2)))
customers = data.frame(age, income, children)
head(customers)

# No of Clusters
library(NbClust)
nc = NbClust(customers, distance="euclidean", 
             min.nc=2, max.nc=15, method="average")
#without scaling
km1 = kmeans(customers, centers=3)
km1$centers


#Fan Plot
library(ape)
library(cluster) 
data(mtcars)
plot(hclust(dist(mtcars)))

plot(as.phylo(hclust(dist(mtcars))),type="fan")


#
# Load data
data(mtcars)
# Compute distances and hierarchical clustering
dd <- dist(scale(mtcars), method = "euclidean")
hc <- hclust(dd, method = "ward.D2")
library(factoextra)
fviz_dend(hc, cex = 0.5)
#You can use the arguments main, sub, xlab, ylab to change plot titles as follow:
  
fviz_dend(hc, cex = 0.5,  main = "Dendrogram - ward.D2",  xlab = "Objects", ylab = "Distance", sub = "")
#To draw a horizontal dendrogram, type this:
  
fviz_dend(hc, cex = 0.5, horiz = TRUE)

fviz_dend(hc, k = 4, # Cut in four groups
          cex = 0.5, # label size
          k_colors = c("#2E9FDF", "#00AFBB", "#E7B800", "#FC4E07"),
          color_labels_by_k = TRUE, # color labels by groups
          rect = TRUE, # Add rectangle around groups
          rect_border = c("#2E9FDF", "#00AFBB", "#E7B800", "#FC4E07"), 
          rect_fill = TRUE)

fviz_dend(hc, k = 4,                 # Cut in four groups
          cex = 0.5,                 # label size
          k_colors = c("#2E9FDF", "#00AFBB", "#E7B800", "#FC4E07"),
          color_labels_by_k = TRUE,  # color labels by groups
          ggtheme = theme_gray()     # Change theme
)
fviz_dend(hc, cex = 0.5, k = 4, # Cut in four groups
          k_colors = "jco")

fviz_dend(hc, cex = 0.5, k = 4, # Cut in four groups
          k_colors = "jco", horiz=T)

fviz_dend(hc, k = 4, cex = 0.4, horiz = TRUE,  k_colors = "jco", 
          rect = TRUE, rect_border = "jco", rect_fill = TRUE)

fviz_dend(hc, cex = 0.5, k = 4, 
          k_colors = "jco", type = "circular")

require("igraph")
fviz_dend(hc, k = 4, k_colors = "jco",
          type = "phylogenic", repel = TRUE)

require("igraph")
fviz_dend(hc, k = 4, # Cut in four groups
          k_colors = "jco",
          type = "phylogenic", repel = TRUE,
          phylo_layout = "layout.gem")


#zoom in dendrogram
fviz_dend(hc)
fviz_dend(hc, xlim = c(1, 20), ylim = c(0, 5))
fviz_dend(hc, xlim = c(0, 10), ylim = c(-2, 5))

#subtree
# Create a plot of the whole dendrogram,
# and extract the dendrogram data
dend_plot <- fviz_dend(hc, k = 4, # Cut in four groups
                       cex = 0.5, # label size
                       k_colors = "jco")
dend_plot
dend_data <- attr(dend_plot, "dendrogram") # Extract dendrogram data
dend_data
# Cut the dendrogram at height h = 10
dend_cuts <- cut(dend_data, h = 10)
# Visualize the truncated version containing
# two branches
fviz_dend(dend_cuts$upper)
attributes(dend_cuts)
dend_cuts
#Plot subtree 1
fviz_dend(dend_cuts$lower[[1]], main = "Subtree 1")
# Plot subtree 2
fviz_dend(dend_cuts$lower[[2]], main = "Subtree 2")
fviz_dend(dend_cuts$lower[[3]])
# Plot the whole dendrogram
print(dend_plot)

fviz_dend(dend_cuts$lower[[2]], type = "circular")

#
pdf("dendrogram.pdf", width=30, height=15)            # Open a PDF
p <- fviz_dend(hc, k = 4, cex = 1, k_colors = "jco" ) # Do plotting
print(p)
dev.off()                                             # Close the PDF
#http://www.sthda.com/english/articles/28-hierarchical-clustering-essentials/92-visualizing-dendrograms-ultimate-guide/
  
#using chain operat
data <- scale(mtcars)
dist.res <- dist(data)
hc <- hclust(dist.res, method = "ward.D2")
dend <- as.dendrogram(hc)
plot(dend)
#R code for creating a dendrogram using chaining operator:
library(dendextend)
dend  
mtcars[1:8,] %>% # data
  scale %>% # Scale the data
  dist %>% # calculate a distance matrix, 
  hclust(method = "ward.D2") %>% # Hierarchical clustering 
  as.dendrogram %>% # Turn the object into a dendrogram.
  plot

#-
library(dendextend)
# 1. Create a customized dendrogram
mycols <- c("#2E9FDF", "#00AFBB", "#E7B800", "#FC4E07")
dend <-  as.dendrogram(hc) %>%
  set("branches_lwd", 5) %>% # Branches line width
  set("branches_k_color", mycols, k = 4) %>% # Color branches by groups
  set("labels_colors", mycols, k = 4) %>%  # Color labels by groups
  set("labels_cex", 0.8) # Change label size
# 2. Create plot 
fviz_dend(dend, horiz=T) 

#radial Plot
library(dendextend)
library(circlize)

# create a dendrogram
hc <- hclust(dist(datasets::mtcars))
dend <- as.dendrogram(hc)

# modify the dendrogram to have some colors in the branches and labels
dend <- dend %>% 
  color_branches(k=4) %>% 
  color_labels

# plot the radial plot
par(mar = rep(0,4))
# circlize_dendrogram(dend, dend_track_height = 0.8) 
circlize_dendrogram(dend, labels_track_height = NA, dend_track_height = .2) 
#increase the size of windows 


#https://rdrr.io/cran/GOplot/man/GOCluster.html
library(GOplot)

#-------

#dendrogram with distance
mat <- matrix(abs(rnorm(100)),10,10)
dimnames(mat) <- list(letters[1:10],letters[1:10])
ma2 <- as.dist(mat)
hc <- hclust(ma2)
dend <- as.dendrogram(hc)

par(mfrow=c(1,2))

plot(dend)

require(circlize)
require(dendextend)

#Get the heights for each branch
heights <- round(get_branches_heights(dend, sort=FALSE), 1)

#Get max height
maxHeight= max(heights)

#Set label and dendrogram height for cicular dendrogram
labelHeight=0.1
dendHeight=0.8

#Draw the circular dendrogram
circlize_dendrogram(dend, facing="outside", labels=TRUE, labels_track_height=labelHeight, dend_track_height=dendHeight)

#Create tick co-ordinates and values for the new axis
#We have to enure that we don't overlap the label plot region (height specified by labelHeight), nor the central region of the plot (1-(dendHeight+labelHeight))
ticks <- seq(from=(1-(dendHeight+labelHeight)), to=(1-labelHeight), length.out=5)
values <- round(rev(seq(from=0, to=maxHeight, length.out=5)), 1)

#Add the new axis
require(plotrix)
ablineclip(h=0, v=ticks, col="black", x1=1-(dendHeight+labelHeight), x2=1-labelHeight, y1=0, y2=0.04, lwd=1.5)
text(ticks, 0+0.08, values, cex=0.8)
text((1-labelHeight)-(((1-labelHeight)-(1-(dendHeight+labelHeight)))/2), 0+0.14, "Height", cex=0.8)
