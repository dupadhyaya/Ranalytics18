#Installing the web scraping package rvest
#install.packages("rvest")
library(rvest)
#Specifying the url for desired website to be scrapped
url <- 'http://pgdbablog.wordpress.com/2015/12/10/pre-semester-at-iim-calcutta/'


#Reading the HTML code from the website
webpage <- read_html(url)

#Know about the selector gadget
vignette("selectorgadget")

#Using CSS selectors to scrap the post date
post_date_html <- html_nodes(webpage,'.entry-date')

post_date_html <- html_nodes(webpage,'.published , .entry-title')
#Converting the post date to text
post_date <- html_text(post_date_html)

#Verify the date captured
post_date



url="www.imdb.com"

#Using the CSS selector (using ‘www.imdb.com’ website in this example)
rating_html=html_nodes(webpage,'.imdb-rating')   #’.imdb-rating’ is taken from CSS selector

#Converting the rating data to text
rating <- html_text(rating_html)

#Check the rating captured
rating

html <- read_html("http://www.imdb.com/title/tt1490017/")
cast <- html_nodes(html, "#titleCast .itemprop")
length(cast)
#> [1] 30
cast[1:2]


html <- read_html("http://www.imdb.com/title/tt1490017/")
cast <- html_nodes(html, ".quicklink")
length(cast)
#> [1] 15

html_text(cast)



url="https://www.timeshighereducation.com/world-university-rankings/2019/world-ranking#!/page/0/length/-1/sort_by/rank/sort_order/asc/cols/stats"
typeof(url)
length(url)
links= ".stats_female_male_ratio , .stats_pc_intl_students , .stats_student_staff_ratio , .stats_number_students , .ranking-institution-title"

html <- read_html("https://www.timeshighereducation.com/world-university-rankings/2019/world-ranking#!/page/0/length/-1/sort_by/rank/sort_order/asc/cols/stats")
cast <- html_nodes(html, ".stats_female_male_ratio")
length(cast)
#> [1] 30
cast[1:2]
cast
ranks <- html_nodes(url, ".ranking-institution-title")




library(rvest)

URL <- "https://www.soccerstats.com/latest.asp?league=netherlands" #Feed page

WS <- read_html (URL) #reads webpage into WS variable

URLs <- WS %>% html_nodes ("a:nth-child(1)") %>% html_attr("href")         %>% as.character() # Get the CSS nodes & extract the URLs 

URLs <- paste0("http://www.soccerstats.com/",URLs) 

oversdf <- data.frame(URLs=URLs)

rownames(oversdf)  #returns a vector of row names in the overs data.frame:

URLs <-subset(oversdf, grepl("pmatch", oversdf$URLs),stringsAsFactors       =       FALSE)

write.csv(URLs,file=paste(getwd(),"/sportURLs.csv",sep=""),row.names=FALSE)

Catcher1 <- data.frame(FMatch=character(),TotalGoals=character    (),stringsAsFactors = FALSE)

##################################
#start of workaround
n<-nrow(URLs)
URLs2<-character()
for (i in 1:n) {
  URLs2[i]<-as.character(URLs[i,1])
}


library(dplyr)
library(rvest)
web = read_html("https://news.google.com/?hl=en-IN&gl=IN&ceid=IN:en")

web %>% html_nodes(".VDXfz") %>% html_text()

library(rvest)
library(purr)
url_base =html("https://www.cochranelibrary.com/cdsr/table-of-contents/2018/11")
#map_df(1:4)

page = read_html(url_base)
page %>% data.frame(paper = html_text(html_nodes(".search-result-doi"))) %>% df4


url2 = "http://www.espncricinfo.com/india/content/player/28081.html"
library(rvest)
library(curl)
msd = read_html(url2)
msd

msd2 <- msd %>% html_nodes("table") %>% .[1] %>% html_table(fill=T)
msd2
str(msd2)

#-----
url3 = "https://www.timeshighereducation.com/world-university-rankings/2019/world-ranking#!/page/0/length/-1/sort_by/rank/sort_order/asc/cols/stats"
the = read_html(url3)
the

the3 <- the %>% html_nodes("table") %>% .[1] %>% html_table(fill=T)
the3
str(msd2)

html_