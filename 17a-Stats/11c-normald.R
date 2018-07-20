#Normal Distribution - Density

#Density
#dnorm is the R function that calculates the p. d. f. f of the normal distribution. As with pnorm and qnorm, optional arguments specify the mean and standard deviation of the distribution.

#There's not much need for this function in doing calculations, because you need to do integrals to use any p. d. f., and R doesn't do integrals. In fact, there's not much use for the "d" function for any continuous distribution (discrete distributions are entirely another matter, for them the "d" functions are very useful, see the section about dbinom).

#For an example of the use of pnorm, see the following section.

#Random Variates
#rnorm is the R function that simulates random variates having a specified normal distribution. As with pnorm, qnorm, and dnorm, optional arguments specify the mean and standard deviation of the distribution.

x <- rnorm(1000, mean=100, sd=15)
hist(x, probability=TRUE)
xx <- seq(min(x), max(x), length=100)
lines(xx, dnorm(xx, mean=100, sd=15))

#This generates 1000 i. i. d. normal random numbers (first line), plots their histogram (second line), and graphs the p. d. f. of the same normal distribution (third and forth lines).