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
chaidModel <- chaid(vote3 ~ ., data = sample1, control=chaid_control(minbucket = 20, minsplit=7, minprob=0))
print(chaidModel)
plot(chaidModel)

