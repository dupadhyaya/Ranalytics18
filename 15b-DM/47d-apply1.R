#apply APPLY

#apply - When you want to apply a function to the rows or columns of a matrix (and higher-dimensional analogues); not generally advisable for data frames as it will coerce to a matrix first.

# Two dimensional matrix
(M <- matrix(seq(1,16), 4, 4))

# apply min to rows
apply(M, 1, min)
#[1] 1 2 3 4

# apply max to columns
apply(M, 2, max)
[1]  4  8 12 16

# 3 dimensional array
(M <- array( seq(32), dim = c(4,4,2)))

# Apply sum across each M[*, , ] - i.e Sum across 2nd and 3rd dimension
apply(M, 1, sum)
# Result is one-dimensional
#[1] 120 128 136 144
apply(M, 2, sum)

apply(M, 3, sum)

# Apply sum across each M[*, *, ] - i.e Sum across 3rd dimension
apply(M, c(1,2), sum)
# Result is two-dimensional
#[,1] [,2] [,3] [,4]
#[1,]   18   26   34   42
#[2,]   20   28   36   44
#[3,]   22   30   38   46
#[4,]   24   32   40   48
