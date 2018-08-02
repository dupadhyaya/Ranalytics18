# Log Regression - Poission
#
data(breslow.dat, package='robust')
names(breslow.dat)
mydata = breslow.dat
summary(mydata)
summary(mydata[c(6,7,8,10)])

opar = par(no.readonly = TRUE)
par(mfrow=c(1,2))
attach(mydata)
hist(sumY, breaks=20, xlab='Seizure Count', main='Distribution of Seizures')
boxplot(sumY  ~ Trt, xlab='Treatment', main='Group Comparisons')
par(opar)


fit = glm(sumY ~ Base + Age + Trt, data=mydata, family=poisson())
summary(fit)


coef(fit)
exp(coef(fit))

deviance(fit)/ df.residual(fit)
qcc::qcc.overdispersion.test(   mydata$sumY, type='poisson')

fit.od = glm(sumY ~ Base +
               Age + Trt, data = mydata,
             family = quasipoisson() )
summary(fit)
