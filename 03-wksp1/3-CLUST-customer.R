# HH MA example  - customer

#install.packages("amap")
library(amap)
##Read the data in the file
url = 'https://docs.google.com/spreadsheets/d/1PWWoMqE5o3ChwJbpexeeYkW6p4BHL9hubVb1fkKSBgA/edit#gid=2073914016'
library(gsheet)
data = as.data.frame(gsheet2tbl(url))
str(data)
head(data)

names(data)
summary(data)
###Verify the data
colnames(data)
class(data$Age)
apply(data, 2, FUN= class)  #are all numeric
dim(data)
head(data)
summary(data)
###Run the kmeans algorithm to generate the clusters
#?amap::Kmeans
names(data)

k1 <- amap::Kmeans(data[,-1],centers=3, iter.max = 200,nstart = 1,  method = c("euclidean"))

k1$centers  # group means
###Fetch size/n of obs for the groups
k1$size
###Fetch sum of squared  for the groups
k1$withinss
###Fetch the cluster for each obs
#k1$cluster
k1$cluster
k1$centers
k1$cluster[9000:9800]
table(k1$cluster)
k1$size
data_clus_2 <- data[ k1$cluster == 2,]
(data_clus_2)
mean(data_clus_2$Age)
data_clus_2$Cust_id

# Write CSV
write.csv(data_clus_2[,1], file = "./data/data_clus_2.csv")
