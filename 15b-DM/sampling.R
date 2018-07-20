#sampling
n=10
set.seed(1)

a=rep(0:1,5)
b=rep(0,10)
c=rep(1,10)
dataset=matrix(cbind(a,b,c),nrow=10,ncol=3)
dataset
sample(dataset, n, replace=T)
mysample <- sample(length(dataset), n, replace=T)
mysample
