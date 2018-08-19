#Chi Square Test

#In the built-in data set survey, the Smoke column records the students smoking habit, while the Exer column records their exercise level. The allowed values in Smoke are "Heavy", "Regul" (regularly), "Occas" (occasionally) and "Never". As for Exer, they are "Freq" (frequently), "Some" and "None".

#We can tally the students smoking habit against the exercise level with the table function in R. The result is called the contingency table of the two variables.

library(MASS)       # load the MASS package 
tbl = table(survey$Smoke, survey$Exer) 
tbl                 # the contingency table 

#Test the hypothesis whether the students smoking habit is independent of their exercise level at .05 significance level.

#We apply the chisq.test function to the contingency table tbl, and found the p-value to be 0.4828.

chisq.test(tbl) 
#As the p-value 0.4828 is greater than the .05 significance level, we do not reject the null hypothesis that the smoking habit is independent of the exercise level of the students.
ctbl = cbind(tbl[,"Freq"], tbl[,"None"] + tbl[,"Some"]) 
ctbl 