drinks = data.frame(ingredient=c('amulya', 'pepsi',
                                'maaza','vodka'), sweetness=c(7,9,4,2), fizziness=c(8,1,8,1),
                   type=c('energy', 'health','cold','hard'))
                   
dist()

url <- "http://www.worldatlas.com/articles/largest-cities-in-europe-by-population.html"
tbls_xml <- readHTMLTable(url)
library(RCurl)
library(rjson)
library(XML)
library(rvest)
library(plyr)
tbls_xml
tbls_read <- url %>% html_nodes("table") %>% html_table(fill = TRUE)
tbls <- html_nodes(url, "table")
####################
#                  #
#    Exercise 1    #
#                  #
####################

url <- getURL("https://raw.githubusercontent.com/VasTsak/r-exercises-dw/master/part-1/data.csv")

####################
#                  #
#    Exercise 2    #
#                  #
####################

csv_file <- read.csv(text = url)

####################
#                  #
#    Exercise 3    #
#                  #
####################

url <- getURL("https://raw.githubusercontent.com/VasTsak/r-exercises-dw/master/part-2/data.txt")

txt_file <- read.table(text = url)
txt_file
####################
#                  #
#    Exercise 4    #
#                  #
####################

url <- getURL("https://raw.githubusercontent.com/VasTsak/r-exercises-dw/master/part-2/data.json")

json_file <- fromJSON(url)

####################
#                  #
#    Exercise 5    #
#                  #
####################

url <- getURL("https://raw.githubusercontent.com/VasTsak/r-exercises-dw/master/part-2/data.xml")
xml_file <- ldply(xmlToList(url), data.frame)

####################
#                  #
#    Exercise 6    #
#                  #
####################

url <- read_html("http://www.worldatlas.com/articles/largest-cities-in-europe-by-population.html")

####################
#                  #
#    Exercise 7    #
#                  #
####################

tbls <- html_nodes(url, "table")
tbls
####################
#                  #
#    Exercise 8    #
#                  #
####################

tbls_read <- url %>%
  html_nodes("table") %>%
  html_table(fill = TRUE)
tbls_read
####################
#                  #
#    Exercise 9    #
#                  #
####################

url <- "http://www.worldatlas.com/articles/largest-cities-in-europe-by-population.html"
tbls_xml <- readHTMLTable(url)

####################
#                  #
#    Exercise 10   #
#                  #
####################

df_pop <- htmltab(doc = url, which = "//th[text() = 'Rank']/ancestor::table")
