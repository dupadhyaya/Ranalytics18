attach(mtcars)
plot(wt, mpg)
abline(lm(mpg~wt))
title("Regression of MPG on Weight")
detach(mtcars)

dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)
plot(dose, drugA, type="l")
plot(dose, drugA, type="b")

par(no.readonly = T)
opar <- par(no.readonly=TRUE)
plot(dose, drugA, type="b")
par(lty=2, pch=17)
plot(dose, drugA, type="b")
plot(dose, drugB, type="b")
par(opar)
plot(dose, drugA, type="b")
plot(dose, drugA, type="b",fg='red', col='purple', col.axis='green')

library(RColorBrewer)
n <- 7
mycolors <- brewer.pal(n, "Set1")
barplot(rep(1,n), col=mycolors)
barplot(rep(1,n), col=1:7)

n <- 10
mycolors <- rainbow(n)
pie(rep(1, n), labels=mycolors, col=mycolors)
mygrays <- gray(0:n/n)
pie(rep(1, n), labels=mygrays, col=mygrays)
