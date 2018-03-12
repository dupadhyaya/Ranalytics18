# Auction Data Analysis
# Data Set

auctiondata = read.csv('./Data/AuctionsData - set1.csv', skip=3, stringsAsFactors = F, na.strings=c(""))
names(auctiondata)
dim(auctiondata)

#auctiondata = read.csv(file.choose())
str(auctiondata)
summary(auctiondata)
colSums(is.na(auctiondata))

auctiondata$recid = as.numeric(auctiondata$recid)
summary(auctiondata$recid)
auctiondata$aucdate = as.Date(auctiondata$aucdate, format="%m/%d/%Y") 
summary(auctiondata$aucdate)

auctiondata$auchouse = as.factor(auctiondata$auchouse)
auctiondata$auchouse

auctiondata$aucloc = as.factor(auctiondata$aucloc)
auctiondata$aucloc
auctiondata$lotno = as.numeric(auctiondata$lotno)
auctiondata$lotno

auctiondata$awcat = as.factor(auctiondata$awcat)
auctiondata$awcat
auctiondata$lotesthigh = as.double(auctiondata$lotesthigh)
summary(auctiondata$lotesthigh)
summary(x)
as.numeric(x)
as.character(auctiondata$lotesthigh)

auctiondata$lotestlow = as.numeric(auctiondata$lotestlow)

auctiondata$saleprice = as.numeric(auctiondata$saleprice)
auctiondata$lotstatus = as.factor(auctiondata$lotstatus)

summary(auctiondata)

