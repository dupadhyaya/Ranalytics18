# Partitioning around Mediods (PAM)


library(cluster)
set.seed(1234)
data(wine, package='rattle.data')
head(wine)
fit.pam = pam(wine[-1,], k=3, stand=TRUE)
fit.pam$medoids
clusplot(fit.pam, main='Bivariate Cluster Plot')
#plot of 1st two PC derived from PCA
summary(fit.pam)
names(fit.pam)



