# Distributions

# t-test
?t.test
attach(CO2)
t.test(CO2$uptake, mu=30)
tstats = t.test(uptake, mu=30)
tstats$statistic

CO2$uptake
(m=mean(CO2$uptake))
(s= sd(CO2$uptake))
(N = length(CO2$uptake))
mu=30
(tcalc = (m - mu)/(s * sqrt(N)))

?qt
qt(p=.975, df=N-1)


a = c(65, 78, 88, 55, 48, 95, 66, 57, 79, 81)

t.test (a, mu=75)
