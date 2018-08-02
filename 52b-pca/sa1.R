#Survival Analysis
#Data Set - Cancer
library(survival)
data(cancer)
head(cancer)

kmsurvival= survfit(Surv(time, status) ~ 1, data=cancer)
kmsurvival
summary(kmsurvival)
?survfit

plot(kmsurvival, xlab='Time',
     ylab='Survival Probability')

kmsurvival1 = survfit(Surv(time, status) ~ sex, data=cancer)
kmsurvival1
summary(kmsurvival1)
plot(kmsurvival1, xlab='Time', ylab='Survival Probability', 
     col=c('black', 'red'), lty=1:2)

surv.diff = survdiff(Surv(time, status) ~ sex, data=cancer)
surv.diff


nasurvival = survfit(coxph(Surv(time, status) ~ 1,  data=cancer), type='aalen')
nasurvival
summary(nasurvival)

plot(nasurvival, xlab='Time', ylab='Survival Probability')

x = cbind(cancer$age, cancer$sex, cancer$pat.karno)
x
coxph = coxph(Surv(time, status) ~ x, data=cancer, method='breslow')
coxph

summary(coxph)


exponential = survreg(Surv( time, status) ~ x, data=cancer, dist='exponential')
exponential
summary(exponential)

weibull = survreg(Surv(time, status) ~ x, data=cancer, dist='weibull')
weibull
summary(weibull)

loglogistic = survreg(Surv(time, status) ~ x, data=cancer, dist='loglogistic')
loglogistic
summary(loglogistic)

library(rpart)
fit= rpart(Surv(time, status) ~ age + sex + ph.ecog + ph.karno 
           + meal.cal + wt.loss, data=cancer)
fit
plot(fit, uniform=T, branch=.4, compress=T)
text(fit, use.n=T)

library(randomForestSRC)
library(pec)
pbc.surv = survfit(Surv(time, status) ~ sex)
pbc.surv
plot(pbc.surv, xlab='time', ylab='Survival', col=c('black','red')
     ,lty=1:2, main='Kaplan-Meir Survival vs Sex')
legend(100, .6, c('Rx1', 'Rx2'), lty=1:2, col=c('black','red'))
