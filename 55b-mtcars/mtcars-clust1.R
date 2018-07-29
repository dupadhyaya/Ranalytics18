#Clustering on mtcars

#https://rstudio-pubs-static.s3.amazonaws.com/111803_f6ec030f9a544fb2a058170f8047eb67.html#/4

selectedData <- mtcars[, c('mpg', 'cyl', 'wt')]
clusters <- kmeans(selectedData, 3)
kmeanPlot <- par(mar = c(5.1, 4.1, 0, 1))
plot(selectedData,
     col = clusters$cluster,
     pch = 20, cex = 3)
points(clusters$centers, pch = 15, cex = 4, lwd = 4, col='pink')

#Interactive Clustering at
#https://mikedamour.shinyapps.io/ShinyProject/

var1=.'cyl'
var2='gear'
(vars=sample(x=c('cyl','gear','vs','am','mpg','disp'), replace=F, size=2))
data1 = mtcars[c(vars)]
par(mfrow=c(1,2))
cluster1 = kmeans(data1,3)
plot(data1,col=cluster1$cluster, cex=cluster1$cluster)
points(cluster1$centers, pch = 15, cex = 2, col='violet')

cluster1 = kmeans(data1,4)
plot(data1,col=cluster1$cluster, cex=cluster1$cluster)
points(cluster1$centers, pch = 12, cex = 2, col='black')



