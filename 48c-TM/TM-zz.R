#text mining

library(tidytext)

sentiments
get_sentiments("afinn")
?get_sentiments

get_sentiments("bing")



library(janeaustenr)
library(dplyr)
library(stringr)

tidy_books <- austen_books() %>%
  group_by(book) %>%
  mutate(linenumber = row_number(),
         chapter = cumsum(str_detect(text, regex("^chapter [\\divxlc]", ignore_case = TRUE)))) %>%
  ungroup() %>%
  unnest_tokens(word, text)
#https://www.tidytextmining.com/tidytext.html

