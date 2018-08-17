
#MLM
#3rd Method : gsheet 
library(gsheet)
url = "https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=1595306231"
omni3 = as.data.frame(gsheet2tbl(url))

omni = omni3
head(omni)
#salesqty ~ price + promotion
#predict sales (qty) for different combination of price and promotion

mlrmodel1 = lm(sqty ~ price + promotion, data=omni)
mlrmodel1
summary(mlrmodel1)
#does model exist - Fstats p value < 0.05
#what is overall prediction of variance - adj R2
#are all variables significant ?

#check for assumptions
#is their a linear relationship between IV anDVd 
car::crPlots(mlrmodel1)
#do residues have equal variance (homoscedascity)
plot(mlrmodel1)
par(mfrow=c(1,1))
plot(mlrmodel1)

plot(mlrmodel1, which=1)
#points around straight red line
#are the residues normally distributed
plot(density(residuals(mlrmodel1)))

plot(mlrmodel1, which=2)
#is their auto correlation
car::durbinWatsonTest(mlrmodel1)
#if pvalue > 0.05, there is no autocorrelation
#is their multicollinearity
car::vif(mlrmodel1)
#if sqrt of above values > 2, there is autocollinearity
# are their significant outliers which can affect model
plot(mlrmodel1,4) 


#predict for new values of IV
(ndata1 = data.frame(price=c(60,70), promotion=c(300,400)))
range(omni$price); range(omni$promotion)
predict(mlrmodel1, newdata=ndata1)
cbind(ndata1, Predict=predict(mlrmodel1, newdata=ndata1, predict='response'))

