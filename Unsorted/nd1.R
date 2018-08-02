# Stats Questions
# Normal Distribution

# Q1: 95% of students at school weigh between 62 kg and 90 kg.
# Assuming this data is normally distributed,
# what are the mean and standard deviation?
#pnorm, qnorm
#(z1 = for p = .025); z2 for p2 =(.95+.025)) 
x1=62; y1=90
#Linear Equations
#z1 * sd + m = x1
#z2 * sd + m = x2
library(matlib) 
#https://cran.r-project.org/web/packages/matlib/vignettes/linear-equations.html
#
#Eg1a
(z1 = qnorm(p=.025)); (z2=qnorm(p=.975))
(A <- matrix(c(z1,1, z2, 1), ncol=2, byrow=T))
(b <- c(62,95))
cbind(A,b)
showEqn(A, b)
plotEqn(A,b)
plotEqn(A,b, xlim=c(-10, 10))
abline(v=8, h=78)
(x <- MASS::ginv(A) %*% b)
points(x[1], x[2], pch=15)   # approx Solution
solve(A, b)
#8.418522 78.500000
# Ans mean-76, mean-7
# Proba values from Table equivalent to this command Z -> P
round(pnorm(c(-3,0,3)),4)
#0.0013 0.5000 0.9987

# Probability to Z :P -> Z
round(qnorm(c(0.0013, 0.5000, 0.9987)),3)
#[1] -3.011  0.000  3.011

# 95% students betw 62 and 90 : area lies in center : 2.5% on each side




# Function to calculate p values (area)
funcZ <- function(x1,mean1=0, sd1=1) {
  (exp(-(1/2)* ((x1- mean1)/sd1)^2) / (sd1 * (2 * pi)^.5))
}
funcZ(x1=-3)
#Table of Z
(zvalues = seq(-3,2.99,by=.01))
(pvalues = pnorm(zvalues))
(mztable = matrix(round(pvalues,3), ncol=10, byrow=T)  )
rownames(mztable) = c(-3,3,by=.1)
dim(mztable)

round(pnorm(zvalues),4)

#Q2: 99.7% of the components have lengths between 1.176 cm and 1.224 cm.
#Assuming this data is normally distributed, what are the mean and standard deviation?
(z2a=qnorm(p=(1-.997)/2))
(z2b=qnorm(p=.997+(1-.997)/2))
x2a=1.176; x2b=1.224
(A <- matrix(c(z2a,1, z2b, 1), ncol=2, byrow=T))
(b <- c(x2a,x2b))
cbind(A,b)
showEqn(A, b)
plotEqn(A,b)
plotEqn(A,b, xlim=c(-3, 3))
#abline(v=8, h=78)
(x <- MASS::ginv(A) %*% b)
points(x[1], x[2], pch=15)   # approx Solution
solve(A, b)
#[1] 0.008086967 1.200000000

#Q3: 68% of the marks in a test are between 51 and 64
perc=.68
(z3a=qnorm(p=(1-perc)/2))
(z3b=qnorm(p=perc+(1-perc)/2))
x3a=51; x3b=64
(A <- matrix(c(z3a,1, z3b, 1), ncol=2, byrow=T))
(b <- c(x3a,x3b))
cbind(A,b)
showEqn(A, b)
plotEqn(A,b)
plotEqn(A,b, xlim=c(-5, 10), ylim=c(0,100))
#abline(v=8, h=78)
(x <- MASS::ginv(A) %*% b)
points(x[1], x[2], pch=15)   # approx Solution
solve(A, b)
#[1]  6.536225 57.500000

#Q5 : x1= 250 ; mean=255; sd=2.5 Tea packets
x1= 250 ; mean=255; sd=2.5
(pnorm(x1, mean, sd)) * 100
# Perc 2.275013 % are underweight ie less than 250

#Q6 : x1 = 50 ; mean= 42 ; sd=8 : Scores what percentage of students pass the test
x1 = 50 ; mean= 42 ; sd=8
1-(p1=(pnorm(q=x1, mean, sd)) )
(p1=(pnorm(q=50, mean, sd,lower.tail = F)) ) * 100
# 10% of students pass the exam
# # alternative
((50-42)/8)
#1sd -> 68%; #bal - 32% ; #one side= 32%/2= 16%
#

#Q6: mean=3.1 ; sd=0.005 ; perc=99.7 : Machine Parts: Limits ?
mean=3.1 ; sd=0.005 ; perc=.997
# q values ?
(z1 = qnorm(p=(1-perc)/2, mean, sd))
(z2 = qnorm(p=perc+ (1-perc)/2, mean, sd))
#limits are 3.08, 3.11

#Q7: Temp : x1=39; x2=42; mean=36; sd= 3 ; find perc between
x1=39; x2=42; mean=36; sd= 3
perc = abs(pnorm(q=x1,mean,sd) - pnorm(q=x2,mean,sd))  # 14%
(days = perc * 30) # jun is of 30 days- 4

#Q8 : Height: x1=1.4; x2=1.6; mean=1.7; sd= 0.2 ; n= 400
x1=1.4; x2=1.6; mean=1.7; sd= 0.2 ; n = 400
(perc = abs(pnorm(q=x1,mean,sd) - pnorm(q=x2,mean,sd)))  # 24%
(nos = perc * n) # jun is of 30 days- 4
#96

#Q9 : Rainfall : x1=8.5 ; mean=10; sd=1.5; n=31
x1=8.5 ; mean=10; sd=1.5;  n =31
(perc = (pnorm(q=x1,mean,sd, lower.tail = T)))
(days = round(perc * n))
# 5 days

#Q10 :  : x1=22 ; x2=57 ; mean= 43; sd=14; n=5000 ; Population - Age
x1=22 ; x2=57 ; mean=43; sd=14;  n =5000
(perc = abs(pnorm(q=x1,mean,sd) - pnorm(q=x2,mean,sd)))  # .77
(nos = perc * n) # 3872



#Quiz2
#Q1: find P(0 < Z ≤ 1)
pnorm(q=0)- pnorm(q=1)

#Q2 : P(Z ≤ 2)
pnorm(q=2,lower.tail = T)

#Q3: P(-1.65 < Z ≤ 1.93)
pnorm(q=-1.65)- pnorm(q=1.93)

#Q4 : P(0.85 < Z ≤ 2.23)
pnorm(q=0.85)- pnorm(q=2.23)

#Q5: P(Z > 1.75)
1- pnorm(q=1.75, lower.tail = T)
pnorm(q=1.75, lower.tail = F)

#Q6: P(Z ≤ -0.69)
pnorm(q=-0.69, lower.tail = T)


#Q7 : P(-1.27 < Z ≤ 0)
(perc = pnorm(q=-1.27) - pnorm(q=0))

#Q8: P(Z  > -2.64)
1- pnorm(q=-2.64, lower.tail = T)
pnorm(q=-2.64, lower.tail = F)

#Q9: P(Z  ≤ 0.96)
pnorm(q=0.96, lower.tail = T)

#Q10 : P(-2.31 < Z  ≤ 0.82)
(perc = pnorm(q=-2.31) - pnorm(q=0.82))


#Quiz 3

#Q1 : mean=200 ; sd=40; x1>=250 ; P(x>250)
mean=200 ; sd=40; x1=250
1-pnorm(q=x1, mean, sd)
pnorm(q=x1, mean, sd, lower.tail = F)
