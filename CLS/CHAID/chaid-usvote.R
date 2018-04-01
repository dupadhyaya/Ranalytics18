#CHAID1

### fit tree to
###  subsample
USvote
library(CHAID)
set.seed(290875)
data(USvote)
attach(USvote)
?USvote
head(USvote)
str(USvote)
names(USvote)
summary(USvote)
dim(USvote)
USvoteS = USvote[sample(1:nrow(USvote), 1000),]

ctrl <- chaid_control(minsplit = 20, minbucket = 5, minprob = 0)

chaidUS <- chaid(vote3 ~ ., data = USvoteS, control = ctrl)

?chaid
summary(chaidUS)
print(chaidUS)
plot(chaidUS)

chaidUS2 <- chaid(vote3 ~ ., data = USvoteS, control = ctrl)

summary(chaidUS2)
print(chaidUS2)
plot(chaidUS2)

# aggregation
unique(USvote$vote3)
plyr::count(USvote, c('gender','vote3'))
plyr::count(USvote, c('marstat','vote3'))
(t1=ftable(USvote$vote3, USvote$gender))
(t2=ftable(USvote$vote3, USvote$marstat))
(t3=ftable(USvote$vote3, USvote$educr))
prop.table(t2)
prop.table(t3)
?chisq.test

chisq.test(t3)

#https://select-statistics.co.uk/blog/chaid-chi-square-automatic-interaction-detector/
  

#selecting the best variable
names(USvote)
dplyr::count(USvote, vote3 , gender)
library(dplyr)
USvote %>% count(vote3, gender)
USvote %>% group_by(vote3, gender) %>%  summarise(number = n())
USvote %>% group_by(vote3, gender) %>%  tally()


(t1=ftable(USvote$vote3, USvote$gender))
(t2=ftable(USvote$vote3, USvote$ager))
(t3=ftable(USvote$vote3, USvote$empstat))
(t4=ftable(USvote$vote3, USvote$educr))
(t4=ftable(USvote$vote3, USvote$marstat))
chisq.test(t1)

library(EnQuireR)
data(tea)
chisq.desc(tea,c(1,2),c(3,4))

chisq.desc(tea,c(1,2),c(3,4),report=TRUE)