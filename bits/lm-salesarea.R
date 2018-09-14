#Simple Linear - Sales vs Area

#import from ggsheet  #pickup the correct url
library(gsheet)
area = "https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=2023826519"
df = as.data.frame(gsheet::gsheet2tbl(area1))
str(df)
head(df)

#some stats
mean(df$X); mean(df$Y)
sd(df$X) ; var(df$Y)
cor(df$X,df$Y) 
#cor.test(df$X,df$Y)

plot(df$X, df$Y)  #simple command to plot : Next with features
abline(lm(df$Y ~ df$X), lty=3, lwd=4, col='green') # with regression line

#Model
fit1 = lm(Y ~ X, data=df) # create Simple Linear Model Y wrt X

names(fit1)
system.time(lm(Y ~ X, data=df)) #time taken for LM
coef(fit1)  # Coefficients of Equation Y = mX + C
residuals(fit1)  # Diff of Y actual - Y predicted

summary(fit1)  # summary statistics of Linear Model(LM)
#understand the model values - R2, AdjR2, FStats, Residuals, Coeff p values - IMP STEP

#combine the data with Ypredicted, errors
cbind(df, fitted(fit1), fitted(fit1)- df$Y, residuals(fit1))

# Predictions----
(Y = 0.9645 + 1.6699 * 4)  # Predict Y for X=4

#Predict for X=4
new1 = data.frame(X=c(4))
predict(fit1, newdata= new1)

#Predict for more than 1 input
new1 = data.frame(X=c(1.5,2,3,4,5)) #sample data for X for prediction, should be between the range of X values
new1 #prediction data should be in form of Data Frame

predict(fit1, newdata= new1) # Predict Function for 4 values of X

#fitted(fit1) is equal to predict function using original X values
cbind(new1, predictedY = predict(fit1, newdata= new1) )

#Accuracy of Model
library(forecast)
accuracy(fit1)  #RMSE should be least


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
#identify(rep(1, length(residuals(fit1))), residuals(fit1), labels = seq_along(residuals(fit1)))

car::outlierTest(fit1)
df[14,]

car::outlierTest(lm(Y ~ X, data=df[-c(14,12),]))

fit1
