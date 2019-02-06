#purrr
#https://www.weirdfishes.blog/blog/practical-purrr/

df = mtcars

library(purrr)
library(dplyr)

#functions

mu = c(50,60, 70)
#3 lists of ND with different means, n=10, sd=1
mu %>% map(rnorm, n=10)
sigma = c(2,3,4)
#3 lists of 10 nos with different means and sd
map2(mu, sigma, rnorm, n=10)

n = c(10,20,30)
#ND lists of different values of n, mu, sd
list(n, mu, sigma ) %>% pmap(rnorm)

#different functions with different arguments
f <- c("runif", "rnorm", "rpois")
param <- list(
  list(min = -1, max = 1), 
  list(sd = 5), 
  list(lambda = 10)
)
#To handle this case, you can use invoke_map():
invoke_map(f, param, n = 5)
invoke_map(f, param, n = 5) %>% str()
