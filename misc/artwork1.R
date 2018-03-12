# Auction Data Analysis
# Data Set

docurl = "https://docs.google.com/spreadsheets/d/"
sheeturl = paste0("1QogGSuEab5SZyZIw1Q8h-0yrBNs1Z_eEBJG7oRESW5k","/edit#gid=")
sheetname = "560796239"
fullurl = paste0(docurl, sheeturl, sheetname)
fullurl
df = as.data.frame(gsheet::gsheet2tbl(fullurl, skip=2))
summary(df)
str(df)




auctiondata = read.csv('data/AuctionsData - set1.csv', skip=1)
colclass = c('character'. )
#auctiondata = read.csv(file.choose())
str(auctiondata)
names(auctiondata)
auctiondata$lotesthigh = as.numeric(auctiondata$lotesthigh)
