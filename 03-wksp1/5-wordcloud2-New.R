#wordcloud2

#install.packages('wordcloud2')
library(wordcloud2)

?wordcloud2

df = data.frame(word=c('mdi','iim','imt'),freq=c(20,23,15))
df
wordcloud2(df)


head(demoFreq)
wordcloud2(demoFreq, size = 2, color = "random-light", backgroundColor = "grey")
names(demoFreq)
wordcloud2(demoFreq, size = 2, minRotation = -pi/2, maxRotation = -pi/2)
wordcloud2(demoFreq, size = 2, minRotation = -pi/6, maxRotation = -pi/6,   rotateRatio = 1)
wordcloud2(demoFreq, size = 2, minRotation = -pi/6, maxRotation = pi/6,    rotateRatio = 0.9)

wordcloud2(demoFreqC, size = 2,  color = "random-light", backgroundColor = "grey")
wordcloud2(demoFreqC, size = 2, minRotation = -pi/6, maxRotation = -pi/6,  rotateRatio = 1)

# Color Vector

colorVec = rep(c('red', 'skyblue'), length.out=nrow(demoFreq))
wordcloud2(demoFreq, color = colorVec, fontWeight = "bold")

wordcloud2(demoFreq,
           color = ifelse(demoFreq[, 2] > 20, 'red', 'skyblue'))
