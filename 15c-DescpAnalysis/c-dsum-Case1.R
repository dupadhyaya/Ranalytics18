# Data Visualisation and Summarisation

library(gsheet)
url = "https://docs.google.com/spreadsheets/d/1JkMVHbbWlxofMy27X-TdBPfy5R6YvrPw_EExARA8Bno"
sales1 = as.data.frame(gsheet2tbl(url))
sales1
sales= sales1 # save a copy of original data

head(sales1)

#missing values in 3 columns
sales1$revporder = floor(sales1$revenue/sales1$orders)
head(sales1)

sales1$revpsalespers = floor(sales1$revenue/sales1$salespers)
head(sales1)


library(dplyr)
sales1 <- mutate(sales1, orderspsalespers = trunc(orders/salespers))
head(sales1)

#data columns ready for summarisation and visualisation

summary(sales1)
sales1$group = factor(sales1$group)

# Distribution of Data
boxplot(sales1$revenue)
head(sales1)
boxplot(sales1$orders, sales1$salespers,names=c('Orders','Salespersons'), col=4:5)

?boxplot

# Summarise

aggregate(sales1$revenue, by=list(sales1$group), FUN=sum)

aggregate(revenue ~ group, data=sales1, sum)

df1=aggregate(revenue ~ group, data=sales1, sum)
pie(x=df1$revenue, labels=df1$group)
labels1 = paste(df1$group, 'Sum-', df1$revenue, round(df1$revenue/ sum(df1$revenue),2) * 100 , '% ' , sep=' ')

pie(x=df1$revenue, labels=labels1, col = rainbow(length(df1$group)))
legend("topright", c("Group1","Group2","Group3"), cex = 0.8,
       fill= rainbow(length(df1$group)))
title(main='Revenue of Sales : Groupwise')

#----
aggregate(cbind(revenue, orders) ~ group, data=sales1, FUN=sum)
df2= aggregate(cbind(salespers, orders) ~ group, data=sales1, FUN=sum)

#simple barpot
barplot(height=sales1$revenue, names.arg = sales1$product, col=1:length(sales1$product))


df2
df2matrix = matrix(c(df2$salespers, df2$orders), byrow = F, ncol=2)
df2matrix
t(df2matrix)
barplot(t(df2matrix))
barplot(t(df2matrix), beside = T, col=1:2, ylab='Numbers', ylim=c(0,max(df2matrix) *1.5), names.arg = df2$group)
legend('topright', c('salespers','orders'), cex = 1, fill = 1:2)
barplot(t(df2matrix), horiz = T, col=c('green','yellow'))

#http://www.sthda.com/english/wiki/ggplot2-barplots-quick-start-guide-r-software-and-data-visualization#barplot-of-counts



aggregate(cbind(revenue, orders) ~ group, data=sales1, FUN = function(x) c(mn = mean(x), n = length(x) ))

aggregate(cbind(revenue, orders) ~ group + cat, data=sales1, FUN = function(x) c(mn = mean(x), n = length(x) ))


#functions specify to column type


# Trend Line and Line Chart
plot(sales1$revporder, xlab="Products", type='o',  col='red', xaxt='n')
mtext(text=sales1$product, side=1, at=1:length(sales$product), line= 1, col=1:length(sales$product))
lines(sales1$orderspsalespers, type='o', col='green')
text(1:length(sales1$product), sales1$revenue, sales1$revenue)
text(1, 80, 'hellow')
