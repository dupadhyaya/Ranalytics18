#Multiple Linear Regression 

#Omni Store

sales= c(4141,3842,3056,3519,4226, 4630,3507,3754, 5000,5120,4011, 5015,1916,675, 3636,3224,2295, 2730,2618,4421, 4113,3746, 3532, 3825,1096, 761,2088,820,2114, 1882,2159,1602,3354,2927)
price = c(59,59,59,59,59,59,59,59,59,59,59,59, 79,79,79,79,79,79,79,79,79, 79,79,79,99,99, 99,99,99,99,99,99,99,99)
promotion= c(200,200,200,200,400,400,400,400, 600,600,600,600,200,200,200,200, 400,400,400,400,600,600,600,600, 200,200,200,200,400,400,400,400,600,600)


omni = data.frame(sales, price, promotion)
head(omni)
str(omni)
?lm
#MLR
mlrmodel1 = lm(formula = sales ~ price + promotion, data=omni)
mlrmodel1 = lm(sales ~ price + promotion, omni)

mlrmodel1 = lm( data=omni, formula = sales ~ price + promotion)
mlrmodel1a = lm( omni, sales ~ price + promotion)

mlrmodel2 = lm(formula = sales ~ price, data=omni)
range(omni$sales)
summary(mlrmodel1)
#summary(mlrmodel2)
coef(mlrmodel1)
anova(mlrmodel1)
#
coef(mlrmodel1)


#R2 and Adjs R2
names(mlrmodel1)
(r2 = summary(mlrmodel1)$r.squared)
k = 2 # no of IVs
(n = nrow(omni)) # sample size
(adjr2 = 1 - ( (1 - r2) * ((n - 1)/ (n - k - 1))))
summary(mlrmodel1)$r.squared


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


#Predicted Values
fitted(mlrmodel1)
names(omni)
(ndata1 = data.frame(price=c(60,70), promotion=c(300,400)))
predict(mlrmodel1, newdata=ndata1)
cbind(ndata1, Predict=predict(mlrmodel1, newdata=ndata1, predict='response'))

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




