# read json file

library(jsonlite)
zips <- stream_in(url("http://media.mongodb.org/zips.json"))
#If the server uses https, you can use the curl package:
str(zips)
  
library(jsonlite)
library(curl)
zips <- stream_in(curl("http://media.mongodb.org/zips.json"))

library(dplyr)
myJSON <- . %>% file(open="r") %>% stream_in()
myJSON('test.json')

df <- filename %>% file %>% stream_in

datasets <- lapply(res.clean[1:2, ], jsonlite::fromJSON)

#If each element is a data frame you can subsequently use
alldata <- jsonlite:: rbind_pages(datasets)




require(jsonlite)
id = "dup1966"
url = paste0("https://gdata.youtube.com/feeds/api/videos/", id, "?v=2&alt=json")
raw.data <- readLines(url, warn = "F")
rd <- fromJSON(raw.data)
term <- rd$entry$category$term[2]
label <- rd$entry$category$label[2]
title <- rd$entry$title
author <- rd$entry$author[1]
duration <- rd$entry$`media$group`$`media$content`$duration[1]