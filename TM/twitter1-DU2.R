# Use Existing Twitter Authentication Stored
# Marketing Analytics


library("twitteR")
library("ROAuth")

# Certificate not Required
#load("twitter authentication.Rdata")

AccessToken="14366551-Fga25zWM1YefkTb2TZYxsrx2LVVSsK0uSpF08sugW"
AccessTokenSecret="3ap8BZNVoBhE2GaMGLfuvuPF2OrHzM3MhGuPm96p3k6Cz"
ConsumerKey="uRDuync3BziwQnor1MZFBKp0x"
ConsumerSecret="t8QPLr7RKpAg4qa7vth1SBsDvoPKawwwdEhNRjdpY0mfMMdRnV"

load("twitter authentication.Rdata")
#registerTwitterOAuth(cred)

setup_twitter_oauth(ConsumerKey, ConsumerSecret, AccessToken, AccessTokenSecret)

search.string <- "#marketinganalytics"
no.of.tweets <- 100

tweets <- searchTwitter(search.string, n=no.of.tweets,lang="en")
tweets


homeTimeline(n=15)
mentions(n=15)
