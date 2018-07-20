# Text Mining
#Load Libraries
library(plyr)
library(ggplot2)
library(RColorBrewer)
library(wordcloud)
library(tm)
library(SnowballC)
library(NLP)

#Folder of text files
(cname = file.path("E:\\rwork\\rProjects\\analytics\\textdocs"))
dir(cname)
#Load texts into R
docs = Corpus(DirSource(cname))
summary(docs)
inspect(docs)

#Make a copy to see all through
docs1 = docs
docs2 = tm_map(docs1, removePunctuation )
docs3 = tm_map(docs2, removeNumbers)
docs4 = tm_map(docs3, tolower)
docs5 = tm_map(docs4, removeWords, stopwords('english'))
docs6 = tm_map(docs5, removeWords, c('brothers','sisters'))
docs7 = tm_map(docs6, stemDocument)
docs8 = tm_map(docs7, stripWhitespace)
docs8 = Corpus(VectorSource(docs8))
docs9 = tm_map(docs8, PlainTextDocument)# due to error
docs9 = Corpus(VectorSource(docs9))
dtm = DocumentTermMatrix(docs9)
dtm
tdm = TermDocumentMatrix(docs9)
tdm


# Frequency
freq  = colSums(as.matrix(dtm))
freq
length(freq)
dtms = removeSparseTerms(dtm, 0.1)
dtms
ord = order(freq)
ord

freq[head(ord)]
freq[tail(ord)]
freq2 = sort(colSums(as.matrix(dtm)), decreasing = T)
freq2
head(freq2, 14)
findFreqTerms(dtm, lowfreq = 4)
wf = data.frame(word=names(freq2), freq=freq2)
head(wf)

# Association
tm::findAssocs(dtms, 'student', corlimit=0.1)
tm::findAssocs(dtms, 'learn', corlimit=0.1)

#Plotting
p = ggplot2::ggplot(subset(head(wf,n=10), freq=3), aes(word, freq))
p = p + geom_bar(stat='identity')
p = p + theme(axis.text.x = element_text(angle=45, hjust=1))
p


#Word Cloud
#library(wordcloud)
set.seed(142)
wordcloud(names(freq2), scale=c(2,0.5), freq2, min.freq=2)
wordcloud(names(freq2), freq2,scale=c(2,0.5),  max.words=10)
wordcloud(names(freq2), freq2, min.freq=3, scale=c(2,0.5),
          colors=brewer.pal(6,'Dark2'))
dark2 = brewer.pal(6, 'Dark2')
par(mar=c(1,1,1,1))
#scale = c(4, 0.2) or with less words : max.words = 30
#gsub() longwords to shorter abbreviation
wordcloud(names(freq2), freq2, max.words=30, rot.per=0.2, 
          scale=c(2,0.5), colors=dark2)
head(freq2)

dtmss= removeSparseTerms(dtm, 0.68)
library(cluster)
d = dist(t(dtmss), method='euclidean')
fit = hclust(d=d, method='ward.D')
fit
plot(fit) # very not proper
groups = cutree(fit, k=5)
groups
rect.hclust(fit, k=5, border='red')

# Clustering
library(fpc)
d = dist(t(dtmss), method='euclidean')
kfit = kmeans(d, 2)
kfit
clusplot(as.matrix(d), kfit$cluster, color=T, shade=T, labels=2, lines=0)

