# Ad Views - Hitesh - May 18

dfTrain = read.csv(file.choose())
dfTest = read.csv(file.choose())

names(dfTrain)
names(dfTest)

#predict adview 
summary(dfTrain)
unique(dfTrain$adview)
table(dfTrain$adview)

table(dfTrain$duration)
#Extract Time duration in seconds
s1 = c("PT1H57M3S", "PT1H3M46S","PT1H33S","PT1H2M", "PT18S","PT18M9S", "PT1H39M22S")

library(tidyverse)
library(stringi)
out <- map2_df(stri_extract_all_regex(s1, "\\d+"), 
               stri_extract_all_regex(s1, "[HMS]"), ~ .x %>%
                 as.integer %>%
                 as.list %>% 
                 set_names(.y) ) 
out

out2 <- map2_df(stri_extract_all_regex(dfTrain$duration, "\\d+"), 
               stri_extract_all_regex(dfTrain$duration, "[HMS]"), ~ .x %>%
                 as.integer %>%
                 as.list %>% 
                 set_names(.y) ) 
out2
out2[is.na(out2)] <- 0
dfTrain1 = cbind(dfTrain, out2)
names(dfTrain1)
dfTrain1[,c('duration','H','M','S') ]
dfTrain1$totalTime = dfTrain1$H*60*60 + dfTrain1$M*60 + dfTrain1$S
dfTrain1[,c('duration','H','M','S', 'totalTime') ]

names(dfTrain1)
head(dfTrain1)
summary(dfTrain1)
apply(dfTrain,2, class)
# convert numeric columns 
dfTrain1$adview = as.numeric(dfTrain1$adview)
dfTrain1$views = as.numeric(dfTrain1$views)
dfTrain1$dislikes = as.numeric(dfTrain1$dislikes)

dfTrain1$likes = as.numeric(dfTrain1$likes)
dfTrain1$comment = as.numeric(dfTrain1$comment)
dfTrain1$published = as.Date(dfTrain1$published)
dfTrain1$dayspub = as.numeric(Sys.Date() - dfTrain1$published)
head(dfTrain1$dayspub)

head(dfTrain1$published)
head(dfTrain1)
summary(dfTrain1)
names(dfTrain1)
plot(y=dfTrain1$adview, x= dfTrain1[,3])
#pairs(c('adview','views','likes','dislikes','comment','totalTime','dayspub'), data=dfTrain1)
#car::scatterplot(c('adview','views','likes','dislikes','comment','totalTime','dayspub'), data=dfTrain1)
#pairs(~adview + views + likes + dislikes + comment + totalTime + dayspub,data=dfTrain1) 

library(rpart)
fit1 = rpart(adview ~ views + likes + dislikes + comment + category + totalTime + dayspub, data= dfTrain1, method='anova')
fit1
library(rpart.plot)

rpart.plot(fit1)
summary(dfTrain1$adview)
boxplot(dfTrain1$adview)
boxplot(dfTrain1$dayspub)


#ctree
library(party)
fit2 = ctree(adview ~ views + likes + dislikes + comment + category + totalTime + dayspub, data= dfTrain1)
fit2

print(fit2)
plot(fit2)
