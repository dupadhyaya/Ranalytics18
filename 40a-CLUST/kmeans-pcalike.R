#kmeans : PCA like technique

#https://www.biostars.org/p/15669/

library(fpc)
library(ggplot2)
data=mtcars
kclust=kmeans(data,centers=3)
kclust$cluster <- as.factor(kclust$cluster)
kclust
d=dist(data, method = "euclidean") 
fit=cmdscale(d,eig=TRUE, k=2) # k is the number of dim
fit

p = ggplot(data.frame(data), aes(fit$points[,1], fit$points[,2], color =  factor(kclust$cluster))) 
p <- p + theme(axis.title.y = element_text(size = rel(1), angle = 90))
p <- p + theme(axis.title.x = element_text(size = rel(1), angle = 00))
p= p + theme(axis.text=element_text(size=10,angle=90),axis.title=element_text(size=20,face="bold")) + geom_point(size=4)
p= p + theme(legend.text = element_text(size = 10, colour = "black"))
p= p + theme(legend.title = element_text(size = 10, colour = "black"))
p= p  + theme(legend.key.size = unit(1.5, "cm"))
p


#-----
