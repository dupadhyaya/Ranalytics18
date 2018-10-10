#DT using Rpart
#https://gormanalysis.com/decision-trees-in-r-using-rpart/

#define a problem. There’s a common scam amongst motorists where a person will slam on his breaks in heavy traffic with the intention of being rear-ended. The person will then file an insurance claim for personal injury and damage to his vehicle, alleging that the other driver was at fault. Suppose we want to predict which of an insurance company’s claims are fraudulent using a decision tree

train <- data.frame(ClaimID = c(1,2,3), RearEnd = c(TRUE, FALSE, TRUE), Fraud = c(TRUE, FALSE, TRUE))

train

library(rpart) #load the rpart package

mytree <- rpart(Fraud ~ RearEnd, data = train, method = "class")
mytree
#output shows only a root node. This is because rpart has some default parameters that prevented our tree from growing. Namely: minsplit and minbucket. minsplit is “the minimum number of observations that must exist in a node in order for a split to be attempted” and minbucket is “the minimum number of observations in any terminal node”. See what happens when we override these parameters.

mytree <- rpart(Fraud ~ RearEnd, data = train, method = "class", minsplit = 2, minbucket = 1)
mytree
