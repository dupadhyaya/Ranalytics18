#Normal Distribution

#pnorm is the R function that calculates the c. d. f.

#F(x) = P(X <= x)
#where X is normal. Optional arguments described on the on-line documentation specify the parameters of the particular normal distribution.
#Both of the R commands in the box below do exactly the same thing.


pnorm(27.4, mean=50, sd=20)
pnorm(27.4, 50, 20)

#what is the probability of x being < 27.4 from distribution having mean 50 and sd 20
#They look up P(X < 27.4) when X is normal with mean 50 and standard deviation 20.


#Question: Suppose widgit weights produced at Acme Widgit Works have weights that are normally distributed with mean 17.46 grams and variance 375.67 grams. What is the probability that a randomly chosen widgit weighs more then 19 grams?
  
#Question Rephrased: What is P(X > 19) when X has the N(17.46, 375.67) distribution?
  
# Caution: R wants the s. d. as the parameter, not the variance. We'll need to take a square root!

#Answer:
1 - pnorm(19, mean=17.46, sd=sqrt(375.67))

