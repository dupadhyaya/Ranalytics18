#Meena IRR
#https://www.rdocumentation.org/packages/FinancialMath/versions/0.1.1/topics/IRR
library(FinancialMath)

#IRR(cf0,cf,times,plot=FALSE)

IRR(cf0=100,cf=c(1,1,30,40,50,1),times=c(1,1,3,4,5,6))
IRR(cf0=100,cf=c(1,1,30,40,50,1),times=c(1,1,3,4,5,6), plot=T)

#Case - DU
library(FinCal)
irr(cf=c(-5, 1.6, 2.4, 2.8))






#Case 1: Customer lift the chit in 4th Month : He paid 3X5000 + 37X7000 = 274000/- But Customer offered an yield of 203000/-
#Method1
cf1=c(rep(5000,3),rep(7000,37))
length(cf1)
times1=c(1:3,4:40)
length(times1)
cf01=203000
#IRR(cf0=203000,cf=c(rep(5000,3),rep(7000,37)), times=c(1:3,4:40))
IRR(cf0=cf01,cf=cf1, times=times1)

#Method2
cf1=c(5000, 7000)
length(cf1)
times1=c(3,37)
length(times1)
cf01=203000
IRR(cf0=cf01,cf=cf1, times=times1)

  
#Case 2: Customer lift the chit in the 40th Month : He paid 39X5000 + 1X7000 = 202000/- Customer offered an yield of 239000/-

#Method1
cf2=c(rep(5000,39),rep(7000,1))
length(cf2)
times2=c(1:39,40)
length(times2)
cf02=239000
IRR(cf0=cf02,cf=cf2, times=times2,plot=T)


#Method2
cf2=c(5000, 7000)
length(cf2)
times2=c(39,1)
length(times2)
cf02=239000
IRR(cf0=cf02,cf=cf2, times=times2)



?IRR
#https://cran.r-project.org/web/packages/FinCal/FinCal.pdf
#https://cran.r-project.org/web/packages/irr/irr.pdf
#https://stackoverflow.com/questions/11660187/any-r-package-available-to-calculate-irr-from-uneven-payments-on-specific-dates
#
#Meena2
library(financial)
?discount.rate
FinCal::discount.rate(n, pv, fv, pmt, type = 0)

?irr
FinCal::irr(cf=c(-5, 1.6, 2.4, 2.8))
?irr2
FinCal::irr2(cf=c(-5, 1.6, 2.4, 2.8))
FinCal::irr2(cf=c(-200, 50, 60, -70, 30, 20))

?IRR
FinancialMath::IRR(cf0=1,cf=c(1,2,1),times=c(1,3,4))
FinancialMath::IRR(cf0=100,cf=c(1,1,30,40,50,1),times=c(1,1,3,4,5,6))
FinancialMath::IRR(cf0=203000,cf=c(5000, 7000),times=c(3,37))


FinCal::irr2(cf=c(-203000, rep(5000,3), rep(7000,37))) #high processing time

#Case1:203000, 5000 x 3, 7000 x 37
s1= sum(rep(5000,3), rep(7000,37))
s1-203000
rep(5000,3)
IRR.Project1 <- IRR(-203000, c(5000,5000,5000,7000,7000,7000,7000,7000,7000,7000,7000,7000,7000,7000,7000), times=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15))
IRR.Project1
?IRR


#Case2: 239000, 5000 x 29, 7000 x 1
s2= sum(rep(5000,39), rep(7000,1))
s2-239000


#Case

IRR.Project1 <- IRR(-1000, c(1250, 10, 10, 20, 20), c(1:5))
IRR.Project2 <- IRR(-1000, c(-10, 0, 10, 20, 2000), c(1:5))