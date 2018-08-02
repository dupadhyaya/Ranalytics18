?rle
rle(x=1:10)
c( 22, 0, 0, 20, 0, 50, 23, 1, 2, 21, 0) -> y
y
rle(y)
dist=rle(sort(y))
m=dist$lengths==max(dist$lengths) # note the most common value
m
dist$values[which(m)] # give the modal value in variable y 
dist$lengths[which(m)] # give the frequency of that value

x <- rev(rep(6:10, 1:5))
x
rle(x)
