#Clustering - offer - marketing campaign

library(gsheet)
?gsheet2tbl
fullurl_1 = "https://docs.google.com/spreadsheets/d/13tWJP6fcWNE7FObz4Cn_-_R0us7qIFialUy1m9nwBYY/edit#gid=1772535900"
offers = as.data.frame(gsheet::gsheet2tbl(fullurl_1))
dim(offers)


fullurl_2 = "https://docs.google.com/spreadsheets/d/13tWJP6fcWNE7FObz4Cn_-_R0us7qIFialUy1m9nwBYY/edit#gid=788072611"
transactions = as.data.frame(gsheet::gsheet2tbl(fullurl_2))
dim(transactions)


#Step-1: # Create transaction matrix (a pivot table like in Excel way!)
library(reshape)
head(transactions)
pivot = melt(transactions[1:2])
head(pivot)


pivot2 = (cast(pivot,value ~ custlastname, fill=0, fun.aggregate=function(x) length(x)))
head(pivot2)

pivot3 = cbind(offers,pivot2[-1])
head(pivot3)

#can save the data for future use
# write.csv(file="pivot.csv",pivot) # to save your data

cluster.data = pivot3[,8:length(pivot3)]
names(cluster.data)
cluster.data2 = t(cluster.data) #transpose
head(cluster.data2)

#Step-2
library(cluster)
D=daisy(cluster.data2, metric='gower')

#After the creation of a distance matrix, we implement a Ward’s hierarchical clustering procedure:
  
H.fit = hclust(D, method="ward.D2")
plot(H.fit) # display dendrogram
groups = cutree(H.fit, k=4) # cut tree into 4 clusters
# draw dendogram with red borders around the 4 clusters
rect.hclust(H.fit, k=4, border="red") 
# 2D representation of the Segmentation:
clusplot(cluster.data2,groups, color=TRUE, shade=TRUE, labels=2, lines=0, main= 'Customer segments')

?clusplot
