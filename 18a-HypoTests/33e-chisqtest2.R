# Chi Square Test------------

#two categorical variables from a single population.
#Used to determine whether there is a significant association between the two variables.

#egs ------
#determine whether gender is related to voting preference.
# Smoking habits related to gender

# Hypothesis --------
#Ho: Variable A and Variable B are independent. 
#Ha: Variable A and Variable B are not independent.

# Interpret Values
#If the sample findings are unlikely, given the null hypothesis, 
#the researcher rejects the null hypothesis. Typically, this involves 
#comparing the P-value to the significance level, 
#and rejecting the null hypothesis when the P-value is less than the significance level.



#Test of Independence -----------
# When to use ------------
#1 Sampling method is simple random sampling.
#2 Variables under study are each categorical.
#3 Sample data are displayed in a contingency table, 
#   the expected frequency count for each cell of the table is at least 5.


# Link1 ------------
#https://ww2.coastal.edu/kingw/statistics/R-tutorials/independ.html
#http://stattrek.com/chi-square-test/independence.aspx?Tutorial=AP
#http://www.r-tutor.com/elementary-statistics/goodness-fit/chi-squared-test-independence

# Enter Data -----------
row1 = c(91,90,51)                   # or col1 = c(91,150,109)
row2 = c(150,200,155)                # and col2 = c(90,200,198)
row3 = c(109,198,172)                # and col3 = c(51,155,172)
data.table = rbind(row1,row2,row3)   # and data.table = cbind(col1,col2,col3)
data.table

chisq.test(data.table)




# Data From Data Table -----------
UCBAdmissions 
ftable(UCBAdmissions, row.vars=c("Admit"))
str(UCBAdmissions)
deptB = UCBAdmissions[,,2]           # all rows, all cols, but only of layer 2
deptB

chisq.test(deptB)
#Yate's correction for continuity is applied by default when a 2x2 table is entered into the chi square procedure.

chisq.test(deptB)$expected
chisq.test(deptB)$resid
chisq.test(deptB)$statistic



#https://ww2.coastal.edu/kingw/statistics/R-tutorials/independ.html
# Data From Data Frame ----------
# The data frame "survey" in the "MASS" package contains responses from 237 statistics
# students to a series of questions, some of which resulted in categorical answers. 
# For one item, the students were asked to fold their arms, and the recorded result was 
# which arm was on top: right, left, or neither. 
# Let's see how this variable relates to the sex of the student. 
#Ho: Folding Habits is not related to Gender (Independent)
#Ha : Folding Habits relate to Gender (Not Independent) Males do it this way, F do it this


data(survey, package="MASS")
str(survey)# Interpret the results
# p-value > 0.05 : Accept Ho : Sex and Folding are Independent (not related)

table(survey$Sex, survey$Fold)
(ct3 = chisq.test(x=survey$Sex, y=survey$Fold))           
ct3$observed; ct3$expected

rbind(ct3$observed, ct3$expected)
ct3$residuals


# Example Elections
#the.data = scan() # Manually entering data
(result = matrix(c(200,150,50,250,300,50), byrow=T, ncol=3))
dimnames(result) = list(gender=c('male','female'), party=c('bjp','cong','aap') )
result
#Ho : Gender and Party preference is independent
#Ha : Gender and Party Preference is related (not independent)
(ct4 = chisq.test(x=result))
ct4$observed; ct4$expected
ct4$statistic
ct4$p.value
qchisq(1-.05,df=(2-1)*(3-1))
#pvalue < 0.005 : Reject Ho : Gender -Party are related
#calc > table : Rejection Region

ct4$residuals
#Standardized residual = (observed count – expected count) / √expected count
