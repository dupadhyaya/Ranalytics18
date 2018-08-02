#Log Regression
#
library(AER)
data(Affairs)
data(Affairs, package='AER')
mydata=Affairs
summary(mydata)
dim(mydata)
x=mydata$affairs
table(x)
round(prop.table(table(x)),3)
round(prop.table(table(x))*100,1)
x=mydata$gender
round(prop.table(table(x))*100)

x=mydata$children
round(prop.table(table(x))*100)

median(mydata$age)

# Convert No of Affairs - Yes/ No
mydata$ynaffair[mydata$affairs > 0 ] = 1
mydata$ynaffair[mydata$affairs == 0 ] = 0
mydata$ynaffair = factor(mydata$ynaffair,
          levels=c(0,1), labels=c('No','Yes'))
table(mydata$ynaffair)

# ready for Log Regr
fit.full = glm(ynaffair ~ gender + age + yearsmarried + children + religiousness + education + occupation + rating, data=mydata, family=binomial())
summary(fit.full)

#Modified Model
fit.reduced = glm(ynaffair ~ age + yearsmarried + religiousness
               + rating, data=mydata, family=binomial())
summary(fit.reduced)

#Compare
anova(fit.reduced, fit.full, test='Chisq')


coef(fit.reduced)
exp(coef(fit.reduced))

exp(confint(fit.reduced))

1.106^10

testdata = data.frame(rating=c(1,2,3,4,5), age=mean(mydata$age),
              yearsmarried=mean(mydata$yearsmarried), 
              religiousness = mean(mydata$religiousness))
testdata

testdata$predict = predict(fit.reduced, newdata=testdata, type='response')
testdata

#Age varies
testdata = data.frame(rating=mean(mydata$rating), age=seq(17,57,10),
                      yearsmarried=mean(mydata$yearsmarried), 
                      religiousness = mean(mydata$religiousness))
testdata

testdata$predict = predict(fit.reduced, newdata=testdata, type='response')
testdata

# Overdispersion

deviance(fit.reduced)/ df.residual(fit.reduced)

fit.b = glm(ynaffair ~ age + yearsmarried + religiousness
                  + rating, data=mydata, family=binomial())
fit.qb= glm(ynaffair ~ age + yearsmarried + religiousness
                  + rating, data=mydata, family=quasibinomial())
pchisq(summary(fit.qb)$dispersion * fit.b$df.residual, fit.b$df.residual, lower=F)

