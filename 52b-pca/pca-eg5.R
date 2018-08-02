# PCA
#https://davetang.org/muse/2012/02/01/step-by-step-principal-components-analysis-using-r/
  
# use a simple two dimensional dataset to illustrate PCA
x <- c(2.5, 0.5, 2.2, 1.9, 3.1, 2.3, 2, 1, 1.5, 1.1)
y <- c(2.4, 0.7, 2.9, 2.2, 3.0, 2.7, 1.6, 1.1, 1.6, 0.9)

plot(x, y, pch = 19)

mean(x)
mean(y)

(x1 <- x - mean(x))

summary(x1)

(y1 <- y - mean(y))
summary(y1)
#Our standardised dataset visualised on the x-y coordinates.
plot(x1, y1, pch = 19)

cov(x1, y1)
cov(x1, x1)
cov(y1, y1)

m <- matrix(c(cov(x1, x1), cov(x1, y1), cov(y1, x1),cov(y1, y1)),
            nrow=2,
            ncol=2,
            byrow=TRUE,
            dimnames=list(c("x","y"),c("x","y")))

m
e = eigen(m)
e
pc1 = x1 * e$vectors[1,1] + y1 * e$vectors[2,1]
pc1

pc2 = x1 * e$vectors[1,2] + y1 * e$vectors[2,2]
pc2

data.frame(PC1 = pc1, PC2=pc2)
plot(pc1,pc2, pch=19)

(data = data.frame(x,y))
data.pca = prcomp(data)
data.pca
names(data.pca)
data.pca$x
plot(data.pca$x[,1], data.pca$x[,2], pch=19)
eigen(m)
data.pca

x















cc = matrix(1:24, ncol=4)
cc
PCAcc = princomp(cc, scores=T, cor=T)
PCAcc$loadings
PCAcc$scores

apply(cc, 2, mean)
cc
t(cc)
t(cc) -apply(cc, 2, mean)
t(t(cc) -apply(cc, 2, mean))

rescaled = t ( t(cc) - apply(cc, 2, mean))
rescaled %*% PCAcc$loadings
predict(PCAcc, newdata=cc)
scale(cc, PCAcc$center, PCAcc$scale) %*% PCAcc$loadings
