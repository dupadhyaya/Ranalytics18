# Lalit
# 

#Missing Values
item = c('item1', 'item2', 'item1', 'item1', 'item2')
rate = c(59, 60, NA, NA, NA)
class = c('fmcg','type2', 'type2', 'type1', NA)
df = data.frame(item,rate,class)
df

sum(is.na(df$rate))

aggregate(.~ item, df, FUN=NROW, na.rm=T, na.action=NULL)

aggregate(. ~ item, df, function(x) sum(x, na.rm=NULL), na.action = na.pass)

complete.cases(df)

sapply(df, function(x) sum(is.na(x)))

library(dplyr)
df %>%   group_by(item) %>% 
  summarise_each(funs(sum(., na.rm = NULL)))

library(tidyverse)
map(df, ~sum(is.na(.)))

#dplyr -----
library(dplyr)
df %>%
  select(everything()) %>%  # replace to your needs
  summarise_all(funs(sum(is.na(.))))

apply(df, MARGIN = 1, function(x) sum(is.na(x)))
apply(df, MARGIN = 2, function(x) sum(is.na(x)))

df %>% rowwise %>% summarise(NA_per_row = sum(is.na(.)))

#zoo ------
library(zoo)
na.aggregate(df, by=1,FUN=mean,na.rm = FALSE,maxgap = Inf)
df

(df2=na.aggregate(df[,1:2], by=list(item), FUN=first))
(df2=na.aggregate(df[,c('item','rate')], by=list(item), FUN=first))

df2
(df3=na.aggregate(df, by=list(item), FUN=first))
str(df3)
df3$rate = as.numeric(df3$rate)
str(df3)
na.aggregate(df, item)

#dplyr ------ for filter
library(dplyr)
df %>% tally()
df %>% count(item)
df %>% add_tally()
df %>% count(item, sort = TRUE)
df
df %>%  add_count(item) %>% filter(n >= 3)
df %>%  add_tally(class) %>% filter(n >= 1)


#dplyr & zoo -----
library("dplyr")
library("zoo")

df %>% group_by(item) %>% transmute(date=na.locf(rate, na.rm=FALSE))
df %>% group_by(item) %>% transmute(date=na.locf(class, na.rm=FALSE))

#data- table -----
require(data.table)
(dfT= setDT(df))   ## change it to data.table in place
setkey(dfT, item)     ## needed for fast join
dfT.woNA <- dfT[!is.na(rate)]  ## version without the NA rows
dfT.woNA
# rolling self-join will return what you want
dfT.woNA[dfT$item, roll=TRUE]  ## will match previous if not found

#Plyr ---------------

impute <- function(x, fun) {
  missing <- is.na(x)
  replace(x, missing, fun(x[!missing]))
}
library(plyr)
plyr::ddply(df, ~ item, transform, rate = impute(rate, first))
plyr::ddply(df, ~ item, transform, class = impute(class, first))


# aggreage ----
count_zero<-function(x){
  sum(x==60,na.rm=TRUE)
}
aggregate(df[,-1],list(df$item),count_zero)

df
count_NA<-function(x){
  sum(is.na(x),na.rm=F)
}
aggregate(df[,-1],list(df$item),count_NA)
df


df %>% group_by(item) %>% summarise(rateNA=sum(is.na(rate)),  classNA=sum(is.na(class)))
#%>% arrange(desc(rateNA))


library(magrittr)
aggregate(df,list(df$item), . %>% is.NA %>% sum(na.rm=F))



#filter - dplyr
filter(df, item == "item1")
select(df, item, class)
df %>% filter(item == "item1"  | "item2") %>%  select(item, rate)

df %>%  mutate(rate = first(rate)) %>%  filter(is.na(class)) %>%  head
detach("package:plyr", unload=TRUE)
library(dplyr)
df %>% group_by(rate) %>%  summarize(n=n())          

aggregate(df$rate, by=list(item, rate), FUN=length, na.action='keep')


library(visdat)
vis_miss(df)

library(Amelia)
missmap(df)

row.has.na <- apply(df, 1, function(x){any(is.na(x))})
row.has.na

df
df %>% mutate(condition = complete.cases(select(., item:class)))
df %>% mutate(condition = complete.cases(select(., class)))







cat = c('small', 'medium',NA, NA)
type = c('Grocery', NA,'SM1','SM1')
tier = c('T1','T2',NA,'T2')
df5 = data.frame(cat, type, tier)
df5
is.na(df5)
vis_miss(df5)


df
df$gender = c(rep('NA',5))
df
df[item=='item1' & class=='type1',]
df[item=='item1' & class=='type1',]
df$gender[ item=='item1' | class=='type1'] = 'Male'
df
df %>% filter(item=='item1')
df[1:2,3:4]
df
