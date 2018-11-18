#Multiple Linear Regression : DV vs more than 1 IVs
#sales Qty vs price & promotion
#Predict Sales Qty from Price and Promotion of the Product


#Omni Store
#creating data using Vector
sales= c(4141,3842,3056,3519,4226, 4630,3507,3754, 5000,5120,4011, 5015,1916,675, 3636,3224,2295, 2730,2618,4421, 4113,3746, 3532, 3825,1096, 761,2088,820,2114, 1882,2159,1602,3354,2927)
price = c(59,59,59,59,59,59,59,59,59,59,59,59, 79,79,79,79,79,79,79,79,79, 79,79,79,99,99, 99,99,99,99,99,99,99,99)
promotion= c(200,200,200,200,400,400,400,400, 600,600,600,600,200,200,200,200, 400,400,400,400,600,600,600,600, 200,200,200,200,400,400,400,400,600,600)
#Create a DF from 3 variables
omni1 = data.frame(sales,price,promotion)
head(omni1)

#2nd Method : from CSV file
#omni2 = read.csv(file.choose())

#3rd Method : from gsheet 
library(gsheet)
url = "https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=1595306231"
omni3 = as.data.frame(gsheet::gsheet2tbl(url))
head(omni3)
#Make one of data frames active
omni = omni1
head(omni)
str(omni)
nrow(omni)
dim(omni)
#MLR  Create Multiple Linear Regression
# we want to see how Sales Qty depend on Price and Promotion Values
fit2 = lm(sales ~ price + promotion, data=omni)

# summary statistics of model IMP STEP
summary(fit2)
#understand values : R2, AdjR2, Fstats pvalue, Coeff, ***, Residuals
#F Stats pvalue = 2.86e-10 < 0.05 : Model Exists
#At least 1 IV can be used to predict sales
names(summary(fit2))
summary(fit2)$adj.r.squared  # Adjt R2 here > .6 
#>74% of variation in sales is explained by price and promotion

#coefficients b1, b2
coef(fit2)
summary(fit2)
#price  : -53 , pvalue = 9.2e-09 < 0.05 *** : Significant
#keeping promotion constant, if price is increased by 1 unit, salesqty decreases by 53 units
#promotion  : +3.6 , pvalue = 9.82e-06 < 0.05 ***: Significant
#keeping price constant, if promotion is increased by 1 unit, salesqty increases by 53 units

fitted(fit2)
omni$sales
residuals(fit2)
summary(residuals(fit2))
summary(fit2)
#Predict SalesQty for new combination of Values----

#create a dataframe of new sample values
range(omni$price) ; range(omni$promotion)
(ndata2 = data.frame(price=c(60,70), promotion=c(300,400)))
p2sales = predict(fit2, newdata=ndata2)
cbind(ndata2, p2sales)

#Assumptions
par(mfrow=c(2,2))
plot(fit2)
par(mfrow=c(1,1))

plot(fit2,which=1)  # no pattern, equal variance
plot(fit2,2)  # Residuals are normally distributed
plot(fit2,3)  # No hetero-scedascity
plot(fit2,4)  # tells outliers which affect model
omni[c(11,14,15),]

fit3 = lm(sales ~ price + promotion, data=omni[-c(11,14,15),])
plot(fit3,4)
summary(fit3)

#End of Multiple Linear Regression

#when variables are large, select only significant variables
#Model with higher R2 to be selected
#other measures of model selection : AIC, BIC, RMSE
#Dataset can be divided into train(70%) and test(30%) set to check the accuracy

#create model with t





#questions
fit2
summary(fit2)
head(omni)
cbind(omni, predict(fit2, newdata = data.frame(omni$price, omni$promotion)))
cbind(omni, fitted(fit2))
cbind(omni, fitted(fit2), omni$sales - fitted(fit2), residuals(fit2))
