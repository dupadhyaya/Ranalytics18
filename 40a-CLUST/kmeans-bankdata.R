#kmeans - bank data
#https://www.linkedin.com/pulse/decision-making-using-unsupervised-learning-data-r-k-means-pandian/

#bank loan data and picked up two factors Age and Income \
set.seed(123)
age = round(runif(100,20,70),2)
income = round(rnorm(100,100000,20000),2)
bank = data.frame(age, income)
head(bank)

bankdata = scale(bank)
for(i in 1:15){
   wss[i]<-sum(kmeans(bankdata,centers = i)$withinss)
}
plot(wss, type='b')
#From the plot of cluster sizes we can see that K values of 4, 5, 6 and 7 might have the potential. After K=7 the sizes become too small and may be the smaller clusters  may be just sub sets of some larger cluster and may not possess unique characteristics. For the reaming study we have parked at these values of K.
abline(v=7)
km7 = kmeans(bankdata, centers=7)
km7
library(ggvis)
bank %>% ggvis(~age, ~income)
bankdata %>% ggvis(x = ~age, y = ~income)
bank %>% ggvis(x = ~age, y = ~income,fill=~factor(km7$cluster)) %>% layer_points()

require(lattice)
xyplot(income ~age| as.factor(km7$cluster),groups= as.factor(km7$cluster),bank, pch= 20)

#PCA
library(cluster)
clusplot(bank,km7$cluster,color=TRUE,shade=TRUE,labels = 2,lines=0)

#symbols
?symbols
km7$tot.withinss
head(bankdata)
class(bankdata)
bankdata[,2]
bankdata[,1:2]
plot(bankdata)
km7$withinss
km7$centers

km7a = kmeans(bank,7)

(symboldata = as.data.frame(cbind(km7a$centers, sradius=sqrt(km7a$withinss))))
head(trees)

with(symboldata, symbols(age,income, circles=sradius, inches = .5))

with(bank, plot(age,income))
par(new=TRUE)
points(km7a$centers, col='red', pch=18)
par(new=TRUE)
with(symboldata, symbols(age,income, circles=sradius, inches = 1), axis=F, xlim=c(20,70), ylim=c(60000, 140000))

with(symboldata, symbols(age, income, circles = sradius/24, inches = FALSE,
                    main = "Trees' Girth") )


with(trees, symbols(Height, Volume, circles = Girth/24, inches = FALSE,
                    main = "Trees' Girth") )


symbols(x=bankdata[,1], y=bankdata[,2], circles=km7$tot.withinss,inches=0.25, fg="black", bg="blue", xlab="Age", ylab="Income",main="K=4")

text(k4$age, k4$income, k4$sqrt_withinss,pos=4,col="dark green",cex=1.2)


