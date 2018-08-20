#Simple Linear Regression - Case Study
# Regression : Areas vs Sales
#Given data of area and sales, predict value for sales for specific areas eg : (1.5,2,3,4,5)
#manual way of doing regression see online URL

#Create/ Import Data-----
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

#Third method of importing data from csv
df3 = read.csv('./data/slr1.csv')
str(df3)

#Method4 for importing from CSV file with choose location
df4 = read.csv(file.choose())
str(df4)

# Use Vector Data or method used to import data
#make one of the DF active
df = df1
df
#simple stats
mean(df$X); mean(df$Y)
sum(df$X); sum(df$Y)
sd(df$X) ; var(df$Y)
cov(df$X,df$Y); cov(df$Y,df$X)
cor(df$X,df$Y) ; cor(df$Y,df$X)
#cor.test(df$X,df$Y)

#some plots to understand pattern
plot(df$X, df$Y)  #simple command to plot : Next with features
plot(y=df$Y, x=df$X,xlab='Area in sqft', ylab='Sales Amount', type='p', ylim=c(0, max(df$Y)), main='Plot of Area Vs Sales', xlim=c(0,max(df$X)), col='red',pch=10)

abline(lm(df$Y ~ df$X), lty=3, lwd=4, col='green') # with regression line
abline(v=c(3,5),h=c(6,10), col=c('red','blue')) # few straight lines at x & y axis

#Model
fit1 = lm(Y ~ X, data=df) # create Simple Linear Model Y wrt X
fit1
summary(fit1)


#few extras
names(fit1) # attributes(fit1)
system.time(lm(Y ~ X, data=df)) #time taken to compute linear regression
coef(fit1)  # Coefficients of Equation Y = mX + C
fitted(fit1) # predicted values for all X in orginal data
residuals(fit1) # diff between actual and predicted values - residuals
(R= df$Y - fitted(fit1))
#residuals should be less :Diff of Y actual - Y predicted
#abline(h=coef(fit1)[1])

summary(fit1)  # summary statistics of Linear Model(LM)
#understand the model values - R2, AdjR2, FStats, Residuals, Coeff p values - IMP STEP

names(fit1)  #output variables names of LM
names(summary(fit1))
#u can select them to see output

summary(fit1)$r.squared
coef(fit1)[2]  # slope or beta
fitted(fit1)
#combine the data with Ypredicted, errors
cbind(df, fitted(fit1), fitted(fit1)- df$Y, residuals(fit1))

#Mathematical Equation and predictions
(Y = 0.9645 + 1.6699 * 4)  # Predict Y for X=4
#predict for area = 4
#using equation
(Y = coef(fit1)[1] + coef(fit1)[2] * 4)
#using model
new1 = data.frame(X=c(4))
predict(fit1, newdata= new1)

#prediction can only be interpolated not extrapolated
range(df$X)  #min to max value of X: area

#select new data given in the case
(new1 = data.frame(X=c(1.5,2,3,4,5)))
#sample data for X for prediction, should be between the range of X values
predict(fit1, newdata= new1) # Predict Function for 4 values of X
#columnbind with input and predicted values
cbind(new1, predictedY = predict(fit1, newdata= new1) )

library(forecast)
accuracy(fit1)
#RMSE is generally used and should be least when selecting models

anova(fit1)
summary(fit1)$r.squared  # R2 from Model
summary(fit1)$sigma  #Residual Std Error SD along the LM Line

#---------------------------------------#Assumptions--------
#Assumption : Graphical Analysis : IMP STEP
plot(fit1)
par(mfrow=c(2,2))
plot(fit1)
par(mfrow=c(1,1))

plot(fit1, which=1)

# Linearity plot of residuals & X # No pattern for assumption that there is linearity betw X & Y

abline(h=0)
plot(residuals(fit1))

#Auto Collinearity : relation between successive values of Y
car::durbinWatsonTest(fit1)
#pvalue > 0 : Do not reject Ho that there is no correlation

#Normality of residuals
plot(fit1, which=2)
#points to be around the straight line

#Equal Variance : 4th Assumption : homoscedasticity
plot(fit1, which=1)
#no funnel shape to show hetero-cedasticity

#Outlier Analysis
plot(fit1, which=4)
#no value of cooks distance > .5 : no data to be removed
#outlier values can affect the model

#see all diagnostic plots together
par(mfrow=c(2,2))
#multiple frames per row : rowwise filling, 2 rows, 2 columns
plot(fit1)
par(mfrow=c(1,1))

#SUMMARY ------
summary(fit1)$r.squared  # 90% variation in Y explained by X
summary(fit1)
#F Stats pvalue < 0.05: Model exists : At least 1 indep variable has strong relationship with Dependent variable (Y)
#pvalue of Coef (X) < 0.05 : Significant X


#End of Simple Linear Regression
#Do different SLR on different data sets
#Learn what to do if there are violations of assumptions




df # dataset being used for LM
fit= lm(Y ~ X, data=df) #model creation
summary(fit)  #summary of linear model
plot(fit)  #diagnostic plots
predict(fit, newdata=data.frame(X=mean(df$X)))
#Multiple R2 explains the variation, model fitness

