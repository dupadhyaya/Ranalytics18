# Hypothesis Tests - 2 Sample ---------------------------------------------
options(digits=2)
# Check for Difference Between Two Population Means: Different Hypothesis
#l. Ho: mu1  = mu2   Ha : mu1 != mu2 
#2. Ho: mu1 >= mu2   Ha : mu1 < mu2 
#3. Ho: mu1 <= mu2   Ha : mu1 > mu2 
#http://www.stat.columbia.edu/~martin/W2024/R2.pdf

# Dependent Samples -------------------------------------------------------
# Drawn from Same Population

# Independent Samples -----------------------------------------------------
# Drawn from Different Population


#Sample size < 30 and/or Population SD unknown ####
#Independent Samples

#Q1: (7.43) Two salesman A and B are working in certain district. 
#From a sample survey conducted by the head office, the following result were obtained.
#State whether there is any significant difference in the average sales between the two salesman
#Salesman A : n1=20 (No of Sales), x1bar = 170 (Average Sales), sd1 = 20 (Std Dev)
#Salesman B : n2=18 (No of Sales), x2bar = 205 (Average Sales), sd2 = 25 (Std Dev)
# No of samples each Data < 30 : Use t test (as Populations are different)
#t.test to be use in r, but sample values are not given, only summary
n1=20;x1bar = 170; sd1 = 20 ; # Salesman A
n2=18;x2bar = 205; sd2 = 25 ; #Salesman B
#Ho: x1bar = x2bar
#Ha: x1bar != x2bar
df1=n1-1 ; df2=n2-1
paste("Salesman A -",n1,x1bar,sd1,df1)
paste("Salesman B -",n2,x2bar,sd2,df2)

dfc = df1 + df2
alpha = 0.05  # assume if not given
cl = 1 - alpha/2  # confidence level since it is two tailed


ttable = qt(cl, dfc ) # table value for conf level/alpha & degree of freedom
#Sv = sqrt(((df1 * sd1^2) + (df2 * sd2^2))/(n1+n2-2)) # pooled SD
Sv = sqrt(((df1 * sd1^2) + (df2 * sd2^2))/(df1+df2)) # pooled SD
paste("combined df=",dfc,"alpha=",alpha, "cl=",cl, 'S pooled =',Sv )

tcalc = (x1bar - x2bar)/ (Sv * sqrt(1/n1 + 1/n2)) # calculated value of t 
(170-205)/(23*sqrt((1/19+1/17)))


paste(' t-test =', tcalc,' ttable = ', ttable)
ta=ttable # to make it atomic
#round(ta,digits=4); round(ttable,digits=4)
if(abs(tcalc) > ta) paste("Ho is rejected" ,abs(tcalc) ,'>',ta) else paste("Failed to Reject Ho" ,abs(tcalc) ,'<',ta )


# Question2 ---------------------------------------------------------------

# A statistics teacher wants to compare his two classes to see if they performed any differently on
# the tests he gave that semester. Class A had 25 students with an average score of 70, standard
# deviation 15. Class B had 20 students with an average score of 74, standard deviation 25. Using
# alpha 0.05, did these two classes perform differently on the tests?
n1=25; x1bar=70; sd1=15;
n1=20; x2bar=74; sd2=25;

#Ho: x1bar = x2bar
#Ha: x1bar != x2bar
df1=n1-1 ; df2=n2-1
paste("Class A -",n1,x1bar,sd1,df1)
paste("Class B -",n2,x2bar,sd2,df2)

dfc = df1 + df2
alpha = 0.05  # assume if not given
cl = 1 - alpha/2  # confidence level since it is two tailed

ttable = qt(cl, dfc ) # table value for conf level/alpha & degree of freedom
#Sv = sqrt(((df1 * sd1^2) + (df2 * sd2^2))/(n1+n2-2)) # pooled SD
Sv = sqrt(((df1 * sd1^2) + (df2 * sd2^2))/(df1+df2)) # pooled SD
paste("combined df=",dfc,"alpha=",alpha, "cl=",cl )

tcalc = (x1bar - x2bar)/ (Sv * sqrt(1/n1 + 1/n2)) # calculated value of t 
(70-74)/(20.34*sqrt((1/25+1/19)))
paste('S pooled =',Sv,' t-test =', tcalc,' ttable = ', ttable)
ta=ttable # to make it atomic
#round(ta,digits=4); round(ttable,digits=4)
if(abs(tcalc) > ta) paste("Ho is rejected" ,abs(tcalc) ,'>',ta) else paste("Failed to Reject Ho" ,abs(tcalc) ,'<',ta )

#-----------------


# Question 3 --------------------------------------------------------------

# @7.45 : Below are the given gain of weiths in lbs of lions on two diet X and Y
#Teat at 5% significance level whether the two dietes differ significantly in increasing weight  
x1 = x = c(25,32,30,32,24,14,32)
x2 = y = c(24,34,22,30,42,31,40,30,32,35)
# Step 1 : Frame Hypothesis #Ho: x1bar = x2bar ; Ha: x1bar != x2bar

x1bar = mean(x1); x2bar = mean(x2)
n1 = length(x1) ; n2 = length(x2)
paste('x1bar= ',x1bar,' x2bar= ',x2bar,' Sample size x= ',n1,' Sample Size y= ',n2)
sum((x1 - x1bar)^2); sum((x2 - x2bar)^2)
#sd1 = sd(x1) ; sd2 = sd(x2) #for testing
sd1a = sqrt(sum((x1 - x1bar)^2)/n1); sd2a = sqrt(sum((x2 - x2bar)^2)/n2) # manually calc sd
paste("X : SD - Using R=", sd1,' X-Calc= ',sd1a,"Y : SD - Using R=", sd2,' Y-Calc= ',sd2a)
df1=n1-1 ; df2=n2-1
paste("Diet X -",n1,x1bar,sd1,df1)
paste("Diet Y -",n2,x2bar,sd2,df2)


dfc = df1 + df2
alpha = 0.05  # assume if not given
cl = 1 - alpha/2  # confidence level since it is two tailed
paste("combined df=",dfc,"alpha=",alpha, "cl=",cl )

ttable = qt(cl, dfc ) # table value for conf level/alpha & degree of freedom
#Sv = sqrt(((df1 * sd1^2) + (df2 * sd2^2))/(n1+n2-2)) # pooled SD
Sv = sqrt(((df1 * sd1^2) + (df2 * sd2^2))/(df1+df2)) # pooled SD
sqrt(((df1 * sd1^2) + (df2 * sd2^2))/(df1+df2))

tcalc = (x1bar - x2bar)/ (Sv * sqrt(1/n1 + 1/n2)) # calculated value of t 
(27-32)/(6.4*sqrt((1/6+1/9)))

paste('S pooled =',Sv,' t-test =', tcalc,' ttable = ', ttable)
ta=ttable # to make it atomic
#round(ta,digits=4); round(ttable,digits=4)
if(abs(tcalc) > ta) paste("Ho is rejected" ,abs(tcalc) ,'>',ta) else paste("Failed to Reject Ho : Accept Ho ::" ,abs(tcalc) ,'<',ta )

t.test(x1,x2,alternative='two.sided',paired=F,var.equal=T)




