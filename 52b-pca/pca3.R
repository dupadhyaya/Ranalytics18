# PCA3

#Eg : Iris Data Set (R Bloggers)
str(iris)
#data contain four continuous variables which corresponds to physical measures of flowers and a categorical variable describing the flowers’ species.
#Step1
data(iris)
head(iris, 3)
#Step2
log.ir <- log(iris[, 1:4])
ir.species <- iris[, 5]
ir.pca <- prcomp(log.ir, center = TRUE, scale. = TRUE)
#Step3
print(ir.pca)
#Standard deviations: [1] 1.7124583 0.9523797 0.3647029 0.1656840  Rotation:                     PC1         PC2        PC3         PC4 Sepal.Length  0.5038236 -0.45499872  0.7088547  0.19147575 Sepal.Width  -0.3023682 -0.88914419 -0.3311628 -0.09125405 Petal.Length  0.5767881 -0.03378802 -0.2192793 -0.78618732 Petal.Width   0.5674952 -0.03545628 -0.5829003  0.58044745
plot(ir.pca, type = "l")
summary(ir.pca)
#Misc Steps
predict(ir.pca, newdata=tail(log.ir, 2))
#Plot
library(devtools)
install_github("ggbiplot", "vqv")
library(ggbiplot)
#Plot2
require(ggplot2)

g <- ggbiplot(ir.pca, obs.scale = 1, var.scale = 1, groups = ir.species, ellipse = TRUE, circle = TRUE)
g <- g + scale_color_discrete(name = '')
g <- g + theme(legend.direction = 'horizontal', legend.position = 'top')
print(g)

theta <- seq(0,2*pi,length.out = 100)
circle <- data.frame(x = cos(theta), y = sin(theta))
p <- ggplot(circle,aes(x,y)) + geom_path()
loadings <- data.frame(ir.pca$rotation, .names = row.names(ir.pca$rotation))
p + geom_text(data=loadings, mapping=aes(x = PC1, y = PC2, label = .names, colour = .names)) +
  coord_fixed(ratio=1) +
  labs(x = "PC1", y = "PC2")
biplot(ir.pca)

#PCA on caret package
require(caret)
trans = preProcess(iris[,1:4], method=c("BoxCox", "center", "scale", "pca"))
PC = predict(trans, iris[,1:4])
head(PC, 3)
trans$rotation
