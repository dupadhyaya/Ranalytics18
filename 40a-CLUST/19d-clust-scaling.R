# Scaling the data for Clustering

set.seed(1234); marks10 = ceiling(runif(100, 5,10)) 
set.seed(1234); marks500 = ceiling(runif(100, 250,500)) 

students1= data.frame(marks10, marks500)
head(students1)

km1 = kmeans(students1, centers=3)
km1$centers; km1$withinss
#scaling gives equal importance to all variables
#avoid obtaining clusters that are dominated by variables having the largest amount of variation

students2 = scale(students1)
km2 = kmeans(students2, centers=3)
km2$centers; km2$withinss

par(mfrow=c(1,2))
plot(students1$marks10, students1$marks500, col=km1$cluster)
plot(students1$marks10, students1$marks500, col=km2$cluster)
par(mfrow=c(1,1))
