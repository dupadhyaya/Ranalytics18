#PCA2
#US Arrests
str(USArrests)
# PCA with function prcomp
pca1 = prcomp(USArrests, scale. = TRUE)
pca1
# sqrt of eigenvalues
pca1$sdev
# loadings
pca1$rotation

# PCs (aka scores)
pca1$x


# 2nd method
# PCA with function princomp
pca2 = princomp(USArrests, cor = TRUE)
pca2
# sqrt of eigenvalues
pca2$sdev
## Comp.1 Comp.2 Comp.3 Comp.4 
## 1.5749 0.9949 0.5971 0.4164
# loadings
unclass(pca2$loadings)
##           Comp.1  Comp.2  Comp.3   Comp.4
## Murder   -0.5359  0.4182 -0.3412  0.64923
## Assault  -0.5832  0.1880 -0.2681 -0.74341
## UrbanPop -0.2782 -0.8728 -0.3780  0.13388
## Rape     -0.5434 -0.1673  0.8178  0.08902
# PCs (aka scores)
head(pca2$scores)
##             Comp.1  Comp.2   Comp.3    Comp.4
## Alabama    -0.9856  1.1334 -0.44427  0.156267
## Alaska     -1.9501  1.0732  2.04000 -0.438583
## Arizona    -1.7632 -0.7460  0.05478 -0.834653
## Arkansas    0.1414  1.1198  0.11457 -0.182811
## California -2.5240 -1.5429  0.59856 -0.341996
## Colorado   -1.5146 -0.9876  1.09501  0.001465


#Method3
# PCA with function PCA
library(FactoMineR)

# apply PCA
pca3 = PCA(USArrests, graph = FALSE)
pca3
# matrix with eigenvalues
pca3$eig

# correlations between variables and PCs
pca3$var$coord
# PCs (aka scores)
head(pca3$ind$coord)


#M4
#
# PCA with function dudi.pca
library(ade4)

# apply PCA
pca4 = dudi.pca(USArrests, nf = 5, scannf = FALSE)
pca4
# eigenvalues
pca4$eig

## [1] 2.4802 0.9898 0.3566 0.1734
# loadings
pca4$c1
##              CS1     CS2     CS3      CS4
## Murder   -0.5359  0.4182 -0.3412  0.64923
## Assault  -0.5832  0.1880 -0.2681 -0.74341
## UrbanPop -0.2782 -0.8728 -0.3780  0.13388
## Rape     -0.5434 -0.1673  0.8178  0.08902
# correlations between variables and PCs
pca4$co
##            Comp1   Comp2   Comp3    Comp4
## Murder   -0.8440  0.4160 -0.2038  0.27037
## Assault  -0.9184  0.1870 -0.1601 -0.30959
## UrbanPop -0.4381 -0.8683 -0.2257  0.05575
## Rape     -0.8558 -0.1665  0.4883  0.03707
# PCs
head(pca4$li)
##              Axis1   Axis2    Axis3     Axis4
## Alabama    -0.9856  1.1334 -0.44427  0.156267
## Alaska     -1.9501  1.0732  2.04000 -0.438583
## Arizona    -1.7632 -0.7460  0.05478 -0.834653
## Arkansas    0.1414  1.1198  0.11457 -0.182811
## California -2.5240 -1.5429  0.59856 -0.341996
## Colorado   -1.5146 -0.9876  1.09501  0.001465


#PCA with function acp
library(amap)

# apply PCA
pca5 = acp(USArrests)
pca5
# sqrt of eigenvalues
pca5$sdev
## Comp 1 Comp 2 Comp 3 Comp 4 
## 1.5749 0.9949 0.5971 0.4164
# loadings
pca5$loadings
##          Comp 1  Comp 2  Comp 3   Comp 4
## Murder   0.5359  0.4182 -0.3412  0.64923
## Assault  0.5832  0.1880 -0.2681 -0.74341
## UrbanPop 0.2782 -0.8728 -0.3780  0.13388
## Rape     0.5434 -0.1673  0.8178  0.08902
# scores
head(pca5$scores)
##             Comp 1  Comp 2   Comp 3   Comp 4
## Alabama     0.9757  1.1220 -0.43980  0.15470
## Alaska      1.9305  1.0624  2.01950 -0.43418
## Arizona     1.7454 -0.7385  0.05423 -0.82626
## Arkansas   -0.1400  1.1085  0.11342 -0.18097
## California  2.4986 -1.5274  0.59254 -0.33856
## Colorado    1.4993 -0.9776  1.08400  0.00145



# load ggplot2
library(ggplot2)

# create data frame with scores
scores = as.data.frame(pca1$x)

# plot of observations
ggplot(data = scores, aes(x = PC1, y = PC2, label = rownames(scores))) +
  geom_hline(yintercept = 0, colour = "gray65") +
  geom_vline(xintercept = 0, colour = "gray65") +
  geom_text(colour = "tomato", alpha = 0.8, size = 4) +
  ggtitle("PCA plot of USA States - Crime Rates")

#Circle of COrrelations
# function to create a circle
circle <- function(center = c(0, 0), npoints = 100) {
  r = 1
  tt = seq(0, 2 * pi, length = npoints)
  xx = center[1] + r * cos(tt)
  yy = center[1] + r * sin(tt)
  return(data.frame(x = xx, y = yy))
}
corcir = circle(c(0, 0), npoints = 100)

# create data frame with correlations between variables and PCs
correlations = as.data.frame(cor(USArrests, pca1$x))
correlations
# data frame with arrows coordinates
arrows = data.frame(x1 = c(0, 0, 0, 0), y1 = c(0, 0, 0, 0), x2 = correlations$PC1, 
                    y2 = correlations$PC2)

# geom_path will do open circles
ggplot() + geom_path(data = corcir, aes(x = x, y = y), colour = "gray65") + 
  geom_segment(data = arrows, aes(x = x1, y = y1, xend = x2, yend = y2), colour = "gray65") + 
  geom_text(data = correlations, aes(x = PC1, y = PC2, label = rownames(correlations))) + 
  geom_hline(yintercept = 0, colour = "gray65") + geom_vline(xintercept = 0, 
                                                             colour = "gray65") + xlim(-1.1, 1.1) + ylim(-1.1, 1.1) + labs(x = "pc1 aixs", 
                                                                                                                           y = "pc2 axis") + ggtitle("Circle of correlations")
