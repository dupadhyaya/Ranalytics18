# Random Numbers

#sample
sample(x=1:10, size=3)
sample(x=c(1.5, 2.5, 3, 6.7), size=2)

sample(x=1:10, size=15)  #error size is more than sample size
sample(x=1:10, size=15, replace=T) 
sample.int(n=100, size=30, replace=F) #nos between 1:n


#sample from vector values
month.abb[1:12]
sample(x=month.abb[1:12], size=3, replace=T)
sample(x=c('M','F'), size=10, replace=T)
