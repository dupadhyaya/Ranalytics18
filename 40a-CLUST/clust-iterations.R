#Check how clustering changes due to No of Iterations

iris
ciris = iris[-5]

km3 = kmeans(ciris, 3, iter.max=3, nstart=3, trace=T)
km3
km3$iter
?kmeans
km3 = kmeans(ciris, 3, iter.max = 15)
km3
km3$iter

library(ISLR)
data(package='ISLR')
head(Default)
cDefault = Default[c(3:4)]
head(cDefault)
dim(cDefault)
sDefault = scale(cDefault)
km3_default = kmeans(sDefault, 4)
km3_default$centers
