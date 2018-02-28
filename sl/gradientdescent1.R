# Gradient Descent
# http://econometricsense.blogspot.in/2011/06/gradient-descent.html
# Read above gradient concepts
#http://econometricsense.blogspot.in/2011/11/gradient-descent-in-r.html
#f(x) = x^4 - 3*x^3 + 2
# set up a stepsize
alpha = 0.003

# set up a number of iteration
iter = 500

# define the gradient of f(x) = x^4 - 3*x^3 + 2
gradient = function(x) return((4*x^3) - (9*x^2))

# randomly initialize a value to x
set.seed(100)
x = floor(runif(1)*10)
x
# create a vector to contain all xs for all steps
x.All = vector("numeric",iter) # iterate 500 times
#vector('integer',10)
?vector
x.All
# gradient descent method to find the minimum
# Stepwise 
#x ;gradient(x); alpha*gradient(x);  x - alpha*gradient(x); x = x - alpha*gradient(x)
#x ;gradient(x); alpha*gradient(x);  x - alpha*gradient(x); x = x - alpha*gradient(x)
#...
# these value of x are stored in blank vector
for(i in 1:iter){
  x = x - alpha*gradient(x)
  x.All[i] = x
  print(x) # print last value of x
}
head(x.All); x
# print result and plot all xs for every iteration
print(paste("The minimum of f(x) is ", x, sep = ""))
#layout(matrix(c(1,2,3,4),2,2))
layout(1,1)
plot(x.All, type = "l")

