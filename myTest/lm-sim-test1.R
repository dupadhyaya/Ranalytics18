#LM Simulation

library(car)
library(PerformanceAnalytics)
library(corrgram)
library(corrplot)

#Data
set.seed(1234); x1 <- rnorm(100, 70, 10) + rnorm(100)
set.seed(1234); x2 <- runif(100, 60, 90)
set.seed(1234); x3 <- .75 * x1 + rnorm(10,7,2)
set.seed(1234); x4 = factor(sample(c('M','F'), size=100, replace=T, prob=c(.7,.3)))
set.seed(1234); x5 <- runif(100, 30,50) - rnorm(20,5,2)

set.seed(1234); error <- rnorm(100,15,3)
alias(fit)
y = 5 + 1.2 * x1 + 0.005 * x2 -  x3 - .6 * x5  + error
df = data.frame(y, x1, x2, x3, x4, x5)
head(df)
str(df)

#LM
fit = lm(y ~ x1 + x2 + x3 + x4 + x5, data= df)
alias(fit)  #any built in correlation
x6 = .1*x1
alias(lm(y ~ x1 + x2 + x6)) #x6 related to x1

attributes(fit)
attributes(summary(fit))
summary(fit)
summary(fit)$r.squared
summary(fit)$adj.r.squared
summary(fit)$sigma # SEE

#Model worthiness
anova(fit)

#Interpret
names(fit)
fit$residuals   #resid(fit)
fitted(fit)  # predict(fit, df)

#assumptions
#A1:Linearity IV-DV----
car::crPlots(lm(formula, data=df))
corrgram::corrgram(df)
corfit = cor(df[,-5])
corrplot::corrplot(cor(df[,-5]), method="pie")
corrplot::corrplot(cor(df[,-5]), method="number")
PerformanceAnalytics::chart.Correlation(df[,-5], histogram=TRUE, pch=19)

#A : Normality of Residues---
car::qqPlot(fit)

#A2:Autocollinearity
car::durbinWatsonTest(fit)
#if pvalues < 0.05, autocorr exists

#A4:Homoscedascity of Residuals
car::ncvTest(fit)
plot(fit, which=1)


#MultiCollinearity----
car::vif(fit) # variance inflation factors 
sqrt(vif(fit)) > 2 # problem?
#remove variable one by one start from highest vif value


# Assessing Outliers
car::outlierTest(fit) # Bonferonni p-value for most extreme obs
car::qqPlot(fit, main="QQ Plot") #qq plot for studentized resid car::leveragePlots(fit) # leverage plots

#Influencing Values
plot(fit,which=4)
car::influencePlot(fit)
avPlots(fit)



#Model2
df
summary(fit)
fit2 = lm(y ~ x1 + x3 + x5, data= df)
summary(fit2)

#Model Compare
anova(fit2,fit)  #do not reject Ho ie. Model1 is better
AIC(fit2, fit) # whichever lower AIC is better

