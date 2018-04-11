#Meena IRR
#https://www.rdocumentation.org/packages/FinancialMath/versions/0.1.1/topics/IRR
library(FinancialMath)

#IRR(cf0,cf,times,plot=FALSE)

IRR(cf0=100,cf=c(1,1,30,40,50,1),times=c(1,1,3,4,5,6))
IRR(cf0=100,cf=c(1,1,30,40,50,1),times=c(1,1,3,4,5,6), plot=T)


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