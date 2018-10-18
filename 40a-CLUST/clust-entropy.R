#Entropy in Clustering
#https://www.rdocumentation.org/packages/NMF/versions/0.21.0/topics/purity

library(NMF)
# NOT RUN {
# generate a synthetic dataset with known classes: 50 features, 18 samples (5+5+8)
n <- 50; counts <- c(5, 5, 8);
V <- syntheticNMF(n, counts)
V
cl <- unlist(mapply(rep, 1:3, counts))
head(cl)
cl
# perform default NMF with rank=2
x2 <- nmf(V, 2)
purity(x2, cl)
entropy(x2, cl)
# perform default NMF with rank=2
x3 <- nmf(V, 3)
purity(x3, cl)
entropy(x3, cl)
# }