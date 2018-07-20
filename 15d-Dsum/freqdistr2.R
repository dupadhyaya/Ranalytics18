#Freq Distribution2

color= sample(c('Red','Blue','Green','Black'), size=100, prob=c(.3,.2,.1,.4), replace=T)
table(color)

cbind(table(color))
transform(table(color))

hist(color)  #error as values are not numeric

barplot(cbind(table(color)), beside=T)

#Continuous
#Continuous Data 
set.seed(1234)
marks = ceiling(runif(100,0,150))  # 0 to 150 marks range, 100 values 
range(marks)
h=hist(marks)
plot(h)
h$counts
h$mids
cbind(h$mids, h$counts) #Mid Value & count


# Divide range into step of 15 ie 10 levels
breaks = seq(0,150,by=15)
marks.cut = cut(marks, breaks, right=FALSE)
marks.table = table(marks.cut)
transform(marks.table)

#Cumulative Freq
marks.cumfreq = cumsum(marks.table)
plot(marks.cumfreq, type='b')

#Package
library(plyr)
count(color)
count(marks.cut)

