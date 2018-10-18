#Simple Case - classification and clustering
#This could be done by finding the similarity between two hair lengths and keep them in the same group if the similarity is less(Difference of hair length is less). The same process could continue until all the hair length properly grouped into two categories.
#http://dataaspirant.com/2016/09/24/classification-clustering-alogrithms/
#sample data
set.seed(123)
hairlength = ceiling(c(rnorm(25, mean=12, sd=4), (rnorm(25, mean=25, sd=5))))
hairlength
gender = factor(rep(c('M','F'), each=25))                     
gender
hair = data.frame(hairlength, gender)
table(hair$gender)
aggregate(hairlength ~ gender, data=hair, mean)

#classification-----
library(rpart); library(rpart.plot)
tree = rpart(gender ~ hairlength, data= hair)
tree
rpart.plot(tree)
predict(tree, newdata = data.frame(hairlength=22), type='class')
#

#Clustering-----
names(hair)
data = hair$hairlength
km2 = kmeans(data, centers=2, nstart=3)
km2
km2$centers
km2$cluster
plot(data, col=km2$cluster)
#clusters do not indicate whether they relate to male or female

#hierarchial clustering
hc = hclust(dist(data))
plot(hc)
plot(hc, cex = 0.6)
rect.hclust(hc, k = 2, border = 4:5)
rect.hclust(hc, k = 3, border = 3:5)
ct = cutree(hc, k = 2)
mean(data[ct==1])
mean(data[ct==2])

?rect.hclust

library(ape)
library(cluster) 
plot(as.phylo(hc),type="fan")
