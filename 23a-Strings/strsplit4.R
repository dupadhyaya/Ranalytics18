
library(gsheet)
url = "https://docs.google.com/spreadsheets/d/1M-sAZqHHyuzzwW7vUwXoCw2JVwUiWki7LdFCgAyOccc/edit#gid=1470469521"

df = as.data.frame(gsheet2tbl(url))
head(df)

df1 = df[,2:4]
head(df1)
unlist(strsplit(df1$name, "\n"))[1]
df2= vapply(strsplit(df1$name, "\n", fixed = TRUE), "[", "", 1)
head(df2,n=20)
strsplit(df2[1:20], "United Kingdom")
vapply(strsplit(df1[1:20], c("United Kingdom","United States"), fixed = TRUE), "[", "", 1)



word <- c('apple-orange-strawberry','chocolate')
sapply(strsplit(word, "-"), head, 1)

df3= head(df2)
head(df3); names(df3)
names(df3)
df3
df4 = data.frame(do.call(rbind, strsplit(df3, split = "United Kingdom")))
df4

word <- c('JNUIndia','IITIndia','OxfordUnited Kingdom','HarvardUSA')
strsplit(word, split=c('India'))
strsplit(word, split=c('United Kingdom'))
strsplit(word, split=c('India','United Kingdom'))
strsplit(word, split=c('India|United Kingdom|USA'))

sapply(strsplit(word, split=c('India|United Kingdom|USA')),head,1)
?sapply
vapply(strsplit(word,split=c('India|United Kingdom|USA'), fixed = F), "[", 1)

vapply(strsplit(word, split=c('India|United Kingdom|USA')), fixed = TRUE, "[", "", 1)

word2 <- c('JNU India','IIT India','Oxford UnitedKingdom','Harvard USA')

Split <- strsplit(word,split=c('India|United Kingdom|USA') , fixed = F)
Split
Dates <- sapply(Split, "[", 1)
Rates <- sapply(Split, "[", 2)
Dates
Rates

Split <- strsplit(word2, split=" " , fixed = F)
Split
Dates <- sapply(Split, "[", 1)
Rates <- sapply(Split, "[", 2)
Dates
Rates



sapply(strsplit(word, split=c("India")), head, 1)
?strsplit
       