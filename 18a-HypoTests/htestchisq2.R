# Chi squared Tests 2
# http://stattrek.com/chi-square-test/independence.aspx?Tutorial=AP

# Q1 ----------------------------------------------------------------------

#Ho: Gender and voting preferences are independent. 
#Ha: Gender and voting preferences are not independent.

#Formulate an analysis plan. For this analysis, the significance level is 0.05.

#Analyze sample data. Applying the chi-square test for independence to sample data, 
#we compute the degrees of freedom, the expected frequency counts, and the chi-square test statistic. 
#Based on the chi-square statistic and the degrees of freedom, we determine the P-value.
# Find Chisq (table values from R command alpha=.05 ie CL = .95 & df = 7)
qchisq(.95, df=7)
#dchisq(x, df, ncp = 0, log = FALSE)
#pchisq(q, df, ncp = 0, lower.tail = TRUE, log.p = FALSE)
#qchisq(p, df, ncp = 0, lower.tail = TRUE, log.p = FALSE)
#rchisq(n, df, ncp = 0)
?chisq.test
?Chisquare
chisq.test(x, y = NULL, correct = TRUE, p = rep(1/length(x), length(x)), 
    rescale.p = FALSE, simulate.p.value = FALSE, B = 2000)


# Chi Squared

# Q1 ----------------------------------------------------------------------
#http://www.r-tutor.com/elementary-statistics/goodness-fit/chi-squared-test-independence

#In the built-in data set survey, the Smoke column records the students smoking habit, 
#while the Exer column records their exercise level. 
#The allowed values in Smoke are "Heavy", "Regul" (regularly), "Occas" (occasionally) and "Never". 
#As for Exer, they are "Freq" (frequently), "Some" and "None".
#We can tally the students smoking habit against the exercise level with the table function in R. 
#The result is called the contingency table of the two variables.
library(MASS)       # load the MASS package 
tbl = table(survey$Smoke, survey$Exer) 
tbl                 # the contingency table 
#Test the hypothesis whether the students smoking habit is independent of their exercise level at .05 significance level.
#We apply the chisq.test function to the contingency table tbl, and found the p-value to be 0.4828.
chisq.test(tbl)
#as the p-value 0.4828 is greater than the .05 significance level, we do not reject the null hypothesis that the smoking habit is independent of the exercise level of the students.

#The warning message found in the solution above is due to the small cell values in the contingency table. To avoid such warning, we combine the second and third columns of tbl, and save it in a new table named ctbl. Then we apply the chisq.test function against ctbl instead.

ctbl = cbind(tbl[,"Freq"], tbl[,"None"] + tbl[,"Some"]) 
ctbl 
chisq.test(ctbl)


# Q2 ----------------------------------------------------------------------

#http://courses.statistics.com/software/R/Rchisq.htm

# q3 ----------------------------------------------------------------------

#http://www.statisticshowto.com/what-is-a-chi-square-statistic/
  
# Q3 ----------------------------------------------------------------------

#https://ww2.coastal.edu/kingw/statistics/R-tutorials/independ.html

row1 = c(91,90,51)                   # or col1 = c(91,150,109)
row2 = c(150,200,155)                # and col2 = c(90,200,198)
row3 = c(109,198,172)                # and col3 = c(51,155,172)
data.table = rbind(row1,row2,row3)   # and data.table = cbind(col1,col2,col3)
data.table
chisq.test(data.table)

#If the data are available in an electronic document, like this one, it can be entered into R using the scan() function.
ls()  # list all current objects
rm(list=ls())                             # Clean up a bit first!
the.data = scan()   # input from scan
#1:   91            90             51
#4:  150           200            155
#7:  109           198            172
#10: 
#  Read 9 items
the.data                                  # scan produces a vector
#[1]  91  90  51 150 200 155 109 198 172
data.matrix = matrix(the.data, byrow=T, nrow=3)
data.matrix                               # which we convert to a matrix
chisq.test(data.matrix)$statistic         # keeping the output brief

#X-squared  25.08597

dimnames(data.matrix) = list(Age=c("lt.45","45.to.59","ge.60"), Freq=c("Monthly","Occasionally","Never"))



# Q5 ----------------------------------------------------------------------

#http://stattrek.com/chi-square-test/independence.aspx
#Ho: Gender and voting preferences are independent. 
#Ha: Gender and voting preferences are not independent.
male=c(200,150,50)
female=c(250,300,50)
M = as.table(rbind(male,female))
dimnames(M) <- list(gender = c("M", "F"),
                    party = c("BJP","Congress", "Independent"))

Xcalc = chisq.test(M) # prints test summary
Xcalc
Xtable = qchisq(.95, df=(2-1)*(3-1)) ; Xtable
Xcalc$observed   # observed counts (same as M)
Xcalc$expected   # expected counts under the null
Xcalc$residuals  # Pearson residuals
Xcalc$stdres     # standardized residuals
# X-squared = 16.204 > Xtable= 5.991465, then Reject Ho


#http://web.pdx.edu/~newsomj/da1/ho_chisq.pdf
