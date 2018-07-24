# Regression Analysis

data(women)
women
str(women)
cov(women$height, women$weight)
#69 : which show positive relationship between height and weight
cor(women$height, women$weight)
#0.995 : which shows Strong and Positive relationship betw height & weight
0.995^2 # also equal R^2 value in this case (Simple Linear Regression)

plot(x=women$height, y=women$weight)
abline(lm(weight ~ height, data=women), col='red')
names(women)  #x- IV, y -DV
fit1 = lm(weight ~ height, data=women)
summary(fit1)

#coefficients
coef(fit1)
#p values for b0 & b1 are significant as it is < 0.05
#pvalue1 = 1.71e-09 < 0.05
#pvalue2 = 1.09e-14 < 0.05

#R2
(summary(fit1))$r.squared  #0.991
(summary(fit1))$adj.r.squared  #0.9903
#99% of variation in weight is explained by Height
#Good Linear Model for Prediction


#FStats : p value
(summary(fit1))$fstatistic 
#pvalue : 1.09e-14  < 0.05 : Model exists
#There is at least 1 IV which explains variation in Y (DV)

range(women$height)
#Prediction : for height = 65, 66
(new1 = data.frame(height=c(65,66)))
predict(fit1, newdata = new1, type='response')
#136.7333 140.1833

predict(fit1, newdata = new1, interval='confidence')
predict(fit1, newdata = new1, interval='prediction')

set.seed(10)
(df$age = floor(runif(15, 20,30)))
set.seed(10)
(age = floor(runif(15, 20,30)))
df$age == age
cbind(df$age, age, df$age-age)
df$var2 = floor(runif(15, 30,40))
df
df$age2 = age
df[-c(1:2)]
df = df[-4]
df

#y = mx + c
fit1= lm(formula= weight ~ height + age +var2 , data= df)
summary(fit1)
abline(fit1)
df
cor(df$weight, df$height)
df=women
df$predict = predict(fit1, newdata=data.frame(height=women$height))
df
abline(v=60)
abline(h=119)

