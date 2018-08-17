#Multiple Linear Regression 
#Linear Modeling : DV vs more than 1 IVs
#sales Qty vs price & promotion

#Omni Store
#creating data using Vector
sales= c(4141,3842,3056,3519,4226, 4630,3507,3754, 5000,5120,4011, 5015,1916,675, 3636,3224,2295, 2730,2618,4421, 4113,3746, 3532, 3825,1096, 761,2088,820,2114, 1882,2159,1602,3354,2927)
price = c(59,59,59,59,59,59,59,59,59,59,59,59, 79,79,79,79,79,79,79,79,79, 79,79,79,99,99, 99,99,99,99,99,99,99,99)
promotion= c(200,200,200,200,400,400,400,400, 600,600,600,600,200,200,200,200, 400,400,400,400,600,600,600,600, 200,200,200,200,400,400,400,400,600,600)
omni1 = data.frame(sales, price, promotion)
head(omni1)
str(omni1)

#2nd Method : CSV file
omni2 = read.csv(file.choose())

#3rd Method : gsheet 
library(gsheet)
url = "https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=1595306231"
omni3 = as.data.frame(gsheet::gsheet2tbl(url))

#Make one of data frames active
omni = omni1
head(omni)

?lm  #see help of LM
#Simple Linear Model would look like this
slr1 = lm(formula = sales ~ price, data=omni) # sales depend on price of item
slr2 = lm(formula = sales ~ promotion, data=omni) # sales depend on promotion exp
summary(slr1)
summary(slr2)


#MLR  Create Multiple Linear Regression
# we want to see how Sales Qty depend on Price and Promotion Values
mlrmodel1 = lm(sales ~ price + promotion, omni)
#mlrmodel1 = lm(omni, sales ~ price + promotion)
?lm
#how to give parameter values in different sequence, use arguments names if in different order
mlrmodel1 = lm( data=omni, formula = sales ~ price + promotion)

range(omni$sales)
summary(mlrmodel1)  # summary statistics IMP STEP
#understand values : R2, AdjR2, Fstats pvalue, Coeff, ***, Residuals

coef(mlrmodel1) #coefficients b1, b2
#anova(mlrmodel1) #seeing from anova model

head(omni)

plot(y=omni$sales, x=omni$promotion)

#Predicted Values----
dim(omni)
fitted(mlrmodel1)
cbind(omni, fitted(mlrmodel1), residuals(mlrmodel1))
summary(mlrmodel1)

names(omni)
#create a dataframe of new sample values
(ndata1 = data.frame(price=c(60,70), promotion=c(300,400)))
range(omni$price); range(omni$promotion)
predict(mlrmodel1, newdata=ndata1)
cbind(ndata1, Predict=predict(mlrmodel1, newdata=ndata1, predict='response'))






#R2 and Adjs R2
names(mlrmodel1)
summary(mlrmodel1)
summary(mlrmodel1)$r.squared
summary(mlrmodel1)$adj.r.squared

#Manual Calculation of Adjs R2
(r2 = summary(mlrmodel1)$r.squared)
k = 2 # no of IVs
(n = nrow(omni)) # sample size
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

#Plots of the Modle
plot(mlrmodel1,1)  # no pattern, equal variance
plot(mlrmodel1,2)  # Residues are normally distributed
plot(mlrmodel1,3)
plot(mlrmodel1,4)  # tells outliers which affect model


# Confidence Intervals


#Fitted values : Predicting on IVs using model
fitted(mlrmodel1)
residuals(mlrmodel1) 
mlrmodel1$residuals
cbind(omni$sales, fitted(mlrmodel1), omni$sales - fitted(mlrmodel1), residuals(mlrmodel1))

#sqrt(sum((residuals(mlrmodel1)^2)))
names(mlrmodel1)
summary(mlrmodel1)




#Diagnostics Test for Checking Assumptions 
#Should be Linear relationship between Residuals Vs Ypi, X1i, X2i
cbind(fitted(mlrmodel1), residuals(mlrmodel1))
plot(cbind(fitted(mlrmodel1), residuals(mlrmodel1)))
#not quadratic
plot(cbind(omni$price, residuals(mlrmodel1)))
plot(cbind(omni$promotion, residuals(mlrmodel1)))
#May indicate quadratic term of IVs


#Train and Test Data


# RMSE


omni
names(omni)
mlr2 = lm(sales ~ price + promotion, data= omni)
summary(mlr2)
new1=data.frame(price=60:70, promotion=400)
predict(mlr2, newdata = new1)
cbind(new1,predict(mlr2, newdata = new1) )


