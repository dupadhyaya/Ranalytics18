# Day 3 - Online batch of MA

#attach function of R
women
names(women)
height
attach(women)
height
weight
women$height

#List
g <- "My First List"  #scalar
h <- c(25, 26, 18, 39)  # numeric vector
j <- matrix(1:10, nrow=5) #matrix
k <- c("one", "two", "three") # character vector
mylist <- list(title=g, ages=h, j, k, women)
mylist

mylist[[2]]
mylist[[5]]


# plot
plot(x=height, y=weight, type='b', lty=5, pch=11, fg='red', bg='green', col.axis='purple', cex=1.5, cex.axis=2)
title(main='Henry Harvin', sub=' MA Course')
