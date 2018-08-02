# Graphs for MA

salemonth = month.abb[1:12]
salemonth  # order of variables not correct
salemonth = factor(salemonth, ordered=T, levels=month.abb[1:12])
salemonth
product1 = round(runif(12,10,100),2)
product2 = round(runif(12,10,100),2)
sales = data.frame(salemonth, product1, product2)
str(sales)
# ok
plot(salemonth, product1, data=sales, type='l', col='red')
plot(salemonth, product2, data=sales, type='l', col='red')
par(options)
abline(lm(product2 ~ salemonth))
lines(lowess(product2 ~ salemonth))


#
pairs(sales[,1:3])

#
plot(wt ~ mpg, data=mtcars)
plot(sales$salemonth , sales$product1, type='p', col='red', pch='17')
barplot(product1, data=sales, names.arg=salemonth)
barplot(as.matrix(sales[,c('product1', 'product2')]), beside = T, data=sales, names.arg=salemonth, legend.text = 'Legend')

#
plot(as.numeric(sales$salemonth) , sales$product1, type='l', col='red', xlab='Months', ylab='Products', ylim=c(0,100))
par(new=TRUE)
plot(as.numeric(sales$salemonth) , sales$product2, type='l', col='green', xlab ='Months', lwd='2', ylab="", ylim=c(0,100))


#ggplot2
library(ggplot2)
g = ggplot(sales, aes(as.numeric(salemonth)))  #g
g = g + geom_line(aes(y=product1), color='red')
g = g + geom_line(aes(y=product2), color='green')
g = g + labs(x = "Month",y = "Sales amount", title = "Sales for Different Products")
g

#
b = ggplot(data=sales, aes(x=salemonth, y=product1)) +
  geom_bar(stat="identity")
b
# Two graphs do not work this way.. do some changes
sales
library(reshape2)
sales2 = melt(data=sales, id.vars='salemonth')
sales2

b2 = ggplot(data=sales2, aes(x=salemonth, y=value, fill=variable)) 
b2 = b2 + geom_bar(stat="identity", position='dodge')
b2 
#ok

sales2[salemonth==c('Jan','Feb'),]
b2 = ggplot(data=sales2[salemonth==c('Jan','Feb'),], aes(x=salemonth, y=value, fill=variable)) 
b2 = b2 + geom_bar(stat="identity", position='dodge')
b2 



#wide to long
