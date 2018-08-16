# Case Study - Denco  

#read file : Method1
sales1 = read.csv("./data/denco.csv")
str(sales1)

#read file : Method2
sales2 = read.csv(file.choose())
str(sales2)

# whichever you read the data, store it in sales object
sales = sales1  # keeping a backuph
head(sales)  #top 6 rows
str(sales)
class(sales)
dim(sales)
summary(sales)
names(sales)
tail(sales)

unique(sales$custname)
length(unique(sales$custname))
length(unique(sales$region ))
#dplyr
names(sales)
library(dplyr)

names(sales)
sales %>% group_by(custname) %>%  summarize(Revenue = sum(revenue)) %>% arrange(desc(Revenue)) %>% head(n=3)
#Triumph Insulation gave highest Revenue

df3 = sales %>% group_by(custname) %>%  summarize(Revenue = sum(revenue)) %>% arrange(desc(Revenue))
options(tibble.width = Inf) # displays all columns.
options(tibble.print_max = Inf) # to show all the rows.
df3[15:60,]

# Frequency --------
names(sales)
t1=table(sales$custname)
t1
class(t1); length(t1) ;head(t1)
t2= sort(t1,decreasing=T )
head(t2)


library(dplyr)
sales %>% count(custname, sort=TRUE)
sales %>% count(custname, sort=TRUE) %>% head(n=5)


sales %>% dplyr::group_by(custname) %>% dplyr::summarise(n = n()) %>% dplyr::arrange(desc(n)) %>% head(n=5)
# Summarise by Part Num
sales %>% dplyr::group_by(partnum) %>% dplyr::summarise(n = n()) %>% dplyr::arrange(desc(n))  %>% head(n=5)
# which parts have highest Profit : partno - sum(profit)
names(sales)
sales %>% group_by (partnum) %>% summarise(TotalMargin= sum(margin)) %>% arrange(desc(TotalMargin)) %>% head()

df4 = sales %>% group_by(region) %>% summarise(Revenue = sum(revenue)) %>% arrange(desc(Revenue))
pie(x = df4$Revenue)
barplot(df4$Revenue, col=1:4)

sales %>% filter(revenue >= 7771000 ) %>% select(custname, revenue)
sales[, 1:2]

sales %>% sample_frac(.01) 
sales %>% sample_n(5)
sample_n(sales, 5)


