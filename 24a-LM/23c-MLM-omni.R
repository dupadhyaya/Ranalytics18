#Multiple Linear Regression 
#Linear Modeling : DV vs more than 1 IVs
#sales Qty vs price & promotion
#Prerquistes - Lin Modeling, lm, output

#Omni Store
#creating data using Vector
sqty= c(4141,3842,3056,3519,4226, 4630,3507,3754, 5000,5120,4011, 5015,1916,675, 3636,3224,2295, 2730,2618,4421, 4113,3746, 3532, 3825,1096, 761,2088,820,2114, 1882,2159,1602,3354,2927)
price = c(59,59,59,59,59,59,59,59,59,59,59,59,79,79,79,79,79,79,79,79,79, 79,79,79,99,99, 99,99,99,99,99,99,99,99)
promotion= c(200,200,200,200,400,400,400,400, 600,600,600,600,200,200,200,200, 400,400,400,400,600,600,600,600, 200,200,200,200,400,400,400,400,600,600)
sales1 = data.frame(sqty, price, promotion)
head(sales1)
str(sales1)
# find change in Sales Qty for 1 unit change in price and promotion

#2nd Method : CSV file : file not in project folder
sales2 = read.csv(file.choose())

#3rd Method : gsheet library
library(gsheet)
url = "https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=1595306231"
sales3 = as.data.frame(gsheet::gsheet2tbl(url))
str(sales3)

#4th Method : CSV file : file in project folder
sales4 = read.csv('./data/salesqty.csv')
str(sales4)

sapply(list(sales1,sales2,sales3, sales4), dim)
sapply(list(sales1,sales2,sales3, sales4), names)

#Make one of data frames active
sales = sales1
head(sales)

?lm  #see help of LM
#Simple Linear Model would look like this
slr1 = lm(formula = sqty ~ price, data=sales) # sales depend on price of item
summary(slr1)

slr2 = lm(formula = sqty ~ promotion, data=sales) # sales depend on promotion exp
summary(slr2)
AIC(slr1, slr2)  # slr1 better with 1 IV


#MLR  Create Multiple Linear Regression
# we want to see how Sales Qty depend on Price and Promotion Values
mlrmodel1 = lm(sqty ~ price + promotion, sales)

#how to give parameter values in different sequence, use arguments names if in different order
mlrmodel1a = lm( data=sales, formula = sqty ~ price + promotion)


range(sales$sqty)  # range of sales qty
summary(mlrmodel1)  # summary statistics IMP STEP
#understand values : R2, AdjR2, Fstats pvalue, Coeff, ***, Residuals

coef(mlrmodel1) #coefficients b1, b2
#anova(mlrmodel1) #seeing from anova model
attributes(mlrmodel1)
head(sales)

#coplot(sqty ~ price | promotion, data=sales)


#Predicted Values----
dim(sales)
fitted(mlrmodel1)  #predicted values for various input combinations of IV
cbind(sales, fitted(mlrmodel1), residuals(mlrmodel1))
summary(mlrmodel1)
coef(mlrmodel1)
5837 + 59 * -53 + 200 * 3.651
names(omni)
range(sales$price); range(sales$promotion)
#create a dataframe of new sample values
(ndata1 = data.frame(price=c(69,98), promotion=c(500,559)))
predict(mlrmodel1, newdata=ndata1)
cbind(ndata1, Predict=predict(mlrmodel1, newdata=ndata1, predict='response'))



#R2 and Adjs R2
names(mlrmodel1)
summary(mlrmodel1)
summary(mlrmodel1)$r.squared

#Manual Calculation of Adjs R2
(r2 = summary(mlrmodel1)$r.squared)
k = 2 # no of IVs
(n = nrow(sales)) # sample size
(adjr2 = 1 - ( (1 - r2) * ((n - 1)/ (n - k - 1))))


# Fstatistics
summary(mlrmodel1)$fstatistic[1]  # from output of model

(df1 = k) ;  (df2 = n-k-1)  
qf(.95, df1, df2)  # from table wrt df1 & df2
#Model Fstats > table(Fstat) 

# Pvalue of Model
fstat = summary(mlrmodel1)$fstatistic 
pf(fstat[1], fstat[2], fstat[3], lower.tail=FALSE) 
# this is  < 0.05 : Significant
# 

#Plots of the Model
plot(mlrmodel1,1)  # no pattern, equal variance
plot(mlrmodel1,2)  # Residues are normally distributed
plot(mlrmodel1,3)
plot(mlrmodel1,4)  # tells outliers which affect model
#most significant is row 14

# Confidence Intervals


#Fitted values : Predicting on IVs using model
fitted(mlrmodel1)
residuals(mlrmodel1) 
mlrmodel1$residuals
cbind(sales$sqty, fitted(mlrmodel1), sales$sqt - fitted(mlrmodel1), residuals(mlrmodel1))

#sqrt(sum((residuals(mlrmodel1)^2)))
names(mlrmodel1)
summary(mlrmodel1)




#Diagnostics Test for Checking Assumptions 
#Should be Linear relationship between Residuals Vs Ypi, X1i, X2i
cbind(fitted(mlrmodel1), residuals(mlrmodel1))
plot(cbind(fitted(mlrmodel1), residuals(mlrmodel1)))
#not quadratic
plot(cbind(sales$price, residuals(mlrmodel1)))
plot(cbind(sales$promotion, residuals(mlrmodel1)))
#May indicate quadratic term of IVs


#Train and Test Data
#since this data is small full data is used for train and test
#otherwise train = 70% of data

# RMSE
library(Metrics)
mlrmodel1
rmse(sales$sqty, fitted(mlrmodel1))

slr1
rmse(sales$sqty, fitted(slr1))
slr2
rmse(sales$sqty, fitted(slr2))

AIC(mlrmodel1, slr1, slr2)
#Which is best prediction model - with price and promotion

# Extra: Predict for other ranges
head(sales) ; names(sales)
mlr2 = lm(sqty ~ price + promotion, data= sales)
summary(mlr2)
new1=data.frame(price=60:70, promotion=400)
predict(mlr2, newdata = new1)
#summary of IV values and predicted values
cbind(new1,predict2 = predict(mlr2, newdata = new1) )


