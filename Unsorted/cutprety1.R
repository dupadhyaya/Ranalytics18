# Equally spaced values - pretty

set.seed(1234)
marks = ceiling(rnorm(100,60,15))

?pretty
pretty(marks,10)

marks2 = ceiling(runif(100,20,90))
pretty(marks2,4) #4+1 Interval
pretty(marks2,5) #5+1 Interval

marks2 = ceiling(runif(100,25,90))
pretty4 = pretty(marks2,4) #4+1 Interval
pretty(marks2,5) #5+1 Interval

cut4 = cut(marks2, pretty4 )
table(cut4)
cbind(table(cut4))

cut4L = cut(marks2, pretty4, labels=c("L2040", "L4060","L6080", "L80100") )
table(cut4L)
cbind(table(cut4L))
pie(cbind(table(cut4L)), labels=c("L2040", "L4060","L6080", "L80100"))
barplot(cbind(table(cut4L)), names.arg = c("L2040", "L4060","L6080", "L80100"), beside = T)
