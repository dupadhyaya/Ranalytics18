#Row Column Summary
# array dimnames = list(row.names, col.names, matrix.names)

#Eg10
a4 = array(1:24, dim=c(4,3,2), dimnames = list( c(paste('c',1:4,sep='')), c('d1','d2','d3'),c('s1','s2')) )
a4
#, , s1    d1 d2 d3 c1  1  5  9 c2  2  6 10 c3  3  7 11 c4  4  8 12
#, , s2    d1 d2 d3 c1 13 17 21 c2 14 18 22 c3 15 19 23 c4 16 20 24
x = a4


rowMeans(x,dims=1)
rowMeans(x,dims=2)

rowSums(x,dims=1)
rowSums(x,dims=2)

colMeans(x,dims=1)
colMeans(x,dims=2)

colSums(x,dims=1)
colSums(x,dims=2)

# Data Frame and Matrix
df1 = data.frame(sub1=10:1, sub2=5, sub3=rep(c(5,6),5), sub4=seq_len(length.out=10))
df1
x = df1

data = c
m1 = matrix(c(10:1, rep(5,10), rep(c(5,6),5),seq_len(length.out=10)), byrow=F, ncol =4)
colnames(m1) = c('sub1','sub2','sub3','sub4')
rownames(m1) = paste('R',1:10,sep='')

x=m1

rowMeans(x,dims=1)
rowMeans(x,dims=2)

rowSums(x,dims=1)
rowSums(x,dims=2)

colMeans(x,dims=1)
colMeans(x,dims=2)
colMeans(x,dims=0)

colSums(x,dims=1)
colSums(x,dims=2)

col


