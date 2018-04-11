# Finance Stock Analysis

#Install Packages 
#pckgs<-c("Quandl","Sweep","tidyverse")
#install.packages(pckgs,dependencies = TRUE)

library(Quandl)
# library(tidyverse)
# library(ggplot2)
# library(stringr)
# library(plyr)
# library(stringr)
# library(gridExtra)

#Quandl(Code=“NSE/—”,collapse=“—”,start_date=“—-”,type=“…”)
#ICICI SBI PNB  price band of Rs 200 to Rs 500. 
#https://www.quandl.com/account/api 4D8hkYAV4WEkcTmD9LMW

Quandl.api_key("4D8hkYAV4WEkcTmD9LMW")

## Download the data Set
ICICI = Quandl("NSE/ICICIBANK",collapse="daily",start_date="2017-09-01",type="raw")
PNB= Quandl("NSE/PNB",collapse="daily",start_date="2017-09-01",type="raw")
SBI=Quandl("NSE/SBIN",collapse="daily",start_date="2017-09-01",type="raw")

## Add another ("Stock") column in Datasets using cbind command
head(ICICI)
## Paste the stock name in stock column

ICICI$Stock = "ICICI"
PNB$Stock = "PNB"
SBI$Stock = "SBI"
SBI

allstocks = rbind(ICICI, PNB, SBI)
str(allstocks)
allstocks$Stock = factor(allstocks$Stock)
str(allstocks)
names(allstocks)
names(allstocks)[c(7,8)] = c('Qty','Turnover')
names(allstocks)


#Using Aggregations
names(allstocks)
aggregate(allstocks$Close, by=list(allstocks$Stock), mean)
aggregate(cbind(Close,  Open) ~ Stock , data= allstocks, mean)
#https://www.statmethods.net/input/dates.html
aggregate(allstocks['Close'], by=list(allstocks$Date), mean)
aggregate(allstocks['Close'], by=list(format(allstocks$Date,"%d")), mean)
aggregate(allstocks['Close'], by=list(format(allstocks$Date,"%b")), mean)
aggregate(allstocks[c(3,7)], by=list(format(allstocks$Date,"%m")), mean)
aggregate(allstocks[c('Close','Open')], by=list(format(allstocks$Date,"%Y")), mean)

#using Dplyr Package to do Data Manipulation
library(dplyr)
names(allstocks)
#select Columns
allstocks %>% select(Stock, Open, Close)

#Groupby
allstocks %>% group_by(Stock)  #nothing summarised

#summarise
allstocks %>% summarise(mean(Open), max(High))

allstocks %>% group_by(Stock) %>% summarise_all(mean)
allstocks %>% group_by(Stock, format(Date,'%b')) %>% summarise_all(mean)
options(dplyr.print_max = 1e9)
allstocks %>% group_by(Stock, format(Date,'%b')) %>% summarise_all(mean)

allstocks %>% group_by(Stock, format(Date,'%b')) %>% summarise_all(funs(mean, max))

#sample using dplyr
allstocks %>% sample_n(10)
allstocks %>% sample_frac(.05)
allstocks %>% group_by(Stock) %>%   sample_n(2)

allstocks %>% group_by(Stock) %>% tally(Qty) %>%  top_n(1)
allstocks %>% group_by(Stock, format(Date,'%Y')) %>% top_n(2, Turnover)
