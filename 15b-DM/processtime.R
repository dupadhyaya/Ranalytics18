# Execution Time
proc.time()
g <- rnorm(100000)
h <- rep(NA, 100000)

# Start the clock!
ptm <- proc.time()

# Loop through the vector, adding one
for (i in 1:100000){
  h[i] <- g[i] + 1
}

# Stop the clock
proc.time() - ptm


#M2
(ptm <- proc.time())
h <- g + 1
proc.time()
(proc.time() - ptm)

#user  system elapsed 
#0.00    0.02    0.01
?proc.time

# M3 system.time
quickadd <- function(g){ 
  return(g+1)
}

slowadd <- function(g){
  h <- rep(NA, length(g))
  for (i in 1:length(g)){
    h[i] <- g[i] + 1
  }
  return(h)
}

system.time(a <- slowadd(g))
#user  system elapsed 
#0.34    0.00    0.34

system.time(a <- quickadd(g))
#user  system elapsed 
#0       0       0
#
#M5


# M3
system.time(x < 1:100000000)


system.time({
  # Do something that takes time
  x <- 1:100000
  for (i in seq_along(x))  x[i] <- x[i]+1
})

#>    user  system elapsed 
#>   0.144   0.002   0.153
#The output means it took 0.153 seconds to run
# the block of code.


#M5
sleep_for_a_minute <- function() { Sys.sleep(10) }

start_time <- Sys.time()
sleep_for_a_minute()
end_time <- Sys.time()

end_time - start_time
# Time difference of 1.000327 mins
# 
# 
# Benchmark ----
library("benchmarkme")
library("pryr")
Sys.info()
method1 = function(n) {
  vec = NULL # Or vec = c()
  for(i in seq_len(n))
    vec = c(vec, i)
  vec
}
method2 = function(n) {
  vec = numeric(n)
  for(i in seq_len(n))
    vec[i] = i
  vec
}
method3 = function(n) seq_len(n)
n=100
method3(100)

library("compiler")
library("memoise")
library("microbenchmark")
microbenchmark(times = 100, unit = "s", 
               method1(n=5000), 
               method2(n=5000), 
               method3(n=5000))

message("dhiraj")
