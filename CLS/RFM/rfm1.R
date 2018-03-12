#RFM

##Creating Random Sales Data of the format CustomerId (unique to each customer), Sales.Date,Purchase.Value

custid = sample(1000:1999, replace=T,size=10000)
sales.value = abs(round(rnorm(10000,28,13)))
sales=data.frame(custid, sales.value)
head(sales)

head(700*sort(stats::runif(10000)),50)
sales.dates <- as.Date("2016/1/1") + 700*sort(stats::runif(10000))

head(sales.dates, 20)
#generating random dates

sales=cbind(sales,sales.dates)
head(sales,10)
str(sales)
sales1 = sales
summary(sales)
difftime(Sys.Date(), Sys.Date()-3, units="days")

sales$recency=round(as.numeric(difftime(Sys.Date(),sales[,3],units="days")) )
head(sales)

#library(gregmisc)
library(gdata)

##if you have existing sales data you need to just shape it in this format
gdata::rename.vars(sales, from="sales.value", to="purchase.value" )

## Creating Total Sales(Monetization),Frequency, Last Purchase date for each customer
names(sales)
(salesM=aggregate(sales[,2],list(sales$custid),sum))

names(salesM)=c("custid","monetization")
head(salesM, 5)
head(salesM[order(salesM$monetization, decreasing=T),], 5)

#Frequency
salesF=aggregate(sales[,2],list(sales$custid),length)
head(salesF)
names(salesF)=c("custid","freq")
head(salesF)
head(salesF[order(salesF$freq, decreasing=T),], 5)

#Recency
salesR=aggregate(sales[,4],list(sales$custid),min)
head(salesR)
names(salesR)=c("custid","recency")
head(salesR[order(salesR$recency, decreasing=F),], 5)

##Merging R,F,M
summary(sales)
test1=merge(salesF,salesR,"custid")
head(test1)
salesRFM=merge(salesM,test1,"custid")

##Creating R,F,M levels : intervals of 5 : 1-5:A, 6-10:B

salesRFM$rankR=cut(salesRFM$recency, 5,labels=F) #rankR 1 is very recent while rankR 5 is least recent

salesRFM$rankF=cut(salesRFM$freq, 5,labels=F)#rankF 1 is least frequent while rankF 5 is most frequent

salesRFM$rankM=cut(salesRFM$monetization, 5,labels=F)#rankM 1 is lowest sales while rankM 5 is highest sales

head(salesRFM,50)
##Looking at RFM tables
table(salesRFM[,5:6])
table(salesRFM[,6:7])
table(salesRFM[,5:7])

#use quantiles instead of cut
