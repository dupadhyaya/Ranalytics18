# Non Existent Clusters

library(fMultivar)
set.seed(1234)
df = rnorm2d(1000, rho=.5)
df = as.data.frame(df)
head(df)
plot(df, main='Pivariable ND with rho = 0.5')
# seems to be no cluster

#Function wssplot
wssplot <- function(data, nc=15, seed=1234){
  wss <- (nrow(data)-1)*sum(apply(data,2,var))
  for (i in 2:nc){
    set.seed(seed)
    wss[i] <- sum(kmeans(data, centers=i)$withinss)}
    plot(1:nc, wss, type="b", xlab="Number of Clusters",
       ylab="Within groups sum of squares")
  }

#Determine no of clusters present
library(NbClust)
wssplot(df)

nc = NbClust(df, min.nc=2, max.nc=15, method='kmeans')
nc