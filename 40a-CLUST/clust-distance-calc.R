# Distance Calcuation
#https://stackoverflow.com/questions/27082378/how-to-compute-distances-between-centroids-and-data-matrix-for-kmeans-algorithm

myEuclid <- function(points1, points2) {
  distanceMatrix <- matrix(NA, nrow=dim(points1)[1], ncol=dim(points2)[1])
  for(i in 1:nrow(points2)) {
    distanceMatrix[,i] <- sqrt(rowSums(t(t(points1)-points2[i,])^2))
  }
  distanceMatrix
}


myKmeans <- function(x, centers, distFun, nItter=10) {
  clusterHistory <- vector(nItter, mode="list")
  centerHistory <- vector(nItter, mode="list")
  
  for(i in 1:nItter) {
    distsToCenters <- distFun(x, centers)
    clusters <- apply(distsToCenters, 1, which.min)
    centers <- apply(x, 2, tapply, clusters, mean)
    # Saving history
    clusterHistory[[i]] <- clusters
    centerHistory[[i]] <- centers
  }
  
  list(clusters=clusterHistory, centers=centerHistory)
}


mat <- matrix(rnorm(100), ncol=2)
mat
centers <- mat[sample(nrow(mat), 5),]
centers
theResult <- myKmeans(mat, centers, myEuclid, 10)
theResult

theResult2 <- kmeans(mat, centers, 10, algorithm="Forgy")
theResult2

par(mfrow=c(2,2))
for(i in 1:4) {
  plot(mat, col=theResult$clusters[[i]], main=paste("itteration:", i), xlab="x", ylab="y")
  points(theResult$centers[[i]], cex=3, pch=19, col=1:nrow(theResult$centers[[i]]))
}

for(i in 5:8) {
  plot(mat, col=theResult$clusters[[i]], main=paste("itteration:", i), xlab="x", ylab="y")
  points(theResult$centers[[i]], cex=3, pch=19, col=1:nrow(theResult$centers[[i]]))
}


for(i in 9:10) {
  plot(mat, col=theResult$clusters[[i]], main=paste("itteration:", i), xlab="x", ylab="y")
  points(theResult$centers[[i]], cex=3, pch=19, col=1:nrow(theResult$centers[[i]]))
}


myCor <- function(points1, points2) {
  return(1 - ((cor(t(points1), t(points2))+1)/2))
}

theResult <- myKmeans(mat, centers, myCor, 10)

