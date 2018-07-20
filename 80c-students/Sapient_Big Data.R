library(dplyr)
library(TTR)
library(tidyr)
library(stringr)
train = read.csv('./data/Analytics_Vidhya/household.csv', header = T, stringsAsFactors = F)
test1 = read.csv('./data/Analytics_Vidhya/alert_type_1.csv', header = T, stringsAsFactors = F)
test2 = read.csv('./data/Analytics_Vidhya/alert_type_2.csv', header = T, stringsAsFactors = F)
str(train)
str(test1)
str(test2)
head(train)
head(test1)
head(test2)
summary(train)
range(train$timestamp)
names(train)
nrow(train)
#check for duplicates, select only non-duplicates
train[duplicated(train[c(1,2,3)]),]
subset(train, duplicated(subset(train, select=c(1:3))))
#No duplicates proceed with data
anyNA(train)
df1 = train
test1 = separate(data = test1, col = "id", into = c("hid","hhid","date","hr"),sep = "_")
str(test1)
View(test1)
test2 = separate(data = test2, col = "id", into = c("hid","hhid","date","hr"),sep = "_")
View(test2)
str(test2)
as.data.frame(colSums(is.na(test1)))
as.data.frame(colSums(is.na(test2)))
test1$date = as.Date(test1$date, "%d-%m-%Y"); test1$date
str(test1)
View(test1)
test2$date = as.Date(test2$date, "%d-%m-%Y"); test2$date
str(test2)
test1$date = format(as.Date(test1$date),"%d-%m-%Y"); test1$date
test2$date = format(as.Date(test2$date),"%d-%m-%Y"); test2$date

