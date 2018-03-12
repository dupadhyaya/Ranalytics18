#Loading the rvest package
library('rvest')

#Specifying the url for desired website to be scrapped
lego_movie <- html("http://www.imdb.com/title/tt1490017/")

#Reading the HTML code from the website
lego_movie %>%
  html_node("strong span") %>%
  html_text() %>%
  as.numeric()
#> [1] 7.9

lego_movie %>%
  html_nodes("#titleCast .itemprop span") %>%
  html_text()



#Table in webpage
library(XML)
airline = "http://www.theacsi.org/index.php?option=com_content&view=article&id=147&catid=&Itemid=212&i=Airlines"

airline.table = XML::readHTMLTable(airline, header=T, which=1,stringsAsFactors=F)

airline.table

chess = "http://ratings.fide.com/top.phtml?list=men"
chess.table = XML::readHTMLTable(chess, header=T, which=5,stringsAsFactors=F)
chess.table[,1:5]
names(chess.table)
?readHTMLTable
