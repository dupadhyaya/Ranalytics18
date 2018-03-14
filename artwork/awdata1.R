# Artwork Data 
library(readr)
AuctionsData_set1 <- read_csv("Data/AuctionsData - set1.csv", skip = 3)
#View(AuctionsData_set1)

summary(AuctionsData_set1)
auctiondata2 = as.data.frame(AuctionsData_set1)
str(auctiondata2)

names(auctiondata2)
summary(auctiondata2)
auctiondata2$recid = as.character(auctiondata2$recid)
auctiondata2$auccur = as.factor(auctiondata2$auccur)
auctiondata2$aucdate= as.Date(auctiondata2$aucdate,'%m/%d/%Y')
auctiondata2$aucid = as.factor(auctiondata2$aucid)
auctiondata2$auchouse = as.factor(auctiondata2$auchouse)
auctiondata2$awid = as.numeric(auctiondata2$awid)
auctiondata2$awcat = as.factor(auctiondata2$awcat)
auctiondata2$aucloc = as.factor(auctiondata2$aucloc)

auctiondata2$aucid= as.character(auctiondata2$aucid)
auctiondata2$awid = as.character(auctiondata2$awid)
auctiondata2$lotno = as.character(auctiondata2$lotno)
auctiondata2$lotstatus= as.factor(auctiondata2$lotstatus)

summary(auctiondata2)


#Structure Columnswise

for (i in 1:length(names(auctiondata2)))
  print(summary(auctiondata2[i]))

saveRDS('auctiondata2','./data/artwork.rds' )

