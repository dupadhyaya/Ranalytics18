#Hierarchical Clustering
#http://www.sthda.com/english/wiki/print.php?id=237

#if(!require(devtools)) install.packages("devtools")
devtools::install_github("kassambara/factoextra")
#Install cluster and dendextend packages as follow:
install.packages("cluster")
install.packages("dendextend")
#Load the packages :
library(cluster)
library(dendextend)
library(factoextra)

# Load the data set
data("USArrests")

# Remove any missing value (i.e, NA values for not available)
# That might be present in the data
df <- na.omit(USArrests)
head(df)

# View the firt 6 rows of the data
head(df, n = 6)

#Before hierarchical clustering, we can compute some descriptive statistics:
  
desc_stats <- data.frame(
    Min = apply(df, 2, min), # minimum
    Med = apply(df, 2, median), # median
    Mean = apply(df, 2, mean), # mean
    SD = apply(df, 2, sd), # Standard deviation
    Max = apply(df, 2, max) # Maximum
  )
desc_stats <- round(desc_stats, 1)
head(desc_stats)

#Note that the variables have a large different means and variances. This is explained by the fact that the variables are measured in different units; Murder, Rape, and Assault are measured as the number of occurrences per 100 000 people, and UrbanPop is the percentage of the state’s population that lives in an urban area.

#They must be standardized (i.e., scaled) to make them comparable. Recall that, standardization consists of transforming the variables such that they have mean zero and standard deviation one. You can read more about standardization in the following article: distance measures and scaling.

#As we don’t want the hierarchical clustering result to depend to an arbitrary variable unit, we start by scaling the data using the R function scale() as follow:
  
df <- scale(df)
head(df)
#----
#There are different functions available in R for computing hierarchical clustering. The commonly used functions are:
  
#hclust() [in stats package] and agnes() [in cluster package] for agglomerative hierarchical clustering (HC)
#diana() [in cluster package] for divisive HC

#hclust() function is the built-in R function [in stats package] for computing hierarchical clustering.

#The simplified format is: hclust(d, method = "complete")
#d a dissimilarity structure as produced by the dist() function.
#method: The agglomeration method to be used. Allowed values is one of “ward.D”, “ward.D2”, “single”, “complete”, “average”, “mcquitty”, “median” or “centroid”.

#The dist() function is used to compute the Euclidean distance between observations. Finally, observations are clustered using Ward’s method.

# Dissimilarity matrix
d <- dist(df, method = "euclidean")

# Hierarchical clustering using Ward's method
res.hc <- hclust(d, method = "ward.D2" )

# Plot the obtained dendrogram
plot(res.hc, cex = 0.6, hang = -1)

#The R function agnes() [in cluster package] can be also used to compute agglomerative hierarchical clustering. The R function diana() [ in cluster package ] is an example of divisive hierarchical clustering.

# Agglomerative Nesting (Hierarchical Clustering)
library(cluster)
agnes(x, metric = "euclidean", stand = FALSE, method = "average")

# DIvisive ANAlysis Clustering
diana(x, metric = "euclidean", stand = FALSE)

#x: data matrix or data frame or dissimilarity matrix. In case of matrix and data frame, rows are observations and columns are variables. In case of a dissimilarity matrix, x is typically the output of daisy() or dist().
#metric: the metric to be used for calculating dissimilarities between observations. Possible values are “euclidean” and “manhattan”.
#stand: if TRUE, then the measurements in x are standardized before calculating the dissimilarities. Measurements are standardized for each variable (column), by subtracting the variable’s mean value and dividing by the variable’s mean absolute deviation
#method: The clustering method. Possible values includes “average”, “single”, “complete”, “ward”.
#The function agnes() returns an object of class “agnes” (see ?agnes.object) which has methods for the functions: print(), summary(), plot(), pltree(), as.dendrogram(), as.hclust() and cutree().
#The function diana() returns an object of class “diana” (see ?diana.object) which has also methods for the functions: print(), summary(), plot(), pltree(), as.dendrogram(), as.hclust() and cutree().
#Compared to other agglomerative clustering methods such as hclust(), agnes() has the following features:
  
#  It yields the agglomerative coefficient (see agnes.object) which measures the amount of clustering structure found
#Apart from the usual tree it also provides the banner, a novel graphical display (see plot.agnes).

