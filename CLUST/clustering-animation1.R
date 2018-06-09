#Clustering and Animation
#https://www.guru99.com/r-k-means-clustering.html

library(dplyr)
PATH <-"https://raw.githubusercontent.com/thomaspernet/data_csv_r/master/data/Computers.csv"
df <- read.csv(PATH) %>% select(-c(X, cd, multi, premium))
glimpse(df)

summary(df)

rescale_df <- df %>%
  mutate(price_scal = scale(price),
         hd_scal = scale(hd),
         ram_scal = scale(ram),
         screen_scal = scale(screen),
         ads_scal = scale(ads),
         trend_scal = scale(trend)) %>%
  select(-c(price, speed, hd, ram, screen, ads, trend))

head(rescale_df)

#kmeans & animation
set.seed(2345)
library(animation)

kmeans.ani(rescale_df[2:3], 3)

#
# Step 1: R randomly chooses three points
# Step 2: Compute the Euclidean distance and draw the clusters. You have one cluster in green at the bottom left, one large cluster colored in black at the right and a red one between them.
# Step 3: Compute the centroid, i.e. the mean of the clusters
# Repeat until no data changes cluster

pc_cluster <-kmeans(rescale_df, 5)

# The list pc_cluster contains seven interesting elements:
# pc_cluster$cluster: Indicates the cluster of each observation
# pc_cluster$centers: The cluster centres
# pc_cluster$totss: The total sum of squares
# pc_cluster$withinss: Within sum of square. The number of components return is equal to `k`
# pc_cluster$tot.withinss: Sum of withinss
# pc_clusterbetweenss: Total sum of square minus Within sum of square
# pc_cluster$size: Number of observation within each cluster

kmean_withinss <- function(k) {
  cluster <- kmeans(rescale_df, k)
  return (cluster$tot.withinss)
}
kmean_withinss(2)

# Set maximum cluster 
max_k <-20 
# Run algorithm over a range of k 
wss <- sapply(2:max_k, kmean_withinss)

# Create a data frame to plot the graph
elbow <-data.frame(2:max_k, wss)

# Plot the graph with gglop
library(ggplot2)
ggplot(elbow, aes(x = X2.max_k, y = wss)) +
  geom_point() +
  geom_line() +
  scale_x_continuous(breaks = seq(1, 20, by = 1))

#From the graph, you can see the optimal k is seven, where the curve is starting to have a diminishing return. Once you have our optimal k, you re-run the algorithm with k equals to 7 and evaluate the clusters.

pc_cluster_2 <-kmeans(rescale_df, 7)

pc_cluster_2$cluster
pc_cluster_2$centers
pc_cluster_2$size

(center <-pc_cluster_2$centers)

library(tidyr)

# create dataset with the cluster number

cluster <- c(1: 7)
(center_df <- data.frame(cluster, center))

# Reshape the data

center_reshape <- gather(center_df, features, values, price_scal: trend_scal)
head(center_reshape)

library(RColorBrewer)
# Create the palette
hm.palette <-colorRampPalette(rev(brewer.pal(10, 'RdYlGn')),space='Lab')

# Plot the heat map
ggplot(data = center_reshape, aes(x = features, y = cluster, fill = values)) +
  scale_y_continuous(breaks = seq(1, 7, by = 1)) +
  geom_tile() +
  coord_equal() +
  scale_fill_gradientn(colours = hm.palette(90)) +
  theme_classic()
