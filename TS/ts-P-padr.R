# PADR package

library(tidyverse)

library(padr)
top12 <- emergency %>% count(title) %>% arrange(desc(n)) %>% slice(1:12) %>% 
  select(title) %>% inner_join(emergency)
top12
head(emergency)
?emergency

top12 %>% thicken('month', col = 'month') %>% 
  count(title, month) %>%  ggplot(aes(month, n)) +  geom_bar(aes(fill = title), 
           col = "black", stat = 'identity',   position = "fill")

hourly_distribution <- top12 %>% thicken('hour') %>% 
  count(title, time_stamp_hour) %>% 
  pad(group = 'title') %>% fill_by_value(n) 

hourly_distribution

names(df)
df %>% thicken('hour') %>% sum('value') %>% pad(group='household_id')
