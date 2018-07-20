# Hypothesis Tests - 2 Sample : Dependent Samples : Paired t-tests---------------------------------------------
options(digits=2)
# Check for Difference Between Two Population Means: Different Hypothesis
#l. Ho: mu1  = mu2   Ha : mu1 != mu2 
#2. Ho: mu1 >= mu2   Ha : mu1 < mu2 
#3. Ho: mu1 <= mu2   Ha : mu1 > mu2 
# Independent Samples  Drawn from Different Population-----------------------------------------------------

# Dependent Samples -------------------------------------------------------
# Drawn from Same Population
#There are many experimental settings where each subject in the study is in both the
#treatment and control group



#Sample size < 30 and/or Population SD unknown- t tests ####
#Dependent Samples 
# Cases (a) Sample Size are equal n1 = n1 (b) two sample are not independent but same observations are paired together
# Drug Given to same set of patients; Measurements done before & after the drug
# Training Given to same set of Students; Performance Measures before & after training
# or students performance in 2 subjects
#Ho : mu1  = mu2 ie the process/ drug / training / performance is not effective 
#Ha : mu1 != mu2 ie Effect is noticed
#di = yi = xi # difference in observations of ith observation 
#compute dbar = sum(di)/n  # mean difference
#compute Pooled Variance Sv^2 = 1/(n-1)* sum((di - dbar)^2)

# Q7.47
#To test whether a course in statistics improved performance a similar test was given
#to 12 particaipants.
x = c(44,40,61,52,32,44,70,41,67,72,53,72)
y = c(53,38,69,57,46,39,73,48,73,74,60,78)
x;y
#Using R formula for t test
t.test(x,y,alternative='two.sided',paired=T) # check ?t.test
ttable = qt(1-0.05/2,length(x)) ; ttable # Table value of t (critical value)
ta = ttable
#Ho: x1bar = x2bar
#Ha: x1bar != x2bar
n=length(x)
d = y -x
d ; d^2
sum(d^2)
dbar = mean(d); dbar
S= sqrt((1/(n-1))* sum((d - dbar)^2)) ; S # SD is Pooled SD since the sample are dependent  
tcalc = abs(dbar)/ (S / sqrt(n)) ; tcalc
if(abs(tcalc) > ta) paste("Ho is rejected, Difference Significant ",";Course Improved Performance" ,abs(tcalc) ,'>',ta) else paste("Failed to Reject Ho ; No Difference in Mean Values " ,abs(tcalc) ,'<',ta )



# Question 2 @ 7.48 -------------------------------------------------------

# You are given marks obtained by 11 students in two tests one before
# and one after special coaching. Do the data reveal that special coaching is effective
#In either of these situations we can’t use two-sample t-tests since the independence assumption is not valid. Instead we need to
#use a paired t-test. This can be done using the option paired =TRUE.
x=c(23,20,19,21,18,20,18,17,23,16,19)
y=c(24,19,22,18,20,22,20,20,23,20,17)
t.test(x,y,alternative='two.sided',paired=T)
# p < 0.3 : Ho is accepted



# Question @ 7.49  ---------------------------------------------------------------
#A certain stimulus when administered to each of the 12 patients
#result in the following increase of BP
d= x = c(5,2,8,-1,3,0,-2,1,5,0,4,6) # these are values of d = y-x
#Can it be concluded that the stimulus when will in General
#Calculate dbar, S (SD)
dbar = mean(d)
n = length(d)
S= sqrt((1/(n-1))* sum((d - dbar)^2)) ; S # SD is Pooled SD since the sample are dependent  
tcalc = dbar / (S / sqrt(n)) ;tcalc
ttable = qt(.975,n-1) ; ta=ttable
identical(tcalc, ttable) # checking for equality
compare::compare(1, 2, ignoreNames=T) # compare equality
if(abs(tcalc) > ta) paste("Ho is rejected" ,abs(tcalc) ,'>',ta) else paste("Failed to Reject Ho : Accept Ho ::" ,abs(tcalc) ,'<',ta )
# Ho is rejected: There is significant different by stimulus on BP



# Question 3 --------------------------------------------------------------

#Ex. A study was performed to test whether cars get better mileage on premium gas than
#on regular gas. Each of 10 cars was first filled with either regular or premium gas,
#decided by a coin toss, and the mileage for that tank was recorded. The mileage was
#recorded again for the same cars using the other kind of gasoline. We use a paired ttest
#to determine whether cars get significantly better mileage with premium gas
reg = c(16, 20, 21, 22, 23, 22, 27, 25, 27, 28)
prem = c(19, 22, 24, 24, 25, 25, 26, 26, 28, 32)
t.test(prem,reg,alternative="greater", paired=TRUE)
qt(1-0.05/2,length(reg))
# The results show that the t-statistic is equal to 4.47 > 2.2 and the p-value is 0.00075. Since
#the p-value is very low, we reject the null hypothesis. There is strong evidence of a
#mean increase in gas mileage between regular and premium gasoline.



# Question : Independent --------------------------------------------------

#Ex. 6 subjects were given a drug (treatment group) and an additional 6 subjects a
#placebo (control group). Their reaction time to a stimulus was measured (in ms). We
#want to perform a two-sample t-test for comparing the means of the treatment and
#control groups.
#Let mu1 be the mean of the population taking medicine and mu2 the mean of the untreated
#population. Here the hypothesis of interest can be expressed as:
#H0: mu1- mu2=0
#Ha: mu1- mu2<0
#Here we will need to include the data for the treatment group in x and the data for the
#control group in y. We will also need to include the options alternative="less", mu=0.
#Finally, we need to decide whether or not the standard deviations are the same in both groups