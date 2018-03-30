# Data Manipulation using tidyr
#
salesd = sales
library(dplyr)
tbl_df(salesd) # convert to tbl class

glimpse(salesd)  # dense summary of tbl data

View(salesd) # spreasheet like format

salesd %>% group_by(daywk) # no summary till formula

salesd %>% group_by(daywk) %>% summarise(avg=mean(cakes)) %>% arrange(avg)

summarise_each(salesd, funs(mean))
count(salesd, cookies)

#Grouping  # need to use function to do some action
group_by(salesd, daywk)
salesd %>% group_by(daywk) %>%  summarise(avg = mean(cookies))


#Reshaping
#spread
head(tidyr::separate(data= salesd, col=sdate, into= c('y','m','d'), sep='-'))
head(tidyr::unite(data=salesd[,c('sdate','daywk')] , col='New Column',sep='::'), remove=T)
names(salesd)
head(tidyr::spread(salesd[1:5,c('sdate','pies','daywk')],sdate, pies, drop=T, fill='NoSale' ))
head(tidyr::spread(salesd[1:5,c('sdate','pies')],sdate, pies, drop=T, fill='NoSale' ))



dplyr::arrange(salesd, daywk)
head(salesd)


#Filter
dplyr::filter(salesd, daywk == 'Thursday')

dplyr::filter(salesd, cakes > 100 & pies < 40)

#mutate
mutate(salesd, incpies = pies * 1.5)  %>% filter(incpies > 90)
