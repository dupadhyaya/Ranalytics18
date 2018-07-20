
#H0: no significant difference
#H1: significant difference




t.test(A,B)
#reject null hypothesis
?t.test
t.test(A,B, alternative='two.sided', conf.level = 0.95)
qt(df=9,p=.05)

t.test(A,B, alternative='less', conf.level = 0.95)
qt(df=9,p=.05)
t.test(A,B, alternative='greater', conf.level = 0.95)
qt(df=9,p=.05)

(t= (500 - 560)/ sqrt(100^2/10 + 121^2/10))
n1=10 ; n2=10; s1=100; s2=121
(PV = ((n2-1)*s1 + (n2-1)*s2))/(n1 + n2 -2) 
(PS = sqrt(PV))
(t= (500 - 560)/ (Sv * sqrt(1/n1 + 1/n2)))

df= n1+n2-1
qt(df=n1+n2-1, p=0.975)
