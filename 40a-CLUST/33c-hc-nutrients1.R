# RinA - Hierarchical Clustering

#Packages Required - flexclust,cluster, NbClust
#Dataset - fkexclust::nutrient
#data(nutrient, package="flexclust")

library(flexclust)----
data(nutrient)
str(nutrient)
head(nutrient,4)
dim(nutrient)

#Calculating Distances
#Distance, Dissimilarity, Proxmity
#Euclidean Distance
d = dist(nutrient)
d[1:10]
d
(dm = as.matrix(d)[1:4, 1:4])  #see only few values
dm[1,2]
nutrient[1:2,]
#dist Beef & burger

#Manually Calculating
paste('sqrt (', paste(nutrient[1,], nutrient[2,], sep="-", collapse=" ^2 + "), ")")
sqrt ( (340-245)^2 + (20-21)^2 + (28-17) ^2 + (9-9) ^2 + (2.6-2.7) )
dist(nutrient[c(1,2),])
#manuall & by algo is same

#-----
library(cluster)
#Pairwise distances 
daisy(nutrient[c(1,2),])  #same distance
daisy(nutrient)

#Scaling-----
#Scaling Data - reduce of particular variable
data(nutrient, package='flexclust')

row.names(nutrient) = tolower(row.names(nutrient))
head(nutrient)
nutrient.scaled = scale(nutrient)  #zscore
head(nutrient.scaled)
d = dist(nutrient.scaled)
head(d)

#Perform HClustering-----
fit.average = hclust(d, method = 'average')
plot(fit.average, hang=-1, cex=.8, main='Average Linkage Clustering')


#Eg
#Smaller No of Clusters

library(NbClust)
devAskNewPage(ask=T)#ask for next plot
nc = NbClust(nutrient.scaled, distance='euclidean', min.nc=2, max.nc=15, method='average')
devAskNewPage(ask=F)
par(mfrow=c(1,1))
barplot(nc$Best.n[1, ], xlab='No of Clusters', ylab='No of Criteria', main='No of Clusters Chosen by 26 Criteria')

?NbClust
#Eg : Final Cluster Solution, Select 5
clusters = cutree (fit.average, k=5)
sort(clusters)
table(clusters)
aggregate(nutrient, by=list(cluster=clusters), median)

aggregate(as.data.frame(nutrient.scaled), by=list(cluster=clusters), median)

plot(fit.average, hang=-1, cex=.8, main='Average Linkage Clustering \n5 Cluster Solution')
rect.hclust(fit.average, k=5)

library(rattle)
str(wine)
head(wine)
df = scale(wine[-1])
df

wssplot <- function(data, nc=15, seed=1234){
  wss <- (nrow(data)-1)*sum(apply(data,2,var))
  for (i in 2:nc){
    set.seed(seed)
    wss[i] <- sum(kmeans(data, centers=i)$withinss)}
  plot(1:nc, wss, type="b", xlab="Number of Clusters",
       ylab="Within groups sum of squares")}

wssplot(df)

library(NBClust)
set.seed(1234)
devAskNewPage(ask=T)
nc = NbClust(df, min.nc =2, max.nc=15, method='kmeans')
table(nc$Best.nc[1,])
par(mfrow=c(1,1))
barplot(table(nc$Best.nc[1,]), xlab='No of Clusters', ylab='No of Criteria',
        main='No of Clusters Chosen by 26 Criteria')

set.seed(1234)
fit.km  = kmeans(df,3, nstart=25)
fit.km
fit.km$size

fit.km$centers

aggregate(wine[-1], by=list(cluster=fit.km$cluster), mean)

ct.km = table(wine$Type, fit.km$cluster)
ct.km

library(flexclust)
randIndex(ct.km)

library(cluster)
?pam
library(cluster)
set.seed(1234)
fit.pam = pam(wine[-1], k=3, stand=T)
fit.pam
fit.pam$medoids
clusplot(fit.pam, main='Bivariate Cluster Plot')
ct.pam = table(wine$Type, fit.pam$clustering)
ct.pam
randIndex(ct.pam)

#Eg
library(fMultivar)
set.seed(1234)
df = rnorm2d(1000, rho=.5)
df = as.data.frame(df)
df
plot(df, main='Bivariate Normal Distribution with rho=0.5')
wssplot(df)
library(NbClust)
nc = NbClust(df, min.nc=2, max.nc=15, method='kmeans')

library(ggplot2)
library(cluster)
fit = pam(df, k=2)
fit
df$clustering = factor(fit$clustering)

par(mfrow=c(1,1))
ggplot(data=df, aes(x=V1,y=V2, color=clustering, shape=clustering)) +
  geom_point() +
  ggtitle('Clustering of Bivariate Normal Data')
plot(nc$All.index[ ,4], type='o',
     ylab='CCC', xlab='Number of
     clusters', col='blue')

