# Regression : Areas vs Sales

#Method1 : creating data from Vectors
#X -is area sqft Y-sales in 1000s units; Find relationship betn X & Y
X = c(1.7,1.6,2.8,5.6,1.3,2.2, 1.3,1.1,3.2,1.5,5.2,4.6,5.8,3 )
Y = c(3.7,3.9,6.7,9.5,3.4,5.6,3.7,2.7,5.5,2.9,10.7,7.6,11.8,4.1 )
df1 = data.frame(X,Y)
head(df1)

#2nd method of importing data
#import from ggsheet  #pickup the correct url
library(gsheet)
area1 = "https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=2023826519"
df2 = as.data.frame(gsheet::gsheet2tbl(area1))
str(df2)
head(df2)

#Third method of importing data
df3 = read.csv('./data/slr1.csv')
str(df3)

#Method4 for importing from CSV file
df4 = read.csv(file.choose())
str(df4)

# Use Vector Data or method used to import data
#make one of the DF active
df = df1

mean(df$X); mean(df$Y)
sum(df$X); sum(df$Y)
sd(df$X) ; var(df$Y)
cov(df$X,df$Y); cov(df$Y,df$X)
cor(df$X,df$Y) ; cor(df$Y,df$X)
#cor.test(df$X,df$Y)

plot(df$X, df$Y)  #simple command to plot : Next with features
plot(y=df$Y, x=df$X,xlab='Area in sqft', ylab='Sales Amount', type='p', ylim=c(0, max(df$Y)), main='Plot of Area Vs Sales', xlim=c(0,max(df$X)), col='red',pch=10)

abline(lm(df$Y ~ df$X), lty=3, lwd=4, col='green') # with regression line
abline(v=c(3,5),h=c(6,10), col=c('red','blue')) # few straight lines at x & y axis

#Model
fit1 = lm(Y ~ X, data=df) # create Simple Linear Model Y wrt X
fit1
summary(fit1)

fitted(fit1) # predicted values for all X in orginal data
residuals(fit1)

names(fit1) # attributes(fit1)
system.time(lm(Y ~ X, data=df))
coef(fit1)  # Coefficients of Equation Y = mX + C
residuals(fit1)  # Diff of Y actual - Y predicted
#abline(h=coef(fit1)[1])

summary(fit1)  # summary statistics of Linear Model(LM)
#understand the model values - R2, AdjR2, FStats, Residuals, Coeff p values - IMP STEP

names(fit1)  #output variables names of LM
coef(fit1)
#terms(fit1)
coef(fit1)[2]  # slope or beta
fitted(fit1)
#combine the data with Ypredicted, errors
cbind(df, fitted(fit1), fitted(fit1)- df$Y, residuals(fit1))

# Predictions----
(Y = 0.9645 + 1.6699 * 4)  # Predict Y for X=4
(Y = coef(fit1)[1] + coef(fit1)[2] * 4)  # for X=4 using values from output of LM 
coef(fit1)[2]
new1 = data.frame(X=c(4))
predict(fit1, newdata= new1)


fitted(fit1)
cbind(df, fitted(fit1))  # combine data with predicted values
range(df$X)  #min to max value of X: area


new1 = data.frame(X=c(1.5,2,3,4,5)) #sample data for X for prediction, should be between the range of X values
new1 #prediction data should be inform of Data Frame

predict(fit1, newdata= new1) # Predict Function for 4 values of X


#fitted(fit1) is equal to predict function using original X values
cbind(new1, predictedY = predict(fit1, newdata= new1) )

plot(fit1)

library(forecast)
accuracy(fit1)

#Variation  # Errors in the model 
#Calculating R2 manually
(SSE = sum((df1$Y - df1$predict)^2))
(SSR = sum((df1$predict - mean(df1$Y))^2))
#11.2 + 105.74
(SST = sum((df1$Y - mean(df1$Y))^2))
anova(fit1)
qt(0.95+.025, 14-2)

anova(fit1)
(r2 = SSR/SST)  # R2 from Calculation ANOVA
summary(fit1)$r.squared  # R2 from Model

summary(fit1)
summary(fit1)$sigma  #Residual Std Error SD along the LM Line


#Assumption : Graphical Analysis : IMP STEP
plot(fit1, which=1)
plot(fit1)

# Linearity plot of residuals & X # No pattern for assumption that there is linearity betw X & Y

abline(h=0)
plot(residuals(fit1))

#Auto Collinearity : relation between successive values of Y
car::durbinWatsonTest(fit1)
#pvalue > 0 : Do not reject Ho that there is no correlation


#Normality of residuals
hist(residuals(fit1)) #distribution of Residuals

hist(residuals(fit1), freq=F)
lines(density(residuals(fit1)))

#histogram values to show how hist rectangle are created
(h=hist(residuals(fit1)))
names(h)
cbind(h$breaks, h$counts)

#Normality Plot to check assumptions of LM
qqnorm(residuals(fit1))
qqline(residuals(fit1))

#Normality Plot can also be used with Std Values also
residuals(fit1)
rstandard(fit1)
sales.stdres = rstandard(fit1)
qqnorm(sales.stdres, ylab="Standardized Residuals", xlab="Normal Scores", main="Checking normality of Residuals") 
qqline(sales.stdres)

stem(residuals(fit1))

#Equal Variance : 4th Assumption : homoscedasticity
plot(y=residuals(fit1), x=df$X)
abline(h=0)  #Variance across all x values is almost constant


#Outlier Analysis
df
df[14,]
df$Y
residuals(fit1)
boxplot( df$Y)
boxplot( fitted(fit1))

boxplot( df$Y, fitted(fit1), residuals(fit1), names=c('Y','predictY', 'Residuals'))
abline(h=c(4.1, 5.97, -1.87))

boxplot(residuals(fit1), names=c('Residuals'))
identify(rep(1, length(residuals(fit1))), residuals(fit1), labels = seq_along(residuals(fit1)))

car::outlierTest(fit1)
df[14,]

car::outlierTest(lm(Y ~ X, data=df[-c(14,12),]))

fit1
