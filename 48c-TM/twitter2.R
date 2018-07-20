# Twitter 1

# install.packages("RColorBrewer")
# install.packages("tm")
# install.packages("wordcloud")
# install.packages('base64enc')
# install.packages('ROAuth')
# install.packages('plyr')
# install.packages('stringr')
# install.packages("openssl")
#install.packages("httpuv")
install.packages('twitteR')
library(openssl)
library(httpuv)
library(RColorBrewer)
library(wordcloud)
library(tm)
library(twitteR)
library(ROAuth)
library(plyr)
library(stringr)
library(base64enc)


download.file(url='http://curl.haxx.se/ca/cacert.pem', destfile='cacert.pem')

reqURL = 'https://api.twitter.com/oauth/request_token'
accessURL = 'https://api.twitter.com/oauth/access_token'
authURL = 'https://api.twitter.com/oauth/authorize'



#Extract  / error
dubatweets1 = searchTwitter(' #businessanalytics', n=3000, lang='en')

#Setup accesstoken for this session

#Copy keys from Twitter Account
consumerKey = 'uRDuync3BziwQnor1MZFBKp0x'
consumerSecret = 't8QPLr7RKpAg4qa7vth1SBsDvoPKawwwdEhNRjdpY0mfMMdRnV'
setup_twitter_oauth(consumerKey, consumerSecret)


cred <- ROAuth::OAuthFactory$new(consumerKey=consumerKey, consumerSecret=consumerSecret, requestURL=reqURL, accessURL=accessURL, authURL=authURL)  #ok

install.packages("openssl")
install.packages("httpuv")


setup_twitter_oauth(consumerKey, consumerSecret)
setup_twitter_oauth(api_key, api_secret, access_token, access_token_secret, access_token=NULL, access_secret=NULL)


cred$handshake(cainfo = system.file('CurlSSL', 'cacert.pem', package = 'RCurl'))

# goto web browser - and authorise - note the key and paste it in 

save(cred, file='twitterauthentication.Rdata')
load('twitterauthentication.Rdata') 
setup_twitter_oauth(cred)

dubatweets1 = searchTwitter(' #businessanalytics', n=3000, lang='en')
setup_twitter_oauth(consumerKey,consumerSecret, accessToken=consumerKey, accessTokenSecret=consumerSecret)
