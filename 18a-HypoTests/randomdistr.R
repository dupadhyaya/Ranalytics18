# Random Numbers

#uniformly distributed (flat) random numbers, use runif(). 
#By default, its range is from 0 to 1.
runif(1)

# Get a vector of 4 numbers
runif(4)

# Get a vector of 3 numbers from 0 to 100
runif(3, min=0, max=100)


# Get 3 integers from 0 to 100
# Use max=101 because it will never actually equal 101
floor(runif(3, min=0, max=101))

# This will do the same thing
sample(1:100, 3, replace=TRUE)

# To generate integers WITHOUT replacement:
sample(1:100, 3, replace=FALSE)



#Generate a random number between 5.0 and 7.5

x1 <- runif(1, 5.0, 7.5)
x1

x2 <- runif(10, 5.0, 7.5)
x2



x3 <- sample(1:10, 1)
x3

x4 <- sample(1:10, 5, replace=T)
x4

x5 <- sample(1:40, 6, replace=F)
x5

sample(state.name, 10)

sample(state.name, 52)  # error


?runif
?sample
?.Random.seed



# Random Numbers - Normal Distribution
rnorm(4)
#> [1] -2.3308287 -0.9073857 -0.7638332 -0.2193786

# Use a different mean and standard deviation
rnorm(4, mean=50, sd=10)
#> [1] 59.20927 40.12440 44.58840 41.97056

# To check that the distribution looks right, make a histogram of the numbers
x <- rnorm(400, mean=50, sd=10)
hist(x)


# Sample
#Another approach to randomization is the sample function,
#which pulls elements from an object (such as a vector) of defined values or, alternatively, can be specified to select cases from a string of integers. The function also has the option of specifying whether replacement will be used or not.

?sample
sample(x, size, replace = FALSE, prob = NULL)
#If x has length 1, is numeric (in the sense of is.numeric)
#and x >= 1, sampling via sample takes place from 1:x.


RandomSample <- sort(sample(99, 100, replace=TRUE))
RandomSample

RandomSample <- sort(sample(1:99, 100, replace=TRUE))
RandomSample

# same Random nos with set.seed
set.seed(100)
RandomSample <- sort(sample(99, 100, replace=TRUE))
RandomSample
set.seed(100)
RandomSample <- sort(sample(99, 100, replace=TRUE))
RandomSample

# Conditions in Sample
# sample()'s surprise -- example
x <- 1:10
sample(x[x >  8]) # length 2
sample(x[x >  9]) # oops -- length 10!
sample(x[x > 10]) # length 0

# Resample
resample <- function(x) x[sample.int(length(x))]
resample(x[x >  8]) # length 2
resample(x[x >  8]) # length 2

resample(x[x >  9]) # length 1
resample(x[x > 10]) # length 0


# the list of party-goers
dwarves <- c("Fíli", "Kíli", "Balin", "Dwalin", "Óin", "Glóin", "Bifur", "Bofur", "Bombur", "Ori", "Nori", "Dori", "Thorin") 
# draw a sorted sample of 5 without replacement
Party <- sort(sample(dwarves, 5))
# print the names
Party
