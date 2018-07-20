# Data Summarisation : Sales Data

# Create a DataFrame of 50 rows with following columns and properties

#product company qtysold priceitem

#this will create all combination of product and coys
df=expand.grid(product = c('noodles', 'biscuits', 'wafers', 'chocolates'), coy = c('coy1','coy2','coy3'))
df
#assign random values for qtysold and price for each product/ coy
df$qty = floor(runif(12,50,100))
df$price = floor(rnorm(12,70,15))
head(df)

# Do descriptive Analysis and draw some graphs
# use aggregate or functions from dplyr package
library(dplyr)

#Total Sales Qty : Product wise
aggregate(df$qty, by=list(df$product), sum)
aggregate(qty ~ product, data=df, sum)
df %>% group_by(product) %>% summarise(TotalQty= sum(qty))

#Total Sales Qty : Coy wise
df %>% group_by(coy) %>% summarise(TotalQty= sum(qty))


#Total Revenue : Product and Coy Wise
df %>% mutate(TotalSale = qty * price)
df %>% mutate(TotalSale = qty * price) %>% group_by(coy) %>% summarise(TotalRevenue= sum(TotalSale))
df %>% mutate(TotalSale = qty * price) %>% group_by(product) %>% summarise(TotalRevenue= sum(TotalSale))


#Draw comparison plot : Bar and Pie Charts
sum1 <- df %>% mutate(TotalSale = qty * price) %>% group_by(product) %>% summarise(TotalRevenue= sum(TotalSale)) %>% arrange(desc(TotalRevenue))
sum1
barplot(sum1$TotalRevenue, names.arg = sum1$product, col=1:nrow(sum1))

sum1
plabels <- paste(sum1$product, round(sum1$TotalRevenue/sum(sum1$TotalRevenue)* 100, 0) , "%" , sep=' ') 
plabels
pie(sum1$TotalRevenue, labels = plabels, col=1:nrow(sum1))

#Which product generates max revenue
sum1a <- df %>% mutate(TotalSale = qty * price) %>% group_by(product) %>% summarise(TotalRevenue= sum(TotalSale)) %>% arrange(desc(TotalRevenue)) 
sum1a %>% top_n(1)

#Which coy generated min Revenue
sum2a <- df %>% mutate(TotalSale = qty * price) %>% group_by(coy) %>% summarise(TotalRevenue= sum(TotalSale)) %>% arrange(desc(TotalRevenue)) 
sum2a %>% top_n(-1)
sum2a
