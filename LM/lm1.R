# Regression Analysis
# 
sales = read.csv('./data/bowl.csv')
names(sales)
summary(sales)
?gsub
head(sales)
#sales$bowlprice = as.numeric(gsub("\\$", "", sales$bowlprice))
summary(sales)
names(sales)
sales1 = sales[,1:2]
names(sales1)
cor(sales1$bowls, sales1$bowlprice)

fit1 = lm(bowls ~ bowlprice, data=sales1)

summary(fit1)
head(sales1)
new1 = data.frame(bowlprice=c(7,8,9))
predict(fit1, newdata=new1)

plot(x=sales1$bowlprice, y= sales1$bowls)
sales2 = sales1[order(sales1$bowlprice),]
plot(x=sales2$bowlprice, y= sales2$bowls)
abline(fit1)


