# Chi Squared Tests
# Goodness of Fit
#Links------
#http://www.r-tutor.com/elementary-statistics/goodness-fit/multinomial-goodness-fit
#http://math.hws.edu/javamath/ryan/ChiSquare.html


#The test is applied when you have one categorical variable from a single population. It is used to determine 
#whether sample data are consistent with a hypothesized distribution.

# When to use 
#1 Simple Random Sampling
#2 Variable is categorical - Count of grades A, B,C ; Colors etc
#3 min freq 5

# Hypothesis -----------

#Ho: data consistent with a specified distribution. (Observed as per prob)
#Ha: data are not consistent with a specified distribution.

#Interpret results -----------
# If P-value < significance level (0.05), we cannot accept the null hypothesis.


# School Grades
grades = c(50,45,5) # grades - cat variable
expgrades = c(0.3, 0.6,0.1) # theoretical distribution
chisq.test(grades) # exp calc from grades itself not correct
(ctest = chisq.test(x=grades, p=expgrades))
ctest$statistic
(q= qchisq(1-.05,df=2))
ctest$method

x <- rchisq(1000, 5) 
hist(x, prob=TRUE, ylim=c(0,0.2)) 
curve( dchisq(x, df=2), col='blue', add=TRUE)
abline(v=c(q,ctest$statistic), col=c('green','red'))
text(ctest$statistic-1, 0+0.1,srt=90, cex=0.75,
     labels = 'Test Statistics right of Table Line')


# Data from Table
HairEyeColor  # Margin Table of Hair vs Eye Colors : Count
(eye = margin.table(HairEyeColor,2))
eye
(ctest2 = chisq.test(x=eye, p=c(0.5,0.25,0.15,0.1)))
ctest2
qchisq(1-.05,df=3)
ctest2$p.value # < 0.05
ctest2$statistic # > chisq table value 
# Reject Ho : Data is not expected

# Data from Data Frame
