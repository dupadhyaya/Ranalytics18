#Twitter 1 - Working using my Keys
library("curl")
library("twitteR")
library("ROAuth")

download.file(url="http://curl.haxx.se/ca/cacert.pem",destfile="cacert.pem")

#different for each account
consumerKey="uRDuync3BziwQnor1MZFBKp0x"
consumerSecret="t8QPLr7RKpAg4qa7vth1SBsDvoPKawwwdEhNRjdpY0mfMMdRnV"
AccessToken="14366551-Fga25zWM1YefkTb2TZYxsrx2LVVSsK0uSpF08sugW"
AccessTokenSecret="3ap8BZNVoBhE2GaMGLfuvuPF2OrHzM3MhGuPm96p3k6Cz"

#Commont for all accounts except the keys

cred <- OAuthFactory$new(consumerKey=consumerKey, consumerSecret=consumerSecret, requestURL='https://api.twitter.com/oauth/request_token', accessURL='https://api.twitter.com/oauth/access_token', authURL='https://api.twitter.com/oauth/authorize')


cred$handshake(cainfo="cacert.pem") # it will take browser
save(cred, file="twitter authentication.Rdata") # store this to avoid asking again


#Load saved authentication cert
load("twitter authentication.Rdata")
#registerTwitterOAuth(cred)

setup_twitter_oauth(consumerKey, consumerSecret, AccessToken, AccessTokenSecret)

search.string <- "#businessanalytics"
no.of.tweets <- 100

tweets <- searchTwitter(search.string, n=no.of.tweets,lang="en")
tweets
