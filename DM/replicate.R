#replicate
#
?replicate
replicate(n, expr, simplify = "array")

replicate(4, rnorm(5))


my.fun = function() {
  
  for (i in 1:1000) {
    ...
    for (j in 1:20) {
      ...
    }
  }
  
  return(output)
  
}

rep(1:4,len=20)
replicate(1:4,len=20)
