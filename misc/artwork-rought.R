# rough work -

docurl = "https://docs.google.com/spreadsheets/d/"
sheeturl = paste0("1QogGSuEab5SZyZIw1Q8h-0yrBNs1Z_eEBJG7oRESW5k","/edit#gid=")
sheetname = "560796239"
fullurl = paste0(docurl, sheeturl, sheetname)
fullurl
df = as.data.frame(gsheet::gsheet2tbl(fullurl, skip=2))
summary(df)
str(df)


colcs1 = c('numeric','character', NA,NA,'character', 'character',	'character',	'character'	,'numeric',	'numeric',	'character','factor',	'character',	'numeric','numeric'	,'numeric',	'factor')
length(colcs1)
auctiondata = read.csv('./Data/AuctionsData - set1.csv', skip=2)
dim(auctiondata)
str(auctiondata)