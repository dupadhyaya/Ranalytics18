# World Cloud
#http://stat.ethz.ch/R-manual/R-devel/library/base/html/strsplit.html
#https://stackoverflow.com/questions/4350440/split-a-column-of-a-data-frame-to-multiple-columns

library(stringr)
library(wordcloud)
library(RColorBrewer)
library(tm)
library(SnowballC)
library(RCurl)
library(XML)



#How to use strsplit
strsplit('IIT-Gawahati', "-")
strsplit('IIT Gawahati', " ")

library(gsheet)
url = 'https://docs.google.com/spreadsheets/d/1_GQ-h4bgdNlIxcAanwRp_ak1u3JoWI-Vx2HKYj4FstA/edit#gid=0'
#check for dashtype, they are not always same
df1 = as.data.frame(gsheet2tbl(url))
df1
head(df1)
df1$wordexplanation
base::strsplit(df1$wordexplanation,'-')  #output as list need in DF

#Different Methods split and put in dataframe objects

#Stringr - str_split
stringr::str_split('IIT-Guwahati', "-")

#Method
(out1 = strsplit(as.character('IIT - Guwahati'),'-')) #if the word was not character
head(df1)
out = strsplit(df1$wordexplanation,'-') 
head(out)

t(sapply(out[1:5], '['))
df2=data.frame(t(sapply(out[1:200], '[')))

head(df2)
df= cbind(df1,df2)
head(df)
names(df)[c(2,3)] = c('word','explanation') #rename columns
head(df)

# create random frequencies for all words in a col
df$freq = floor(runif(100, 1,100))
head(df)

#Method for word cloud
library(wordcloud)
wc1 = wordcloud(df$word, df$freq, random.order=T)
wc2 = wordcloud(df$word, df$freq, random.order=F, colors = topo.colors(10))
wc3 = wordcloud(df$word, df$freq, scale=c(4,.1), min.freq=2, max.words=50,  random.order=F)
wc4 = wordcloud(df$word, df$freq, scale=c(4,.1), random.order=F)


#------

library(RColorBrewer)
library(tm)
pal <- brewer.pal(8,"Dark2")
wc5 = wordcloud(df$word, df$freq, scale=c(4,.1), random.order=F, colors=pal)


#load the function rquery.wordcloud
source('http://www.sthda.com/upload/rquery_wordcloud.r')

res <- rquery.wordcloud(filePath, type ="file", lang = "english",min.freq = 1,  max.words = 200)

# Reds color palette
res <- rquery.wordcloud(filePath, type ="file", lang = "english",colorPalette = "Reds")
# RdBu color palette
res <- rquery.wordcloud(filePath, type ="file", lang = "english", colorPalette = "RdBu")
# use unique color
res<-rquery.wordcloud(filePath, type ="file", lang = "english",  colorPalette = "black")


tdm <- res$tdm
freqTable <- res$freqTable
# Show the top10 words and their frequency
head(freqTable, 10)

# Bar plot of the frequency for the top10
barplot(freqTable[1:10,]$freq, las = 2, 
        names.arg = freqTable[1:10,]$word,
        col ="lightblue", main ="Most frequent words",
        ylab = "Word frequencies")

findFreqTerms(tdm, lowfreq = 4)

findAssocs(tdm, terms = "freedom", corlimit = 0.3)

url = "http://www.sthda.com/english/wiki/create-and-format-powerpoint-documents-from-r-software"
rquery.wordcloud(x=url, type="url")

