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


#(sp = round(ag2b$saleprice/ sum(ag2b$saleprice)*100,1))
names(ag2b)
gb1 = ggplot(data = ag2b, aes(x = "", y = saleprice, fill = auchouse ))
gb2 = geom_bar(stat = "identity", position = position_fill()) 
gb3 = geom_text(aes(label = awcat), position = position_fill(vjust = 0.5))

gb4 = coord_polar(theta = "y")

gb5 = facet_wrap(~ auchouse)
gb6 = theme(axis.title.x = element_blank(),  axis.title.y = element_blank())
gb7 = theme(legend.position='bottom')
gb8 = guides(fill=guide_legend(nrow=2,byrow=TRUE))
gb1+gb2+gb3 + gb4 + gb5 + gb6 + gb7 + gb8 
+ gb4 + ga5