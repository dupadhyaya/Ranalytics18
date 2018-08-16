# Replicates

?replicate

# 5 values/rows, 4 columns
set.seed(1234)
(m1=cbind(rnorm(5), rnorm(5),rnorm(5),rnorm(5)))
set.seed(1234)
(m2=replicate(4, rnorm(5)))
sum(m1)
sum(m2)
