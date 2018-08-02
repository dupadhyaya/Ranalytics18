# Equally spaced values - pretty

set.seed(1234)
marks = ceiling(rnorm(100,60,15))

?pretty
pretty(marks,10)

marks2 = ceiling(runif(100,20,90))
pretty(marks2,4) #4+1 Interval
pretty(marks2,5) #5+1 Interval

marks2 = ceiling(runif(100,25,90))
pretty(marks2,4) #4+1 Interval
pretty(marks2,5) #5+1 Interval

