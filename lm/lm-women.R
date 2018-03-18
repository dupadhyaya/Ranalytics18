# Regression Analysis
data()
data(women)
women
str(women)
cov(women$height, women$weight)
cor(women$height, women$weight)
plot(women)
names(women)  #x- IV, y -DV
plot(women, xlim=c(0,75), ylim=c(0,180))
df = women
df
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
