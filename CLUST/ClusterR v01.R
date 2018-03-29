# HH MA example 
#setwd("")
#install.packages("amap")
library(amap)
##Read the data in the file
url = 'https://docs.google.com/spreadsheets/d/1PWWoMqE5o3ChwJbpexeeYkW6p4BHL9hubVb1fkKSBgA/edit#gid=2073914016'
library(gsheet)
data = as.data.frame(gsheet2tbl(url))
str(data)
names(data)
summary(data)
##
##
##
##
#cust_data<-read.csv("./data/Segmentation_Data v01.csv")
cust_data = data
###Verify the data
colnames(cust_data)
class(cust_data$Age)
apply(cust_data, 2, FUN= class)

dim(cust_data)
head(cust_data)
summary(cust_data)
str(cust_data)
###Run the kmeans algorithm to generate the clusters
?amap::Kmeans
names(cust_data)
k1<-amap::Kmeans(cust_data[,-c(1)],centers=3, 
           iter.max = 200,nstart = 1, 
           method = c("euclidean"))

k1$centers  # group means
###Fetch size/n of obs for the groups
k1$size
###Fetch sum of squared  for the groups
k1$withinss
###Fetch the cluster for each obs
#k1$cluster
k1$cluster
data_clus_2 <- cust_data[ k1$cluster == 2,]
data_clus_2$Cust_id
# Write CSV
write.csv(data_clus_2[,1], file = "./data/data_clus_2.csv")



