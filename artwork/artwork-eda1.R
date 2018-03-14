# Artwork EDA1
options(scipen = 999999999)
head(auctiondata2)

#Check the data
head(auctiondata2)

#Descriptive Analysis

#Missing values
sum(is.na(auctiondata2))
colSums(is.na(auctiondata2))
rowSums(is.na(auctiondata2))
auctiondata2[complete.cases(auctiondata2),][c('recid','awid','lotstatus')]


#Set Numeric Columns
numcols = c('lotesthigh','lotestlow', 'saleprice') 

#Describe the data set
library(Hmisc)
Hmisc::describe(auctiondata2)

Hmisc::describe(auctiondata2[,c(numcols)])

library(pastecs)
pastecs::stat.desc(auctiondata2) 

library(psych)  #describe by group
psych::describe.by(auctiondata2, auctiondata2$auchouse)

names(auctiondata2)
boxplot(auctiondata2[,c('saleprice')])
#outliers / Extreme values
boxplot(auctiondata2[,numcols], col=1:3)
ylim= range(auctiondata2$saleprice, na.rm=T)
boxplot(auctiondata2[,numcols], col=8:5, ylim=c(90000,4000000))
abline(h=median(auctiondata2$lotesthigh))


# Table
# Count Artwork Cat vs Auction House
(t1= table( auctiondata2$awcat, auctiondata2$auchouse))
(mt1= addmargins(t1,c(1,2), FUN= list(sum)))
prop.table(table( auctiondata2$awcat, auctiondata2$auchouse))

#Table Summary/ Count - Status - Category - Auction House
table( auctiondata2$awcat, auctiondata2$auchouse, auctiondata2$lotstatus )



#Artists
length(unique(auctiondata2$arname))
