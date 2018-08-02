# PCA -iris
data(iris)
str(iris)
df = iris[,1:4]
df
(pc = princomp(df, cor=T, score=T))
summary(pc)
plot(pc)
plot(pc, type='l')
abline(h=1)
biplot(pc)
dim(df)
attributes(pc)
pc$loadings
pc$scores
