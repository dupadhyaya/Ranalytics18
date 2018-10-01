# Case Study - Denco  
#Manufacturing Firm with sales data of partnum and customer with region wise sales

# Should know - import, table, dplyr, aggregate etc

#read file : Method1
sales1 = read.csv("./data/denco.csv")
str(sales1) #see if data is loaded and check its structure
head(sales1)
#read file : Method2 : when location is not in project folder
sales2 = read.csv(file.choose())
str(sales2)
head(sales2)

#read file: Method3
#install.packages('gsheet')
library(gsheet)
url = "https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=216113907"
sales3 = as.data.frame(gsheet2tbl(url))
str(sales3)
head(sales3)


# whichever you read the data, store it in sales object
sales = sales1  # keeping a backuph
head(sales)  #top 6 rows
str(sales)  # structure
class(sales) # class type - Df
dim(sales)  # rows & columns
summary(sales) # summary- colname, type
names(sales) # col names
head(sales) # first 6 values
tail(sales) # last 6 values

# Some other functions
unique(sales$custname)  # unique customer names
length(unique(sales$custname)) # no of unique customers
length(unique(sales$region )) # no of distinct regions

#Information Required----
# 1. Who are the most loyal Customers - What to do : Improve repeated sales, Target customers with low sales Volumes
# 2. Which customers contribute the most to their revenue : How do I retain these customers & target incentives
# 3a. What part numbers bring in to significant portion of revenue : Maximise revenue from high value parts
# 3b. What parts have the highest profit margin : What parts are driving profits & what parts need to build further


#dplyr
names(sales)
library(dplyr)  #use this library to do summarisation

#Case-1 : Loyal Customers----
# Finding Frequency and sort them in descending order
names(sales)
(t1=table(sales$custname))  # freq table for all customers
class(t1); length(t1)
head(t1) # top 6 but not sorted
t2= sort(t1,decreasing=T )
head(t2)
#Ans: CHIZ BROS INC most loyal with 253 times purchase

#other methods through dplyr
library(dplyr)
sales %>% count(custname, sort=TRUE) %>% head(n=5)
#Ans: CHIZ BROS INC most loyal with 253 times purchase

sales %>% dplyr::group_by(custname) %>% dplyr::summarise(n = n()) %>% dplyr::arrange(desc(n)) %>% head(n=5)
#Ans: CHIZ BROS INC most loyal with 253 times purchase


#Case-2 : Customer- Highest Revenue---
sales %>% group_by(custname) %>%  summarize(Revenue = sum(revenue)) %>% arrange(desc(Revenue)) %>% head(n=5)
#Ans2: Triumph Insulation gave max revenue

# save this object and then analyse
salesrevenue = sales %>% group_by(custname) %>%  summarize(Revenue = sum(revenue)) %>% arrange(desc(Revenue))

#dply uses tibble format and does not show all rows/cols by default
options(tibble.width = Inf) # displays all columns.
options(tibble.print_max = Inf) # to show all the rows.
salesrevenue[1:5,] # first 5 rows
#Ans2: here also Triump insulation gives max revenue = 35592K

#Case3 : Most Profitable PartsNums ----
# Look for freq, revenue and/ or profit margin

# Summarise by Part Num for frequency
sales %>% dplyr::group_by(partnum) %>% dplyr::summarise(n = n()) %>% dplyr::arrange(desc(n))  %>% head(n=5)
#Ans3a: Part Num- 764821000 was purchased max times -   122

# Summarise Partnum for Profit(margin) : sum(profit)
names(sales)
sales %>% group_by (partnum) %>% summarise(TotalMargin= sum(margin)) %>% arrange(desc(TotalMargin)) %>% head()
#Ans 3b: Part Num - 733648000 gave max margin profit - 11003367

# Summarise Partnum for revenue
#(practise it )


#Case : Extra ----
#Find Regions wise sales

(salesregionrevenue = sales %>% group_by(region) %>% summarise(Revenue = sum(revenue)) %>% arrange(desc(Revenue)))

#Some Graphs related to Data Summarised
pie(x = salesregionrevenue$Revenue, labels=unique(sales$region))
barplot(salesregionrevenue$Revenue, col=1:4)

# Filter Data----
#Rows where revenue > 700000 : show only custname, revenue
sales %>% filter(revenue >= 700000 ) %>% select(custname, revenue)

#select 1% rows on random basis
sales %>% sample_frac(.01)  %>% select(custname, revenue)

#select 10 rows on random basis and sort them regionwise
sales %>% sample_n(10)  %>% select(custname, region) %>% arrange(region)
sample_n(sales, 10) # similar method

#End of session for Denco Case - Manufacturing Firm
#Descriptive Analysis
#Loyal Customers, Customer giving max revenue
#Profitable Partnums - Freq, Revenue and Margin

