# Artwork 4

library(readr)
AuctionsData_set1 <- read_csv("Data/AuctionsData - set1.csv", skip = 3)
#View(AuctionsData_set1)

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



