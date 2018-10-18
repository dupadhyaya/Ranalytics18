#Clustering - Customer Segmentation
#Import Data using Google Sheets
#library - gsheet, corrplot, dplyr
#Link : http://archive.ics.uci.edu/ml/datasets/Wholesale+customers https://subhayo.wordpress.com/2017/08/15/customer-segmentation-using-k-means-clustering/

easypackages::libraries( 'dplyr', 'gsheet', 'corrplot')
#library(dplyr);library(gsheet); library(corrplot)

#import Data
url="https://docs.google.com/spreadsheets/d/1y6a6neeU-nH7zsAyDuyyy8GbPyGaxYfwpWcjIT4gInU/edit#gid=251433617"
data1 = as.data.frame(gsheet2tbl(url))
#data = read.csv(file.choose())
head(data1)  
cdata1 = data1

#Read the input file
w = cor(cdata1)
corrplot(w)
corrplot(w,method="number")
#check for strong cor = Grocery & Detergents

#Choosing no of clusters - The elbow method looks at the percentage of variance explained as a function of the number of clusters: One should choose a number of clusters so that adding another cluster doesn’t give much better modeling of the data. More precisely, if one plots the percentage of variance explained by the clusters against the number of clusters, the first clusters will add much information (explain a lot of variance), but at some point the marginal gain will drop, giving an angle in the graph. The number of clusters is chosen at this point, hence the “elbow criterion”.

set.seed(123)
k.max = 15
head(cdata1)  #skip 1st & 2nd col
#scale the data and put in matrix : all will be numeric
sdata1 = as.matrix(scale(cdata1[,(3:8)]))
head(sdata1)
wss = sapply(1:k.max, function(k){
  kmeans(sdata1, k, nstart=50,iter.max = 15 )$tot.withinss
  })

plot(1:k.max, wss,
      type="b", pch = 19, frame = FALSE, 
      xlab="Number of clusters",
      ylab="Sum of squares")
abline(v=c(3:5))
#rom the above plot we can see that 3 or 5 is the optimal number of clusters, as we can see that after these numbers the curve remains less changing.

#create 3 clusters
#use scaled data sdata1
set.seed(123)
km3 = kmeans(sdata1, 3)
km3
set.seed(456)
#create 5 clusters
km5 = kmeans(sdata1, 5)
km5

#Cluster Analysis & Interpretation
head(km3$cluster)
cluster_data = cbind(cdata1, C3= km3$cluster, C5=km5$cluster)
head(cluster_data)
#join them into 1 data frame

(C3sum <- cluster_data %>% select(-c(C5, Channel, Region)) %>% group_by(C3) %>% summarise_all(mean) %>% print(width=Inf, n = Inf))

# Cluster 2 – highest fresh-products.
C3sum %>% arrange(Fresh)

# Cluster 3 – low spenders.
C3sum %>% select(-1) %>% rowSums %>% cbind()

# Cluster 1 – highest milk, grocery, detergents_papers spenders.
C3sum %>% replace(is.na(.), 0) %>% mutate(Rsum = rowSums(.[-1])) %>% arrange(-Rsum)
C3sum  #find max of each column and tell its cluster no
max.col(C3sum,ties.method="first")  #column no, we want name
colnames(C3sum)[max.col(C3sum,ties.method="first")]
(C3sumT = t(C3sum))
colnames(C3sumT) = paste("cluster",1:3,sep='')
C3sumT
#Cluster No with highest in Col...
cbind(rownames(C3sumT), colnames(C3sumT)[max.col(C3sumT,ties.method="first")])

#Analyse Cluster 5

(C5sum <- cluster_data %>% select(-c(C3, Channel, Region)) %>% group_by(C5) %>% summarise_all(mean) %>% print(width=Inf, n = Inf))

# Cluster 3 – low spenders
rowSums(C5sum)
cbind(rowSums(C5sum[-1]), C5sum$C5)
C5sum %>% replace(is.na(.), 0) %>% mutate(Rsum = rowSums(.[-1])) %>% arrange(-Rsum)
# Cluster 1 – mediocre spenders 55681
# Cluster 3 – low spenders 20087

# Cluster 4 – highest Fresh spenders
C5sum %>% arrange(-Fresh)
# Cluster 4 – highest- Fresh, milk, Frozen, Delcassen
(C5sumT = t(C5sum))
colnames(C5sumT) = paste("cluster",1:5,sep='')
C5sumT
#Cluster No with highest in Col...
cbind(rownames(C5sumT), colnames(C5sumT)[max.col(C5sumT,ties.method="first")])


#cluster 2 from km5 : save as csv file and send for more analysis 
km5_c2 = subset(cluster_data, C5==2)
write.csv(km5_c2, './data/km5_c2.csv')


#Hierarchical Clustering
#http://inseaddataanalytics.github.io/INSEADAnalytics/CourseSessions/Sessions45/ClusterAnalysisReading.html

#Kmeans requires the user to define how many segments to create, while Hierarchical Clustering does not.
#Hierarchial Clustering method, as we do not know for now how many segments there are in our data. Hierarchical clustering is a method that also helps us visualise how the data may be clustered together. It generates a plot called the Dendrogram which is often helpful for visualization 

head
# Run hclust algorithm
head(cdata1)
hc1 =  hclust(dist(cdata1))
dim(cdata1)

library(ggdendro)
dendrogram1  <- ggdendrogram(hc1, rotate = TRUE)
dendrogram1
# Write plot to disk
library(ggplot2)
ggsave("dendrogram.png",dendrogram1, width = 16, height = 9)

plot(hc1)
plot(hc1, cex = 0.6, hang = -1)
rect.hclust(hc1, k=3, border="red") 

#Cut the Hcluster into 5 groups
hc5 = cutree(hc1, k=5) # cut tree into 5 clusters
#which data into which cluster
hc5_data = cbind(cdata1, hc5)
head(hc5_data)
hc5_data %>% group_by(hc5) %>% select(-c(1,2)) %>% summarise_all(mean)
C5sum
