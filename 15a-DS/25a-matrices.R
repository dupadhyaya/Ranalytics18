# Matrices
ix(1:12, ncol=3, byrow=T))

class(m1)
#[1] "matrix"
attributes(m1)
#$dim
#[1] 4 3
dim(m1)
#[1] 4 3

#names of cols and rows
m1
(colnames(m1) = paste('C',1:3, sep=''))
(rownames(m1) = paste('R',1:4, sep=''))
m1

#Vector to Matrix
(m3 = 1:24)
dim(m3)= c(6,4)
m3

#access elements
m2
m2[1,]  #first row
m2[c(1,3,4),]  #1st,3rd,4th row

m2[,1]  #first col
m2[,2:3] # 2nd to 3rd coln

m2[c(1,2),c(2,3)]
m2[,]
m2[-2,] # exclude 2nd row
m2[1:5] # matrix is like vector
m2[c(TRUE,FALSE),c(2,3)] #logical indexing
m2[m2 > 5]

#modify Vector
m2[2,2]
m2[2,2] = 10
m2
m2[m2> 10] = 99
m2
rbind(m2, c(50,60,70))
cbind(m2, c(55,65,75,85))

#row and col wise summary
m1
colSums(m1); rowSums(m1)
colMeans(m1); rowMeans(m1)

t(m1) # transpose
m1
sweep(m1, MARGIN = 1, STATS = c(2,3,4,5), FUN="+" ) #rowise
sweep(m1, MARGIN = 2, STATS = c(2,3,4), FUN="*" ) #colwise

#addmargins
m1
addmargins(m1,1,sum) #colwise function
addmargins(m1,2,mean) #rowwise function
addmargins(m1,c(1,2),mean) #row & col wise function
addmargins(m1,c(1,2),list(list(mean,sum), list(var,sd))) #row & col wise function
