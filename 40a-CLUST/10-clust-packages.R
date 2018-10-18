#Packages for Clustering

#install.packages('easypackages')
library(easypackages)
clustpackages = c('dplyr','amap','NbClust','gsheet', 'cluster', 'factoextra','fpc', 'devtools', 'vegan', 'kohonen','datasets','ggplot2', 'flexclust','tsne','ISLR','reshape','corrplot','fMultivar','animation','plyr','switchr')
easypackages::packages(clustpackages)
install_github("pablo14/clusplus")
easypackages::libraries(c(clustpackages,'clusplus'))

                        