# Apply - mapply

#‘multivariate’ apply. Its purpose is to be able to vectorize arguments 
#to a function
#that is not usually accepting vectors as arguments.

# Create a 4x4 matrix
Q1 <- matrix(c(rep(1, 4), rep(2, 4), rep(3, 4), rep(4, 4)),4,4)

# Print `Q1`
(Q1)

# Or use `mapply()`
(Q2 <- mapply(rep,1:4,5))
#same length of 4 translates to matrix
# Print `Q2`
print(Q2)


# List -----
list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))
mapply(rep, 1:4, 4:1)
# different length translates to list

# ------
#https://leemendelowitz.github.io/blog/mapply.html
noise <- function(n, mean, std) {
  rnorm(n, mean, std)
}
noise(5, 1, 2)  # 5 random normally distributed values with mean, sd
#noise function is not vectorized. mapply gives us a way
mapply(noise, 1:5, 1:5, 2)  # pairs (1,1), (2,2)

#http://www.studytrails.com/r/core/control_structures_r_apply_functions_2/

2^3 ;  4^2  #= 8 and 16
mapply(function(x,y) x^y, x=c(2,4), y=c(3,2))
#call a function FUN over vectors or lists one index at a time. 
#arguments x and y are recycled if they are of different lengths
mapply(function(x,y){x^y},c(a=2,b=3),c(A=3,B=4))
mapply(function(x,y){x^y},c(a=2,b=3),c(A=3,B=4),USE.NAMES=FALSE)

mapply(function(x,y,z,k){(x+k)^(y+z)},x= c(a=2,b=3),
       y=c(A=3,B=4),MoreArgs=list(z=1,k=2))
#values z and k are 1 and 2 respectively. So the first evaluation of function gives (2+2)^(3+1) and the second gives (3+2)^(4+1)
