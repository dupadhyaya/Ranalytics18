# Sentiment analysis

library(tidytext)
sentiments
get_sentiments("afinn")
get_sentiments("bing")
get_sentiments("nrc")

#install.packages("janeaustenr")
library(dplyr)
library(stringr)

tidy_books <- austn_books() %>% group_by(book) %>% mutate(linenumber= row_number() )
