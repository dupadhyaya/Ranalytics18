#Sweep

#method signature is similar to 'apply' 
#though 'sweep' requires one more parameter, 'STATS'.
#'sweep' returns an array of the same shape as the input array, 
#whereas the result returned by 'apply' depends on the function passed in.
#https://stackoverflow.com/questions/3444889/how-to-use-the-r-function-sweep
# e.g., use 'sweep' to express a given matrix in terms of distance from 
# the respective column mean

# create some data:
(M = matrix( 1:12, ncol=3))

M+1
M+c(1,2)
M
M+c(1,2,3)
cbind(M, M+c(1,2,3))



# calculate column-wise mean for M
(dx = colMeans(M))
colSums(M)  # and not colsums

# now 'sweep' that summary statistic from M
sweep(M, 2, dx, FUN="-")
M ; dx

#      [,1] [,2] [,3]
#[1,] -1.5 -1.5 -1.5
#[2,] -0.5 -0.5 -0.5
#[3,]  0.5  0.5  0.5
#[4,]  1.5  1.5  1.5
sweep(M, 1, dx, FUN="-")   # Warning  - no recycle, less nos 3 and 4
(dy = rowMeans(M))
sweep(M, 1, dy, FUN="-")

M+1
M+c(1,2)
M
M+c(1,2,3)
cbind(M, M+c(1,2,3))
