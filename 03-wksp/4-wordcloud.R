# Word Cloud

##http://dni-institute.in/blogs/colorful-word-cloud-using-r/
# tm for text mining
# SnowballC for text stemming
# wordcloud for generating word cloud images
# RCurl and XML packages to download and parse web pages
# RColorBrewer for color palettes

library(wordcloud)
library(RColorBrewer)
library(SnowballC)
library(RCurl)
library(XML)
library(tm)

source('http://www.sthda.com/upload/rquery_wordcloud.r')
#or
#source('./TM/rquery_wordcloud.R')
filePath <- "http://www.sthda.com/sthda/RDoc/example-files/martin-luther-king-i-have-a-dream-speech.txt"
#filePath2 <- "./data/martin-luther-king-i-have-a-dream-speech.txt"

res<-rquery.wordcloud(filePath, type ="file", lang = "english")
#res<-rquery.wordcloud(filePath2, type ="file", lang = "english")