#R code for computing agnes
library("cluster")
# Compute agnes()
res.agnes <- agnes(df, method = "ward")
# Agglomerative coefficient
res.agnes$ac
## [1] 0.934621
# Plot the tree using pltree()
pltree(res.agnes, cex = 0.6, hang = -1,
       main = "Dendrogram of agnes") 

#It’s also possible to draw AGNES dendrogram using the function plot.hclust() and the function plot.dendrogram() as follow:
  
# plot.hclust()
plot(as.hclust(res.agnes), cex = 0.6, hang = -1)
# plot.dendrogram()
plot(as.dendrogram(res.agnes), cex = 0.6,  horiz = TRUE)

#R code for computing diana
# Compute diana()
res.diana <- diana(df)
# Plot the tree
pltree(res.diana, cex = 0.6, hang = -1, main = "Dendrogram of diana")

# Divise coefficient; amount of clustering structure found
res.diana$dc
## [1] 0.8514345

#As for plotting AGNES dendrogram, the functions plot.hclust() and plot.dendrogram() can be used as follow:
  
# plot.hclust()
plot(as.hclust(res.diana), cex = 0.6, hang = -1)
# plot.dendrogram()
plot(as.dendrogram(res.diana), cex = 0.6, horiz = TRUE)





#------------
#Cut the dendrogram into different groups
#The height of the cut to the dendrogram controls the number of clusters obtained. It plays the same role as the k in k-means clustering.

#The function cutree() is used and it returns a vector containing the cluster number of each observation:
#n the dendrogram displayed above, each leaf corresponds to one observation. As we move up the tree, observations that are similar to each other are combined into branches, which are themselves fused at a higher height.

#The height of the fusion, provided on the vertical axis, indicates the (dis)similarity between two observations. The higher the height of the fusion, the less similar the observations are.

#Note that, conclusions about the proximity of two observations can be drawn only based on the height where branches containing those two observations first are fused. We cannot use the proximity of two observations along the horizontal axis as a criteria of their similarity.

#In order to identify sub-groups (i.e. clusters), we can cut the dendrogram at a certain height as described in the next section.
#The height of the cut to the dendrogram controls the number of clusters obtained. It plays the same role as the k in k-means clustering.

#The function cutree() is used and it returns a vector containing the cluster number of each observation:
  
# Cut tree into 4 groups
grp <- cutree(res.hc, k = 4)
# Number of members in each cluster
table(grp)
# Get the names for the members of cluster 1
rownames(df)[grp == 1]

#It’s also possible to draw the dendrogram with a border around the 4 clusters. The argument border is used to specify the border colors for the rectangles:
  
plot(res.hc, cex = 0.6)
rect.hclust(res.hc, k = 4, border = 2:5)

#using the function fviz_cluster() [in factoextra], we can also visualize the result in a scatter plot. Observations are represented by points in the plot, using principal components. A frame is drawn around each cluster.

library(factoextra)
fviz_cluster(list(data = df, cluster = grp))


#The function cutree() can be used also to cut the tree generated with agnes() and diana() as follow:

# Cut agnes() tree into 4 groups
cutree(res.agnes, k = 4)

# Cut diana() tree into 4 groups
cutree(as.hclust(res.diana), k = 4)

#Hierarchical clustering and correlation based distance
#The different functions for hierarchical clustering use Euclidean distance measures as default metric. It’s also possible to use correlation-based distance measures. Firstly, pairwise correlation matrix between items is computed using the function cor() which can calculate either “pearson”, “spearman” or “kendall” correlation #method. Next, the correlation matrix is converted as a distance matrix and finally clustering can be computed on the resulting distance matrix.

res.cor <- cor(t(df), method = "pearson")
d.cor <- as.dist(1 - res.cor)
plot(hclust(d.cor, method = "ward.D2"), cex = 0.6)


#What type of distance measures should we choose?
#The choice of dissimilarity measures is very important, as it has a strong influence on the resulting dendrogram.

#In many of the examples described above, we used Euclidean distance as the dissimilarity measure. Depending on the type of the data and the researcher questions, other dissimilarity measures might be preferred such as correlation-based distance.

