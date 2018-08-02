
array1 = array(1:12, dim=c(2,3,2) )
dimnames1 = list(letters[1:2],
                 LETTERS[1:3], c('One','Two') )
dimnames(array1) = dimnames1
array1

mat1 = matrix(1:24, nrow=4)
dimnames2 = list(letters[1:4], LETTERS[1:6])
dimnames(mat1) = dimnames2
mat1
mat1[4]= NA

apply(array1, 1, FUN=sum)
apply(array1, c(2,3), FUN=sum)

apply(mat1, 1, FUN=mean)
apply(mat1, MARGIN=2, FUN=median, na.rm=T)

rowSums(array1, dims=3)
colSums(array1, dims=1)
colSums(array1, dims=2)

colSums(mat1,dims=1, na.rm=T)
colSums(mat1, na.rm=T)

rowSums(mat1,dims=1, na.rm=T)


a <- c(1,1,1,1,2,2,2,2,2)
b <- c(10,12,15,12,NA,30,42,38,40)
(s=split(b,a))
lapply(s,mean, na.rm=T)
