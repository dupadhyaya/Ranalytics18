# The Binomial Distribtion
#http://www.stat.umn.edu/geyer/old/5101/rlook.html

#dbinom is the R function that calculates the p. f. of the binomial distribution. Optional arguments described on the on-line documentation specify the parameters of the particular binomial distribution.

#Both of the R commands in the box below do exactly the same thing.

dbinom(27, size=100, prob=0.25)
dbinom(27, 100, 0.25)


#They look up P(X = 27) when X is has the Bin(100, 0.25) distribution
#Example Question: Suppose widgits produced at Acme Widgit Works have probability 0.005 of being defective. Suppose widgits are shipped in cartons containing 25 widgits. What is the probability that a randomly chosen carton contains exactly one defective widgit?
  
#Question Rephrased: What is P(X = 1) when X has the Bin(25, 0.005) distribution?
dbinom(1, 25, 0.005)

  
  Answer:
  
  