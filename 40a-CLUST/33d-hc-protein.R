#Clustering - Protein Consumption

#Study case I: EUROPEAN PROTEIN CONSUMPTION
#25 European countries and their protein intakes (in percent) from nine major food sources (p = 9)

url = 'http://www.biz.uiowa.edu/faculty/jledolter/DataMining/protein.csv'
food = read.csv(url)
head(food)

#----
#clustering on just Red and White meat (p=2) and k=3 clusters.
names(food)

set.seed(123) ## to fix the random starting clusters
grpMeat = kmeans(food[,c("WhiteMeat","RedMeat")], centers=3, nstart=10)
grpMeat
grpMeat$cluster

## list of cluster assignments
(o=order(grpMeat$cluster))
food[o,]  #only white and red meat
grpMeat$cluster[o]

data.frame(food$Country[o],grpMeat$cluster[o])

#cluster assignment on a scatter plot:
  
plot(food$Red, food$White, type="n", xlim=c(3,19), xlab="Red Meat", ylab="White Meat")
text(x=food$Red, y=food$White, labels=food$Country, col=grpMeat$cluster+1) #color as per cluster no


#cluster on all nine protein groups and prepare the program to create seven clusters. 

set.seed(123)
grpProtein = kmeans(food[,-1], centers=7, nstart=10)

o=order(grpProtein$cluster)
data.frame(country=food$Country[o],cluster=grpProtein$cluster[o])

#Plot
library(cluster)
clusplot(food[,-1], grpProtein$cluster, main='2D representation of the Cluster solution', color=TRUE, shade=TRUE, labels=2, lines=0)

# Use agnes function for computing H clust
foodagg=agnes(food, diss=FALSE, metric="euclidian")
plot(foodagg, main='Dendrogram') ## dendrogram
groups = cutree(foodagg, k=4) # cut tree into 3 clusters
rect.hclust(foodagg, k=4, border="red") 


#
library(cluster)
clusplot(food[,-1], grpProtein$cluster, main='2D representation of the Cluster solution', color=TRUE, shade=TRUE, labels=2, lines=0)
