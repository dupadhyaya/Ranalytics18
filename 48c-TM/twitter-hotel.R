#https://www.r-bloggers.com/mining-twitter-for-consumer-attitudes-towards-hotels/

#load twitter library
library(twitteR)
# search for all the hilton tweets
hilton.tweets=searchTwitter('@hilton',n=1500)
hilton.tweets=searchTwitter('@narendramodi',n=15)

hilton.tweets
length(hilton.tweets)
class(hilton.tweets)
tweet=hilton.tweets[[1]]
class(tweet)
tweet$getScreenName()
tweet$getText()

library("plyr")
hilton.text=laply(hilton.tweets,function(t)t$getText())
length(hilton.text)
head(hilton.text,5)
# load list of positive and negative words for SIMPLE sentiment analysis

# you would have to download the files from a website I included below - make sure you put in the directory that you will be
# referencing
hu.liu.pos=scan('/Users/marcinkulakowski/Downloads/r/positive-words.txt',what='character',comment.char=';')

hu.liu.neg=scan('/Users/marcinkulakowski/Downloads/r/negative-words.txt',what='character',comment.char=';')
pos.words=c(hu.liu.pos,'upgrade')
neg.words=c(hu.liu.neg,'wtf','wait','waiting','epicfail','mechanical')

# sampling
sample=c("You'reawesomeandIloveyou","Ihateandhateandhate.Soangry.Die!","Impressedandamazed:youarepeerlessinyourachievementofunparalleledmediocrity.")
score.sentiment = function(sentences, pos.words, neg.words, .progress='none')
{
  require(plyr)
  require(stringr)
  
  # we got a vector of sentences. plyr will handle a list
  # or a vector as an "l" for us
  # we want a simple array ("a") of scores back, so we use
  # "l" + "a" + "ply" = "laply":
  scores = laply(sentences, function(sentence, pos.words, neg.words) {
    
    # clean up sentences with R's regex-driven global substitute, gsub():
    sentence = gsub('[[:punct:]]', '', sentence)
    sentence = gsub('[[:cntrl:]]', '', sentence)
    sentence = gsub('\\d+', '', sentence)
    # and convert to lower case:
    sentence = tolower(sentence)
    
    # split into words. str_split is in the stringr package
    word.list = str_split(sentence, '\\s+')
    # sometimes a list() is one level of hierarchy too much
    words = unlist(word.list)
    
    # compare our words to the dictionaries of positive & negative terms
    pos.matches = match(words, pos.words)
    neg.matches = match(words, neg.words)
    
    # match() returns the position of the matched term or NA
    # we just want a TRUE/FALSE:
    pos.matches = !is.na(pos.matches)
    neg.matches = !is.na(neg.matches)
    
    # and conveniently enough, TRUE/FALSE will be treated as 1/0 by sum():
    score = sum(pos.matches) - sum(neg.matches)
    
    return(score)
  }, pos.words, neg.words, .progress=.progress )
  
  scores.df = data.frame(score=scores, text=sentences)
  return(scores.df)
}
> result=score.sentiment(sample,pos.words,neg.words)
> class(result)
[1] "data.frame"
> result$score
[1] 0 0 0
> hilton.scores=score.sentiment(hilton.text,pos.words,neg.words,.progress='text')
> hilton.scores$hotel='Hilton'
> hilton.scores$code='HL'
> hist(hilton.scores$score)
# hilton histogram
> library("ggplot2")
> qplot(hilton.scores$score)
# qplot hilton
# lets search for all other major hotels
# Intercontinental
intercontinental.tweets=searchTwitter('@intercontinental',n=1500)
class(tweet)
intercontinental.text=laply(intercontinental.tweets,function(t)t$getText())
intercontinental.scores=score.sentiment(intercontinental.text,pos.words,neg.words,.progress='text')
intercontinental.scores$hotel='Intercontinental'
intercontinental.scores$code='IC'
# Wyndham
wyndham.tweets=searchTwitter('@wyndham',n=1500)
class(tweet)
wyndham.text=laply(wyndham.tweets,function(t)t$getText())
wyndham.scores=score.sentiment(wyndham.text,pos.words,neg.words,.progress='text')
wyndham.scores$hotel='Wyndham'
wyndham.scores$code='WY'
# Marriott
marriott.tweets=searchTwitter('@marriott',n=1500)
class(tweet)
marriott.text=laply(marriott.tweets,function(t)t$getText())
marriott.scores=score.sentiment(marriott.text,pos.words,neg.words,.progress='text')
marriott.scores$hotel='Marriott'
marriott.scores$code='MI'
# BestWestern
bestwestern.tweets=searchTwitter('@bestwestern',n=1500)
class(tweet)
bestwestern.text=laply(bestwestern.tweets,function(t)t$getText())
bestwestern.scores=score.sentiment(bestwestern.text,pos.words,neg.words,.progress='text')
bestwestern.scores$hotel='Bestwestern'
bestwestern.scores$code='BW'
# Starwood
starwood.tweets=searchTwitter('@starwood',n=1500)
class(tweet)
starwood.text=laply(starwood.tweets,function(t)t$getText())
starwood.scores=score.sentiment(starwood.text,pos.words,neg.words,.progress='text')
starwood.scores$hotel='Starwood'
starwood.scores$code='SW'
# Hyatt
hyatt.tweets=searchTwitter('@hyatt',n=1500)
class(tweet)
hyatt.text=laply(hyatt.tweets,function(t)t$getText())
hyatt.scores=score.sentiment(hyatt.text,pos.words,neg.words,.progress='text')
hyatt.scores$hotel='Hyatt'
hyatt.scores$code='HY'
> all.scores=rbind(intercontinental.scores,wyndham.scores,hilton.scores,marriott.scores,bestwestern.scores,starwood.scores,hyatt.scores)
# Make separate plot for each hotel
> ggplot(data=all.scores)+#ggplotworksondata.frames,always
  geom_bar(mapping=aes(x=score,fill=hotel),binwidth=1)+
  facet_grid(hotel~.)+#makeaseparateplotforeachhotel
  theme_bw()+scale_fill_brewer()#plaindisplay,nicercolors
# Plot
> all.scores$very.pos=as.numeric(all.scores$score>=2)
> all.scores$very.neg=as.numeric(all.scores$score twitter.df=ddply(all.scores,c('hotel','code'),summarise,pos.count=sum(very.pos),neg.count=sum(very.neg))
                                 > twitter.df$all.count=twitter.df$pos.count+twitter.df$neg.count
                                 > twitter.df$score=round(100*twitter.df$pos.count/twitter.df$all.count)
                                 > install.packages("doBy")
                                 > library("doBy")
                                 > orderBy(~-score,twitter.df)
                                 hotel code pos.count neg.count all.count score
                                 1 Bestwestern BW 6 0 6 100
                                 5 Starwood SW 7 0 7 100
                                 6 Wyndham WY 2 0 2 100
                                 3 Hyatt HY 7 1 8 88
                                 2 Hilton HL 15 3 18 83
                                 4 Marriott MI 13 4 17 76
                                 > install.packages("XML")
                                 > library(XML)
                                 > acsi.url='http://www.theacsi.org/index.php?option=com_content&view=article&id=147&catid=&Itemid=212&i=Hotels'
                                 # scrape acsi website for scores
                                 > acsi.df=readHTMLTable(acsi.url,header=T,which=1,stringsAsFactors=F)
                                 > acsi.df=acsi.df[,c(1,18)]
                                 > head(acsi.df,1)
                                 > colnames(acsi.df)=c('hotel','score')
                                 > acsi.df$score=as.numeric(acsi.df$score)
                                 > View(acsi.df)


