# Apply Commands

# apply Functions
# #apply ----
#create matrix####
m1 = matrix(1:10,nrow=5)
m1

# create sample data of Matrix : Use ND data : 3 cols, 30 rows
m2 <- matrix(data=cbind(rnorm(30, 0), rnorm(30, 2), rnorm(30, 5)), nrow=30, ncol=3)
m2

# apply is used for structured data - matrix, dataframe with same number of coln & rows
# https://www.r-bloggers.com/using-apply-sapply-lapply-in-r/
# apply Mean on Rowise on all 3 Column
m1
apply(m1, 1, mean)
apply(m1, 2, mean)
# apply function on particular values : count number of negative values
apply(m2, 2, function(x) length(x[x<0]))
m2
apply(m2, 2, function(x) is.numeric(x))
apply(m2, 1, function(x) is.character(x))
apply(m2, 2, function(x) is.vector(x))

apply(m2, 2, function(x) mean(x[x>0]))

# sapply
sapply(1:3, function(x) x^2)

sapply(m[1,], function(x) x^2)
sapply(m[,2], function(x) x^2)

# lapply - return list rather than a vector
lapply(1:3, function(x) x^2)
unlist(lapply(1:3, function(x) x^2))

mean(m[,1])
mean(m[,3])

#https://www.r-bloggers.com/the-apply-command-101/

# tricks
sapply(1:3, function(x) mean(m[,x]))
# dataset name pass as y 
sapply(1:3, function(x, y) mean(y[,x]), y=m)

# Means of various colns
meanset = c( mean(m[,1]), mean(m[,2]), mean(m[,3]))
meanset

# fiven no summary five number summary (minimum, lower-hinge, median, upper-hinge, maximum) for the input data

sum1 = apply(m,2,fivenum)
sum1
?fivenum
mean(m[,2])
sum2 = apply(m,2,summary)
sum2

# rowmeans
rowMeans(m)
colMeans(m)

# trimming data
mean(m[,1])
mean(m[,1],trim=0.5)


a1 = array(1:(3*4*2), dim=c(3,4,2))
a1
#5 rows, 4 cols, 3 matrices
apply(a1, 1, sum)
apply(a1, 2, sum)
apply(a1, c(3), sum)


apply(a1, c(1,2), sum)
apply(a1, c(2,3), sum)
apply(a1, c(1,2,3), sum)
apply(a1, c(1,3), sum)

