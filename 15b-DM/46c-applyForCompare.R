#apply LAPPLY SAPPLY


#lapply - When you want to apply a function to each element of a list in turn and get a list back.

#This is the workhorse of many of the other *apply functions. 
(x <- list(a = 1, b = 1:3, c = 10:100) )
lapply(x, FUN = length) 

lapply(x, FUN = sum) 


#sapply ------
#sapply - When you want to apply a function to each element of a list in turn,
#but you want a vector back, rather than a list.

#If you find yourself typing unlist(lapply(...)), stop and consider sapply.

x <- list(a = 1, b = 1:3, c = 10:100)
#Compare with above; a named vector, not a list 
sapply(x, FUN = length)  
#a  b  c   
#1  3 91

sapply(x, FUN = sum)   
#a    b    c    
#1    6 5005 

#In more advanced uses of sapply it will attempt to coerce the result to a multi-dimensional array, if appropriate. For example, if our function returns vectors of the same length, 
#sapply will use them as columns of a matrix:
  
sapply(1:5,function(x) rnorm(3,x))
#If our function returns a 2 dimensional matrix, 
#sapply will do essentially the same thing,
#treating each returned matrix as a single long vector:

func2 = function(x){
  rnorm(3,x)
}
func2(1)

sapply(1:5, func2)

for (i in 1:5) {
print(matrix(i,2,2))
}

matrix(5, 2,2)

sapply(1:5,function(x) matrix(x,2,2))
#Unless we specify simplify = "array", in which case it will use
#the individual matrices to build a multi-dimensional array:
  
sapply(1:5,function(x) matrix(x,2,2), simplify = "array")
#Each of these behaviors is of course contingent on our function returning 
#vectors or matrices of the same length or dimension.



summary <- function(x) {
  c(mean(x, na.rm = TRUE),
    median(x, na.rm = TRUE),
    sd(x, na.rm = TRUE),
    mad(x, na.rm = TRUE),
    IQR(x, na.rm = TRUE))
}

summary <- function(x) {
  funs <- c(mean, median, sd, mad, IQR)
  lapply(funs, function(f) f(x, na.rm = TRUE))
}

lapply(mtcars, function(x) length(unique(x)))
Filter(function(x) !is.numeric(x), mtcars)
integrate(function(x) sin(x) ^ 2, 0, pi)

formals(function(x = 4) g(x) + h(x))
environment(function(x = 4) g(x) + h(x))
