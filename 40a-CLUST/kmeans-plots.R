#kmeans plots

df=iris
m=as.matrix(cbind(df$Petal.Length, df$Petal.Width),ncol=2)

#Now we will do the actual clustering.

cl=(kmeans(m,3))

#The cl object contains a number of interesting attributes associated with the model.

cl$size
cl$withinss

#Next we do a bit of data formatting and preparation for subsequent calls to graph the data.  Notice that we add the cluster information back to our original data frame.  This is a good organization of the data and also a requirement for working with ggplot2 which is designed to use data frames.

df$cluster=factor(cl$cluster)
centers=as.data.frame(cl$centers)

#The following graph color codes the points by cluster.  We also add the centers and a semi transparent halo around the center to emphasize the place of the center… and its role in classifying the observations into clusters.

library(ggplot2)
centers
ggplot(data=df, aes(x=Petal.Length, y=Petal.Width, color=cluster )) +  geom_point() +  geom_point(data=centers, aes(x=V1,y=V2, color='Center'))  + geom_point(data=centers, aes(x=V1,y=V2, color='Center'), size=52, alpha=.3)

library(sqldf)
sqldf('select Species, cluster, count(*) from df group by Species, Cluster')


#oultiers
df2 = sqldf('select * from df where (Species || cluster) in (select Species || cluster from df group by Species, Cluster having count(*) < 10)')
df2

#sqldf('select Species || cluster from df group by Species, Cluster having count(*) < 10')

last_plot()
last_plot() +  geom_point(data=df2, aes(x=Petal_Length, y=Petal_Width, shape=5, alpha=.7, size=4.5), legend=FALSE) 
