#Outliers Advance

#http://www.rdatamining.com/examples/outlier-detection


library(DMwR)
# remove "Species", which is a categorical column
iris2 <- iris[,1:4]
outlier.scores <- lofactor(iris2, k=5)
plot(density(outlier.scores))

# pick top 5 as outliers
outliers <- order(outlier.scores, decreasing=T)[1:5]
# who are outliers
print(outliers)
#[1] 42 107 23 110 63


#Visualize Outliers with Plots
#Next, we show outliers with a biplot of the first two principal components.

n <- nrow(iris2)
labels <- 1:n
labels[-outliers] <- "."
biplot(prcomp(iris2), cex=.8, xlabs=labels)


#Visualization of outliers in a biplot of the 1st two principal components
#We can also show outliers with a pairs plot as below, where outliers are labeled with "+" in red.

pch <- rep(".", n)
pch[outliers] <- "+"
col <- rep("black", n)
col[outliers] <- "red"
pairs(iris2, pch=pch, col=col)

#Parallel Computation of LOF Scores
#Package Rlof provides function lof(), a parallel implementation of the LOF algorithm. Its usage is similar to the above lofactor(), but lof() has two additional features of supporting multiple values of k and several choices of distance metrics. Below is an example of lof(). 
#how many friends u have

library(Rlof)
outlier.scores <- lof(iris2, k=5)
# try with different number of neighbors (k = 5,6,7,8,9 and 10)
outlier.scores <- lof(iris2, k=c(5:10))
outlier.scores
plot(density(outlier.scores))
# pick top 10 as outliers
outliers <- order(outlier.scores, decreasing=T)[1:10]
# who are outliers
print(outliers)
#[1]  42 192 342 492 642 792 107  23 257 407
iris2[outliers,]
iris2



#--------------------------------------------

#https://gist.github.com/revodavid/162943fcc49af20f0a978f9dfa5aa162

library(VIM)
library(ggplot2)
library(ggthemes)
library(OutliersO3)
knitr::opts_chunk$set(warning=FALSE, message=FALSE)
update_geom_defaults("bar",   list(fill = "grey70", colour = "grey40"))
s1 <- O3prep(stackloss)
O3s1 <- O3plotT(s1)
O3s1$gO3

s2 =O3prep(mtcars)
O3s2 = O3plotT(s2)
O3s2$gO3
