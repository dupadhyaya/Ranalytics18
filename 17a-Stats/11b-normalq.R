#Normal - inverse - qnorm

#qnorm is the R function that calculates the inverse c. d. f. F-1 of the normal distribution The c. d. f. and the inverse c. d. f. are related by

#p = F(x)  :x = F-1(p)
#So given a number p between zero and one, qnorm looks up the p-th quantile of the normal distribution. As with pnorm, optional arguments specify the mean and standard deviation of the distribution
#Example :Question: Suppose IQ scores are normally distributed with mean 100 and standard deviation 15. What is the 95th percentile of the distribution of IQ scores?
#Question Rephrased: What is F-1(0.95) when X has the N(100, 152) distribution?
qnorm(0.95, mean=100, sd=15)
