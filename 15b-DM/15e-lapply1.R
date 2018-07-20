#lapply
#lapply = apply a function over a list
#for reproducibility
#write function to sample 10 numbers
#from a Poisson distribution according to lambda
f <- function(l){
  rpois(10, l)
}
f(10)
f(1)
set.seed(123)
#save into draws
draws <- lapply(1:5,f)
draws


list1 = list(sub1=10:1, sub2=rep(5,3), sub3=rep(c(5,6),4),sub4=seq_len(length.out=10))
list1
X=list1
lapply(X,FUN=mean, na.rm=T)
X[[1]][5] = NA
lapply(X,FUN=mean, na.rm=F)
lapply(X,FUN=mean, na.rm=T)
unlist(lapply(X,FUN=mean, na.rm=T))

lapply(a1, mean)
