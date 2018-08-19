


# Chi Sq - Goodness of Fit
#From the library Mass, select the survey dataset. 
library(MASS)
data(survey)
str(survey)

#What are the levels of Smokers. 
levels(survey$Smoke)


#Create frequency distribution using table command.
smoke.freq = table(survey$Smoke)
round(prop.table(smoke.freq)* 100,2)



#Percentage distribution of a given sample data is as follows. 
#Heavy   Never   Occas   Regul 
#4.5%   79.5%    8.5%    7.5%
#Carryout a Chi Square Test of Goodness of of Fit.  
#Determine whether the sample data in survey supports Distribution at .05 significance level
# Ho: Sample Data follows the distribution
# Ha: Sample Data does not fit the distribution
(smoke.prob = round(prop.table(smoke.freq),3))
sum(smoke.prob)
smoke.prob = c(.045, .795, .085, .075)
sum(smoke.prob)

smoke.prob
chisq.test(smoke.freq, p=smoke.prob) 

#As the p-value 0.991 is greater than the .05 significance level,
# we do not reject the null hypothesis that the sample data in survey
#  supports the campus-wide smoking statistics.
#