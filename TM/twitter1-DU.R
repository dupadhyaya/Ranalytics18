#Twitter 1 - Working using my Keys
library("curl")
library("twitteR")
library("ROAuth")

download.file(url="http://curl.haxx.se/ca/cacert.pem",destfile="cacert.pem")

ConsumerKey="uRDuync3BziwQnor1MZFBKp0x"
ConsumerSecret="t8QPLr7RKpAg4qa7vth1SBsDvoPKawwwdEhNRjdpY0mfMMdRnV"

cred <- OAuthFactory$new(consumerKey=consumerKey,
  consumerSecret=consumerSecret,
  requestURL='https://api.twitter.com/oauth/request_token',
  accessURL='https://api.twitter.com/oauth/access_token',
  authURL='https://api.twitter.com/oauth/authorize')


cred$handshake(cainfo="cacert.pem")
save(cred, file="twitter authentication.Rdata")

AccessToken="14366551-Fga25zWM1YefkTb2TZYxsrx2LVVSsK0uSpF08sugW"
AccessTokenSecret="3ap8BZNVoBhE2GaMGLfuvuPF2OrHzM3MhGuPm96p3k6Cz"

load("twitter authentication.Rdata")
registerTwitterOAuth(cred)

setup_twitter_oauth(ConsumerKey, ConsumerSecret, AccessToken, AccessTokenSecret)

search.string <- "#businessanalytics"
no.of.tweets <- 100

tweets <- searchTwitter(search.string, n=no.of.tweets,lang="en")
tweets
