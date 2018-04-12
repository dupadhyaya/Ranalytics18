#Meena2
#https://www.free-online-calculator-use.com/xirr-calculator.html

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
FinCal::irr2(cf=c(-100, rep(5,3), rep(7,37))) #this worked #0.059908


#Case1:203000, 5000 x 3, 7000 x 37
s1= sum(rep(5000,3), rep(7000,37))
s1-203000
rep(5000,3)
(IRR.Project1 <- IRR(-1000, c(1250, 10, 10, 20, 20), c(1:5)))
(IRR.Project1 <- IRR(-203000, c(rep(5000,3), rep(7000,37)), c(1:40)))


#Case2: 239000, 5000 x 29, 7000 x 1
s2= sum(rep(5000,39), rep(7000,1))
s2-239000


#Case

IRR.Project1 <- IRR(-1000, c(1250, 10, 10, 20, 20), c(1:5))
IRR.Project2 <- IRR(-1000, c(-10, 0, 10, 20, 2000), c(1:5))