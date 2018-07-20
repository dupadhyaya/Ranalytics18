# gradient descent4
#https://rstudio-pubs-static.s3.amazonaws.com/159940_4a7d620cb4e0460486c364281cdf5780.html

#First, let’s generate some data to work with, let’s define our training example with 4 features:
  
set.seed(11)
x <- matrix(rnorm(400), ncol = 4)
x
y <- rnorm(100)
y
m <- length(y)
m
X<-cbind(rep(1, 100), x)
X
theta<-rep(0,5)
theta
#Second, set up the cost function for least square linear regression:
length(y)  
compCost<-function(X, y, theta){
    m <- length(y)
    J <- sum((X%*%theta - y)^2)/(2*m)
    return(J)
  }
#Next, set up the gradient descent function, running for iterations:
  
gradDescent<-function(X, y, theta, alpha, num_iters){
    m <- length(y)
    J_hist <- rep(0, num_iters)
    for(i in 1:num_iters){
      
      # this is a vectorized form for the gradient of the cost function
      # X is a 100x5 matrix, theta is a 5x1 column vector, y is a 100x1 column vector
      # X transpose is a 5x100 matrix. So t(X)%*%(X%*%theta - y) is a 5x1 column vector
      theta <- theta - alpha*(1/m)*(t(X)%*%(X%*%theta - y))
      
      # this for-loop records the cost history for every iterative move of the gradient descent,
      # and it is obtained for plotting number of iterations against cost history.
      J_hist[i]  <- compCost(X, y, theta)
    }
    # for a R function to return two values, we need to use a list to store them:
    results<-list(theta, J_hist)
    return(results)
  }
#Then, let’s set a training rate alpha and number of iterations to perform gradient descent:
  
alpha <- .1
num_iters <- 150
results <- gradDescent(X, y, theta, alpha, num_iters)
theta <- results[[1]]
cost_hist <- results[[2]]
print(theta)
##             [,1]
## [1,]  0.04636521
## [2,]  0.09681053
## [3,]  0.10089729
## [4,] -0.11856147
## [5,] -0.20665900
#Finally let’s plot the cost history:
  
plot(1:num_iters, cost_hist, type = 'l')
