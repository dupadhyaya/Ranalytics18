# using R Commander
library(Rcmdr)

# Entering Data
attach(mtcars)
load('./data/du3.Rdata')
with(df2, Hist(excel, groups=course, 
      scale="frequency", breaks="Sturges", col="darkgray"))

with(df2, Hist(age, groups=course, 
               scale="frequency", breaks="Sturges", col="darkgray"))
xtabs(~gender+hostel+city, data=df2)

t.test(student$age, alternative='less', mu=30, 
      conf.level=.95)

summary(women[,'height'])
boxplot(age ~ gender, data=student)
Rcmdr> Boxplot(age ~ gender, data = student)
