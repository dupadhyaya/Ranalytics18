# Poission Distribution

?poisson
# 12 cars crossing a bridge per minute on average, find the probability of having 
# 17 or more cars crossing the bridge in a particular minute.
ppois(16, lambda=12)   # lower tail sixteen or less cars 
ppois(16, lambda=12, lower=FALSE)   # upper tail seventeen or more cars 

?ppois
# Q1: 1 yr - 18 accidents, P(X=2) Exact
lambda = 18/12 # accidents / month
q=2
ppois(q, lambda, lower.tail = T)

# at least 1 accident P(X>=1)
1 - ppois(q=0, lambda)
ppois(q=0, lambda, lower.tail = F)


#probability that there are more than 2 accidents in a particular month
ppois(q=2, lambda, lower.tail = F)   # right side
#1 - (P(0) + P(1) + P(2))
(ppois(q=c(0,1,2,3,4,5), lambda, lower.tail = T))  # cumulative
1-ppois(q=c(2), lambda, lower.tail = T)
#Table gives us cumulative probability.

# mean=3 ; P(X = 4) = P(X ≤ 4) − P(X ≤ 3) = 0.815 − 0.647 = 0.168
lambda=3
ppois(q=4, lambda, lower.tail = T) - ppois(q=3, lambda, lower.tail = T)
#P(X=4 exactly)

#Q: Patients = 6/hr, lambda=3/30min ; X=4
lambda=6/2; q=4
ppois(q,lambda) - ppois(q-1,lambda) #0.1680314

#Q : Outrages  = 4/hr ; X=3, x>=3
lambda=4 ; q=3
ppois(q,lambda) - ppois(q-1,lambda) #0.195
ppois(q,lambda, lower.tail = F) #0.566

#Q : Trucks : exactly 5
lambda= 3 * 2 ; q=5
ppois(q,lambda) - ppois(q-1,lambda) #0.160

#Q: Messages arrive at a switching centre at random and 
#at an average rate of 1.2 per second.
#(a) Find the probability of 5 messages arriving in a 2-sec interval.
lambda = 1.2*2 ; q=5
ppois(q,lambda, lower.tail = T) - ppois(q-1,lambda, lower.tail = T) #0.06
exp(-lambda) * (lambda)^q / factorial(q)
#0.060


#Q three or more will fail within ten years?
(lambda = 5000000 * (10^-6))
ppois(q=2, lambda, lower.tail = F)  #0.875348
1- ppois(q=2, lambda, lower.tail = T)  #0.875348
#0.875