# Hypothesis 1 sample Test

# Q : 1 sample ------------------------------------------------------------
#A random sample of 900 members has a mean 3.4 cm. 
#Can it be reasonably regarded as sample from a
#large population of mean 3.25 cm and SD 2.61 cms
#Ho : μ = 3.25  ; Ha : μ ≠ 3.25
library(TeachingDemos) 
za= qnorm(1-.05/2)
x=rnorm(1000,mean=3.25,sd=2.61)
plot(density(x))
z.test(3.4,mu=3.25,sd=2.61,n=900,conf.level = .975,
       alternative="two.sided")

zc = (3.4 - 3.25)/(2.61/sqrt(900))
abline(v=c(za,-za))
abline(v=zc, col='red')
#zc (calc) lies betw -za & za. Do not reject Ho

#One Sample z-test
#data:  3.4
#z = 1.7241, n = 900.000, Std. Dev. = 2.610, Std. Dev. of the sample
#mean = 0.087, p-value = 0.08468
#alternative hypothesis: true mean is not equal to 3.25
#95 percent confidence interval:  3.229483 3.570517
#sample estimates: mean of 3.4          3.4 

#[ |Z* = 1.724|   <   Zα/2 = 1.9599 : Accept Ho ]
#Sample mean(3.4) is falling in between the 95% Confidence Interval calculated : [3.229483, 3.570517]



# Q2 ----------------------------------------------------------------------
#Manufacturer claims that the average mileage of scooters of his company is 40 km/litre.
#A random sample of 38 scooters of the company showed an average mileage of 42 km/litre. Test the claim of the manufacturer on the assumption that the mileage of scooter is normally distributed with SD of 2 km/litre
#Ho : μ = 40  Ha : μ ≠ 40
qnorm(1-.05/2) #[1] 1.959964
z.test(42,mu=40,sd=2,n=38,conf.level = .95,
       alternative="two.sided")
#Sample mean(42) is falling in between the 95% Confidence Interval calculated : [41.36, 42.63]
#z = 6.1644, n = 38.00000, Std. Dev. = 2.00000, Std. Dev. of the sample mean = 0.32444, p-value = 7.074e-10

za2 = qnorm(1-.05/2, mean=40,sd=2,lower.tail=T)
za1 = qnorm(.05/2, mean=40,sd=2,lower.tail=T)
za1; za2
x = rnorm(1000,mean=40,sd=2)
plot(density(x))
abline(v=c(40,42))

mtext(side=1,at=40,text='Mean at 40',col='green')
text(x=42,y=.1,labels='Sample Mean at 42', col='purple', 
     srt=90, offset=0.5)
?text
abline(v=c(za1,za2), col='red')
text(x=za1-.5,y=0.1,labels='Left Bound', srt=90)
text(x=za2-.5,y=0.1,labels='Right Bound', srt=90)

# Sample mean lies between left and right bound

#One Sample z-test
#data:  42
#z = 6.1644, n = 38.00000, Std. Dev. = 2.00000, Std. Dev. of the sample mean = 0.32444, p-value = 7.074e-10
#alternative hypothesis: true mean is not equal to 40
#95 percent confidence interval:  41.3641 42.6359
#sample estimates: mean of 42  


# Conclusion[ |Z* = 6.61 |   <   Zα/2 = 1.9599 : Accept Ho ]
#Sample mean(42) is falling in between the 95% Confidence Interval calculated : [41.36, 42.63]


# Q3 ----------------------------------------------------------------------



#A stenographer claims that she can type at the rate of 120 words per min. 
#Can we reject her claim on the basis of 100 trials in which she demonstrates a mean of 116 words with a SD of 15 words ? Use 5% level of significance
#Ho : μ = 120   Ha : μ ≠ 120
qnorm(1-.05/2)#[1] 1.959964
z.test(116,mu=120,sd=15,n=100,conf.level = .95,alternative="two.sided")
?z.test

#[ |Z* =-2.667 |   >   Zα/2 = 1.9599 : Reject Ho ]
# use x as vector of values instead of one mean value
x = c(117,120,110,123,125, 114, 118,123, 117, 125)
length(x); mean(x) ; sd(x)
z.test(x,mu=120,sd=sd(x),n=length(x),conf.level = .95,alternative="two.sided")

# Q4 ----------------------------------------------------------------------


#Mean life of a sample of 400 fluorescent bulbs produced by a company is found to be 1570 hours with a SD of 150 h. Test the hypothesis that the mean life of the bulbs produced by the company is 1600 against the alternative hypothesis that it is greater than 1600 hours at 1% levels of significance
#Ho : μ = 1600  Ha : μ > 1600   : One Tail, Left Tail
qnorm(1-.01) #[1] 2.326348

z.test(x=1570,mu=1600,sd=150,n=400,conf.level = .95,alternative="greater")

#[ abs |Z* =-4 |   >   Zα/2 = 2.33    : Reject Ho ]

#Sample mean(1570) is not falling in between the 95% Confidence Interval calculated : [1557.664,   Inf ]
# Ha Mean is higher than 1600


