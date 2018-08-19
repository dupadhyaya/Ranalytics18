# t test - paired

before = c(50,60,55,70,60)
after = c(55,64,61,74,58)
t.test(x=before, y=after, paired=T)
#Ho: Diff = 0 , Ha: Diff != 0
# Manual Calculation
(d = before-after)
n = length(before)
(dmean = mean(d))
(tcalc = (dmean - 0)/(sd(d)/sqrt(n-1)))
qt(1-0.05/2,df=length(before)-1)
qt(0.05/2,df=length(before)-1)
#tcalc lies between qt values : Accept Ho : True diff = 0
t.test(x=before, y=after, paired=T,alternative='two.sided', mu=0)

# Ho: d = 3
t.test(x=before, y=after, paired=T,alternative='two.sided', mu=3)



# Example 2 : Training
before= c(95,89,76,92,91,53, 67, 88, 75, 85, 90, 85, 87, 85, 85, 68, 81, 84, 71, 46, 75, 80)
after = c(90,85,73,90,90,53,68,90,78,89,95,83,83,83,82,65,79,83,60,47,77,83)
# Did training help in scores
# Matched Pair : Same People - before and after training scores
t.test(x=before, y=after, paired=T,mu=0,alternative='two.sided')
# Accept Ho: No significant changes
#Manually
d = before - after
n = length(before)
dmean = mean(d)
(d.sd = sqrt(sum((d - dmean)^2)/(n-1)))
(se = d.sd/sqrt(n))
mu=0
(tcalc = (mean(d) - mu)/ se)
t.test(before, after, paired=T, mu=0, alternative='two.sided')
qt(1-0.05/2,df=n-1); qt(0.05/2,df=n-1)
#tcalc lies between two extremes (not in rejection) : Accept Ho
# p value > 0.05;  p-value (0.205) is greater than the signif level (0.05), we cannot reject Ho.
# conf Interval : mean of diff lies betw conf intervals

meanx= 70
sdx = 10
nx=10
x1 = rnorm(n=n,mean=meanx, sd=sdx)
x1
mean(x1)
sd(x1)
x2 = rnorm(10)
x2 = sdx*(x2-mean(x2)) /sd(x2)+70
mean(x2)
sd(x2)
help(distributions)
