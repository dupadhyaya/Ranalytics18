# Chi Square Test 
# About Chi Square Test
# https://stat.ethz.ch/R-manual/R-devel/library/stats/html/chisq.test.html

# Goodness of Fit : Discrepancy between observed & Expected ####
# Q1 @ 7.65 ---------------------------------------------------------------

#The following table gives the number of aircraft accidents that 
#occured during the various days of the week. Find whether
#accidents are uniformly distributed over the week. 
#Given value of chi2a at 5% sign for 6 df = 12.59
chi2a = 12.59  # Given using the table
?chisq.test
# days starting from Sun to Sat
x = accidents = c(14,16,8,12,11,9,14)
x
qchisq(.95, df=length(x)-1) # Using R here alpha/2 is not done
paste('Samples -', length(x) ,'Sum -', sum(x),'Mean ', mean(x))
#chi2 = sum((Oi - Ei)^2/Ei)
Ei=mean(x) ; Ei # Expected value is mean of the week
Oi = x # Observed values
chi2 = sum((Oi - Ei)^2/Ei)
chi2
if(abs(chi2) > chi2a) paste("Ho is rejected" ,abs(chi2) ,'>',chi2a) else paste("Failed to Reject Ho : Accept Ho ::" ,abs(chi2) ,'<',chi2a )
# There is not difference in O & E values of accidents with alpha=5%

chisq.test(x)
# df=6, X2= 4 which < given Chi2, p value > .5 : Accept Ho


# Q2 : @7.68 --------------------------------------------------------------
# The theory predicts that the proportion of beans in the four groups A, B, C, D
#should be 11:4:3:2. In an experiment it was observed that the number of fours groups
# A,B,C,D are 1070,430,330,170. Does the result of the experiment support theory
# chi2 for 3 df at 5% level = 7.815
Oi = c(1070,430,330,170) # Observed Values
ei = c(11,4,3,2) # Expected Proportion
totalei = sum(ei) # for relative frequencies
totalOi = sum(Oi); total # total Values  ; 
Ei= ei/totalei * total ; Ei # Expected Values based on ratios 
Oi ; Ei
chi2 = sum((Oi - Ei)^2/Ei); chi2
chi2a = 7.815 # Given for 3 df at 5% level = 7.815
qchisq(.95, df=length(Oi)-1) # Using R here alpha/2 is not done

if(abs(chi2) > chi2a) paste("Ho is rejected" ,abs(chi2) ,'>',chi2a) else paste("Failed to Reject Ho : Accept Ho ::" ,abs(chi2) ,'<',chi2a )
# There is not difference in O & E values  with alpha=5%
# Experiment does not support theory 

chisq.test(Ei,Oi)
# df=9, chi2= 10 which is > given table Chi2(7.8- Given), p value < .5 : Reject Ho
