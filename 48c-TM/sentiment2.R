#Sentiment Analysis

#https://cran.r-project.org/web/packages/SentimentAnalysis/SentimentAnalysis.pdf

library(SentimentAnalysis)

## Not run:
library(tm)
# via vector of strings
corpus <- c("Positive text", "Neutral but uncertain text", "Negative text")
sentiment <- analyzeSentiment(corpus)
sentiment
compareToResponse(sentiment, c(+1, 0, -2))
# via Corpus from tm package
data("crude")
crude

sentiment <- analyzeSentiment(crude)
sentiment
# via DocumentTermMatrix (with stemmed entries)
dtm <- DocumentTermMatrix(VCorpus(VectorSource(c("posit posit", "negat neutral"))))
sentiment <- analyzeSentiment(dtm)
sentiment


d1 <- SentimentDictionary(c("uncertain", "possible", "likely"))
d2 <- SentimentDictionary(c("rather", "intend", "likely"))
cmp <- compareDictionaries(d1, d2)


documents <- c("This is a test", "an one more")
# count words (without stopwords)
countWords(documents)
# count all words (including stopwords)
countWords(documents, removeStopwords=FALSE)
