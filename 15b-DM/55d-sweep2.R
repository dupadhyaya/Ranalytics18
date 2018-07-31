#sweep

#The basic idea is to sweep through an 
#array row- or column-wise and return a modified array.

#you have a matrix and want to standardize it column-wise:

(dataPoints <- matrix(4:15, nrow = 4))

# Find means per column with `apply()`
(dataPoints_means <- apply(dataPoints, 2, mean))

# Find standard deviation with `apply()`
(dataPoints_sdev <- apply(dataPoints, 2, sd))

# Center the points 
(dataPoints_Trans1 <- sweep(dataPoints, 2, dataPoints_means,"-"))
print(dataPoints_Trans1)
##      [,1] [,2] [,3]
## [1,] -1.5 -1.5 -1.5
## [2,] -0.5 -0.5 -0.5
## [3,]  0.5  0.5  0.5
## [4,]  1.5  1.5  1.5
# Return the result
dataPoints_Trans1
##      [,1] [,2] [,3]
## [1,] -1.5 -1.5 -1.5
## [2,] -0.5 -0.5 -0.5
## [3,]  0.5  0.5  0.5
## [4,]  1.5  1.5  1.5
# Normalize
(dataPoints_Trans2 <- sweep(dataPoints_Trans1, 2, dataPoints_sdev, "/"))

# Return the result
dataPoints_Trans2
##            [,1]       [,2]       [,3]
## [1,] -1.1618950 -1.1618950 -1.1618950
## [2,] -0.3872983 -0.3872983 -0.3872983
## [3,]  0.3872983  0.3872983  0.3872983
## [4,]  1.1618950  1.1618950  1.1618950

#NB: for this simple example the same result can of course be achieved more easily by
apply(dataPoints, 2, scale)


?attitude
dim(attitude)
head(attitude)
(med.att <- apply(attitude, 2, median))
?sweep(data.matrix(attitude), 2, med.att)  
# subtract the column medians

## More sweeping:
#Create a array of values 1 to 24 with 3 dimension - 4,3,2
(A <- array(1:24, dim = 4:2))

## no warnings in normal use
#Subtract 5 from each row value
sweep(A, 1, 5)
(A.min <- apply(A, 1, min))  # == 1:4
sweep(A, 1, A.min)
apply(A, 1:2, median)
sweep(A, 1:2, apply(A, 1:2, median))

## warnings when mismatch
sweep(A, 1, 1:3)  # STATS does not recycle
sweep(A, 1, 6:1)  # STATS is longer

## exact recycling:
sweep(A, 1, 1:2)  # no warning
sweep(A, 1, as.array(1:2))  # warning
as.array(1,2)
