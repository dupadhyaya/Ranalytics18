#Seperate using dplry
#http://cmdlinetips.com/2018/03/how-to-split-text-in-a-column-in-data-frame-in-r/

#’s separate function is the best option to separate a column or split a column of text the way you want. Let us see some simple examples of using tidyr’s separate function.

library(dplyr)
library(tidyr)
df <- data.frame(file_name = c("1_jan_2018.csv",
                               "2_feb_2018.csv", 
                               "3_mar_2018.csv"))

df
df %>% separate(file_name, c("ID", "Month","Year", "rest"))
#tidyr automatically found that the delimiters are underscore and dot and separted the single column to four columns with the names specified

df %>% separate(file_name,c("ID", "Month","Year"))
#want only part of text in a column.

df %>% separate(file_name, 
                c("ID", "Month","Year"),
                extra='drop')

df %>% tidyr::separate(file_name, 
                       c("ID"), extra='drop')

df %>%   tidyr::separate(file_name, c("ID", "Month","Year"),extra='drop') %>%   select('Month')


df %>%  tidyr::separate(file_name, c("ID", "Month","Year"), extra='drop') %>%
  tidyr::unite('ID_Month',c('ID','Month'))
