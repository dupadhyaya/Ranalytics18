# Hypothesis Tests - t for n < 30

# Q1 ----------------------------------------------------------------------

#Random Sample of size 20 from a normal population has mean 42 and SD = 5. Test the Hypothesis that the population mean is 45. Use 5% level of significance
#Ho : μ = 45  Ha : μ ≠ 45   : Two Tail
qt(.975,df=19) #[1] 2.093024
#Calculate Z* since ND and SD is given.

z.test(42,mu=45,alternative="two.sided",n=20,sd=5)
 
# t* > tα/2  : -2.683 > 2.093  : Reject Ho


# Q4 ----------------------------------------------------------------------

#The average breaking strength of steel rods is specified to be 18.5 thousand per kg. For this a sample for 14 rods was tested. The mean and SD obtained were 17.85 and 1.955 respectively. Test the significance of the deviation.
#Ho : μ = 18.5  Ha : μ ≠ 18.5 (Two Tailed t test) 

#n=14, x̅ = 17.85 , s=1.955 , μ = 18.5 

# Result : Ho accepted


# Q5 ----------------------------------------------------------------------
#The nine items of a sample had the following items. 45,47,50,52,48,47,49,53,51 .
#  Does the mean of nine items differ significantly from the assumed population mean of 47.5
#N = 9 (N<30) we use t-test.  Ho : μ = 47.5  Ha : μ ≠ 47.5 (Two Tailed t test) 
qt(.975,df=8) #[1] 2.306004
x = c(45,47,50,52,48,47,49,53,51)
t.test(x, alternative="two.sided",mu=47.5,conf.level = .95)
t.test(x,mu=47.5,conf.level = .95)
t.test(x,mu=47.5)
qt(p=.95+.05/2,df=length(x)-1)
mean(x)
#|t* = 1.8452 | < tα/2  : Do not reject Ho
#Sample Mean between confidence interval


# Q6 ----------------------------------------------------------------------


#A drug manufacturer has installed a machine which automatically fills 5 gm of drug in each phial. A random sample of  fills was taken and it was found to contain 5.02 gm on an average in phial. The sd of sample was 0.002 gms. SD of sample was 0.002 gms, Test at 5% level of significance if the adjustment in the machine is in order.
#Ho : μ = 5  Ha : μ ≠ 5 (Two Tailed t test) 

# Solve this????


#P value > 0.05 (significance level) : Do not reject Ho


# Q7 ----------------------------------------------------------------------

#Lifetime of Electric bulbs for a random sample of 10 from a large consignment gave the following data
#4.2 , 4.6, 3.9, 4.1, 5.2, 3.8, 3.9, 4.3, 4.4, 5.6  (in thousands 1000s)
#Can we accept the hypothesis that the average lifetime of bulb is 4000 hours
#Ho : μ = 4000  Ha : μ ≠ 4000 (Two Tailed t test) 
x = c(4.2 , 4.6, 3.9, 4.1, 5.2, 3.8, 3.9, 4.3, 4.4, 5.6)
t.test(x*1000, alternative="two.sided",mu=4000)
# t* < t(table) : for df=9  at alpha=0.05 : Ho accepted


# Q8 ----------------------------------------------------------------------
#Machine is designed to produce insulating washers for electrical devices of average thickness of 0.025 cm. A random sample of 10 washers was found to have a mean thickness of 0.024 cm with a SD of 0.002 cm. Test the significance of the deviation at 5%
#Ho : μ = 0.025  Ha : μ ≠ 0.025 (Two Tailed t test) 
# Solve This ????

#Result :Ho accepted
