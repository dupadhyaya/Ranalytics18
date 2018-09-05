# tree
# http://www.di.fc.ul.pt/~jpn/r/tree/tree.html
# https://rpubs.com/JanpuHou/242986
library(tree)
set.seed(1234)

real.state <- read.table(file="https://raw.githubusercontent.com/jbryer/CompStats/master/Data/cadata.dat",head=TRUE)
tree.model= tree(log(MedianHouseValue) ~ Longitude + Latitude, data=real.state)
plot(tree.model)
text(tree.model, cex=.75)

price.decibels = quantile(real.state$MedianHouseValue, 0:10/10)
price.decibels
cut.prices = cut(real.state$MedianHouseValue, price.decibels, include.lowest = T)
cut.prices
plot(real.state$Longitude, real.state$Latitude, col=grey(10:2/11)
     [cut.prices], pch=20, xlab='Longitude', ylab='Latitude')
partition.tree(tree.model, ordvars = c('Longitude','Latitude'), add=T)
?partition.tree

summary(tree.model)
