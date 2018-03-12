# Artwork 4

library(readr)
AuctionsData_set1 <- read_csv("Data/AuctionsData - set1.csv", skip = 3)
View(AuctionsData_set1)

summary(AuctionsData_set1)
auctiondata2 = as.data.frame(AuctionsData_set1)
str(auctiondata2)

names(auctiondata2)
summary(auctiondata2)
numcols = c('lotesthigh','lotestlow', 'saleprice') 
auctiondata2$auchouse = as.factor(auctiondata2$auchouse)
auctiondata2$awcat = as.factor(auctiondata2$awcat)
auctiondata2$lotstatus= as.factor(auctiondata2$lotstatus)

auctiondata2$recid = as.character(auctiondata2$recid)
auctiondata2$awid = as.character(auctiondata2$awid)
auctiondata2$lotno = as.character(auctiondata2$lotno)

auctiondata2$aucur = as.factor(auctiondata2$auccur)
auctiondata2$aucid = as.factor(auctiondata2$aucid)


summary(auctiondata2)


#Descriptive Analysis

#Missing values
sum(is.na(auctiondata2))
colSums(is.na(auctiondata2))

#Aggregation
numcols
library(Hmisc)
Hmisc::describe(auctiondata2[,c(numcols)])
Hmisc::describe(auctiondata2)

library(pastecs)
pastecs::stat.desc(auctiondata2) 

library(psych)  #describe by group
psych::describe.by(auctiondata2, auctiondata2$auchouse)


# Table
table(auctiondata2$auchouse, auctiondata2$aucid)

table(auctiondata2$auchouse, auctiondata2$aucid, auctiondata2$lotstatus)


