#Multiple Linear Regression 
#Linear Modeling : DV vs more than 1 IVs
#sales Qty vs price & promotion

#Omni Store

#Method : gsheet or else download the sheet as csv and then import 
library(gsheet)
url = "https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=1595306231"
df = as.data.frame(gsheet::gsheet2tbl(url))
head(df)

#MLR  Create Multiple Linear Regression
# we want to see how Sales Qty depend on Price and Promotion Values
fit2 = lm(sqty ~ price + promotion, data=df)
summary(fit2)

# summary statistics of model IMP STEP
#understand values : R2, AdjR2, Fstats pvalue, Coeff, ***, Residuals
#coefficients b1, b2
#Predicted Values----
#create a dataframe of new sample values
(ndata1 = data.frame(price=c(60,70), promotion=c(300,400)))

#cbind the values
predict(fit2, newdata=ndata1)
cbind(ndata1, predictedSqty = predict(fit2, newdata=ndata1))

#end of LM
#check for assumptions of Linear Regression
plot(fit2)

