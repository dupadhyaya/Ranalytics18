#CLustering - Does Cluster exist
#install.packages("seriation")
library(seriation)

d_iris <- dist(iris[,-5])
VAT(d_iris)
iVAT(d_iris)
