#Clustering on mtcars

#https://rstudio-pubs-static.s3.amazonaws.com/111803_f6ec030f9a544fb2a058170f8047eb67.html#/4

#kmeans - select only few column to group them
df = mtcars[, c('mpg', 'cyl', 'wt')]
km_fit1 <- kmeans(df, centers=3)
km_fit1
km_fit1$centers  #average of each cluster
km_fit1$size  #how many into each cluster

#
kmeanPlot <- par(mar = c(5.1, 4.1, 0, 1))
plot(df,   col = km_fit1$cluster,
     pch = 20, cex = 3)
points(km_fit1$centers, pch = 15, cex = 4, lwd = 4, col='pink')

#Interactive Clustering at
#https://mikedamour.shinyapps.io/ShinyProject/

var1='cyl'
var2='gear'
(vars=sample(x=c('cyl','gear','vs','am','mpg','disp'), replace=F, size=2))
data1 = mtcars[c(vars)]
cluster1 = kmeans(data1,3)
plot(data1,col=cluster1$cluster, cex=cluster1$cluster)
points(cluster1$centers, pch = 15, cex = 2, col='violet')

cluster1 = kmeans(data1,4)
plot(data1,col=cluster1$cluster, cex=cluster1$cluster)
points(cluster1$centers, pch = 12, cex = 2, col='black')