#Correlation-based distance considers two observations to be similar if their features are highly correlated, even though the observed values may be far apart in terms of Euclidean distance.

#If we want to identify clusters of observations with the same overall profiles regardless of their magnitudes, then we should go with correlation-based distance as a dissimilarity measure. This is particularly the case in gene expression data analysis, where we might want to consider genes similar when they are “up” and “down” together. It is also the case, in marketing if we want to identify group of shoppers with the same preference in term of items, regardless of the volume of items they bought.

#If Euclidean distance is chosen, then observations with high values of features will be clustered together. The same holds true for observations with low values of features.


#Note that, when the data are standardized, there is a functional relationship between the Pearson correlation coefficient r(x,y) and the Euclidean distance.

#Comparing two dendrograms
#We’ll use the package dendextend which contains many functions for comparing two dendrograms, including: dend_diff(), tanglegram(), entanglement(), all.equal.dendrogram(), cor.dendlist().

#The function tanglegram() and cor.dendlist() are described in this section.

#A random subset of the dataset will be used in the following example. The function sample() is used to randomly select 10 observations among the 50 observations contained in the data set

# Subset containing 10 rows
set.seed(123)
ss <- sample(1:50, 10)
df <- df[ss,]
#In the R code below, we’ll start by computing pairwise distance matrix using the function dist(). Next, hierarchical clustering (HC) is computed using two different linkage methods (“average” and “ward.D2”). Finally the results of HC are transformed as dendrograms:
  
library(dendextend)
# Compute distance matrix
res.dist <- dist(df, method = "euclidean")

# Compute 2 hierarchical clusterings
hc1 <- hclust(res.dist, method = "average")
hc2 <- hclust(res.dist, method = "ward.D2")

# Create two dendrograms
dend1 <- as.dendrogram (hc1)
dend2 <- as.dendrogram (hc2)

# Create a list of dendrograms
dend_list <- dendlist(dend1, dend2)
# Tanglegram
#The function tanglegram() plots two dendrograms, side by side, with their labels connected by lines. It can be used for visually comparing two methods of Hierarchical clustering as follow:

tanglegram(dend1, dend2)

#Note that “unique” nodes, with a combination of labels/items not present in the other tree, are highlighted with dashed lines.

#The quality of the alignment of the two trees can be measured using the function entanglement(). The output of tanglegram() can be customized using many other options as follow:
  
tanglegram(dend1, dend2, highlight_distinct_edges = FALSE, # Turn-off dashed lines
 common_subtrees_color_lines = FALSE, # Turn-off line colors
 common_subtrees_color_branches = TRUE, # Color common branches 
 main = paste("entanglement =", round(entanglement(dend_list), 2))
  )
#Correlation matrix between a list of dendrogram
#The function cor.dendlist() is used to compute “Baker” or “Cophenetic” correlation matrix between a list of trees.

# Cophenetic correlation matrix
cor.dendlist(dend_list, method = "cophenetic")

# Baker correlation matrix
cor.dendlist(dend_list, method = "baker")


#The correlation between two trees can be also computed as follow:

# Cophenetic correlation coefficient
cor_cophenetic(dend1, dend2)
## [1] 0.9646883
# Baker correlation coefficient
cor_bakers_gamma(dend1, dend2)
## [1] 0.9622885
#It’s also possible to compare simultaneously multiple dendrograms. A chaining operator %>% (available in dendextend) is used to run multiple function at the same time. It’s useful for simplifying the code:
  
# Subset data
set.seed(123)
ss <- sample(1:150, 10 )
# Create multiple dendrograms by chaining
dend1 <- df %>% dist %>% hclust("com") %>% as.dendrogram
dend2 <- df %>% dist %>% hclust("single") %>% as.dendrogram
dend3 <- df %>% dist %>% hclust("ave") %>% as.dendrogram
dend4 <- df %>% dist %>% hclust("centroid") %>% as.dendrogram
# Compute correlation matrix
dend_list <- dendlist("Complete" = dend1, "Single" = dend2,       "Average" = dend3, "Centroid" = dend4)
cors <- cor.dendlist(dend_list)
# Print correlation matrix
round(cors, 2)

# Visualize the correlation matrix using corrplot package
library(corrplot)
corrplot(cors, "pie", "lower")
