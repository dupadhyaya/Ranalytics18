
#https://data.metinyazici.org/2017/10/working-with-web-data-in-r.html

library(jsonlite)

chocolate_brands <- c('
[ { "name" : "Dove Bar","founded" : 1956},
  { "name" : "Toblerone", "founded" : 1908}
]')
chocolate_brands

choco_json <- fromJSON(chocolate_brands, simplifyVector = F) # parse that with fromJSON()
print(choco_json)

library(dplyr)
name <- choco_json %>%  bind_rows %>% select(name, founded)
print(name)


