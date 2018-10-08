# Mean

set.seed(1234)
x = rnorm(100, 50, 10)  # 100 random nos mean-50, Sd-10
x = ceiling(x)
x
meanx = sum(x) / length(x)
meanx
mean(x)
summary(x)

#  Trimming Values
x
set.seed(1234)
x = ceiling(runif(100,50,100)) # Extreme values
x
mean(x)
mean(x, trim = 1)

# NA values - Remove
x[c(1,20,30)] = NA
x
length(na.omit(x))  #3 values
mean(x) # error
mean(x, na.rm=T)

# Trim
x <- c(0:10, 50)
x
xm <- mean(x)
c(xm, mean(x, trim = 0.10))  # with & without Trim
