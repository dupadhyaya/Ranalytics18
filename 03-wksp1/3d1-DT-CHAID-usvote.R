#CHAID - dataset USvote #multisplit
# require(rsample) # for dataset and splitting also loads broom and tidyr
#install.packages("CHAID", repos="http://R-Forge.R-project.org")
library(CHAID)  #library for performing CHAID decision tree

#Dataset
data(USvote)  #from lib CHAID
?USvote

#Quick CHAID analysis
set.seed(101)
sample1 = USvote[sample(1:nrow(USvote), 1000),]
head(sample1)
str(sample1)
chaidModel <- chaid(vote3 ~ ., data = sample1, control=chaid_control(minbucket = 10, minsplit=20, minprob=0))

?chaid
print(chaidModel)
plot(chaidModel)
sample1 %>% filter(marstat=='married') %>% tally()
#sample1 %>% filter(ager=='18-24') %>% tally
dim(sample1)
chaidModel2 <- chaid(vote3 ~ ., data = sample1, control=chaid_control(minbucket = 20, minsplit=20, minprob=0, maxheight=2))
plot(chaidModel2) 

#Summary
#More than 2 splits
#used in Marketing / Business 
#Net Promoter Score, Feedback, Where all variables are categories