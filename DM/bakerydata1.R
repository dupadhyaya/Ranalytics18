# Data for Graph and Data Manipulation

sales1 = read.csv('./data/bakery.csv')
sales1
str(sales1)
sales1$sdate = as.Date(sales1$sdate, '%d-%m-%y')
str(sales1)

head(sales1)

#library(timeDate)
#weekdays(sales1$sdate)  # date should not be factor
#sales1$daywk = as.character(sales$wkday)
unique(sales1$daywk)
sweekdays = c('Monday','Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')


head(sales1)
sales1$daywk = factor(sales1$daywk, ordered=T, levels=sweekdays)
str(sales1)
head(sales1)

sales= sales1  # make a copy for analysis

str(sales)
head(sales)
save(sales,file='./data/MA.RData')
?save
