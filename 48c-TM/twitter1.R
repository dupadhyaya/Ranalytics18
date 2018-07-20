# twitter
library(twitteR)
library(ROAuth)
library(RCurl)
library(plyr)
library(stringr)
library(ggplot2)
library(digest)
library(rjson)
library(httr)
library(RJSONIO)
library(tm)
library(scales)
library(lubridate)
library(syuzhet)

options(httr_oauth_cache = T)
access_token='14366551-ymV6A8XM2aXcgGUYNLTBOxAuZGIRLinLb0uzzOYKe'
access_token_secret = 'VEmnsIvcIvfySEXD8eXKe1CLE3ZY7mMBwEIK9fB665SDe'
api_key='L2ch59MKPheK7FsSYFPL4oFdU'
api_secret = 'lvZyPxULK9HzI5CBgdXah5MoQFLsU2EQ6T0NND1FFBb40ovBdW'


#setup_twitter_oauth(consumer_Key, consumer_Secret, access_token, access_secret)
setup_twitter_oauth(api_key,api_secret,access_token, access_token_secret)

tweet = searchTwitter("#Demonitisation OR #Modi",n=500,since='2006-11-08')
view(tweet_df)
class(tweet)
tweet_df = twListToDF(tweet)
tweets.text = lapply(tweet,function(t) ....)

mycorpus = Corpus(VectorSource(tweets.text))
x = as.character(mycorpus)
str(mycorpus)
mycorpus1 = tm_map(mycorpus,stripWhitespace)
mycorpus2 = tm_map(mycorpus1,tolower)
mycorpus3 = tm_map(mycorpus2,removewords,stopwords('english'))
mycorpus4 = tm_map(mycorpus3,removePunctuation)
mycorpus5 = tm_map(mycorpus4,removeNumbers)
mycorpus6 = tm_map(mycorpus5,PlainTextDocument)
data_dtm1 = DocumentTermMatrix(mycorpus6)
inspect(data_dtm1)
frequent = findFreqTerms(data_dtm1,lowfreq=100,highfreq=Inf)
frequent

library(wordcloud)



#Sentimental Analysis
