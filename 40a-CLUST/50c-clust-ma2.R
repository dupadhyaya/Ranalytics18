# Clustering For Customer Segmentation

(age = ceiling(runif(50, 30, 50)))
(income = ceiling(rnorm(50, 1000, 50)))
(gender = sample(c(1,2), size=50, replace=T))
customers = data.frame(age, income, gender)
head(customers)

#case1 : only age
age1 = data.frame(age)
clust1 = kmeans(age1, 3)
clust1$cluster
combined = cbind(age1, clust1$cluster)
plot(age1$age)
plot(age1$age, col=clust1$cluster, pch=c(11,12,14))

#case1 : only income
income1 = data.frame(income)
clust1a = kmeans(income, 4)
clust1a$cluster
(combined = cbind(income1, clust1a$cluster))
combined[order(clust1a$cluster),]
plot(income1$income, col=clust1a$cluster, pch=c(11,12,14,15))




df2 = data.frame(age, income)
clust2 = kmeans(df2, 4)
clust2$cluster
combined2 = cbind(df2, clust2$cluster)
head(combined2)
plot(x=df2$age, y=df2$income, col=clust2$cluster, pch=c(11,12,14,17))
df2
df2[clust2$cluster==3,]



(gender = sample(c(1,2), size=1000, replace=T, prob=c(.6,.4)))
table(gender)
prop.table(table(gender))
