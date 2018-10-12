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

library(rattle)
library(rpart.plot)
library(RColorBrewer)
fancyRpartPlot(mytree)

#decision tree correctly identified that if a claim involved a rear-end collision, the claim was most likely fraudulent.

#By default, rpart uses gini impurty to select splits when performing classification. (If you’re unfamiliar with this metric, read this article.) You can use information gain instead by specifying it in the parms parameter.
#https://gormanalysis.com/magic-behind-constructing-a-decision-tree/

mytree <- rpart(Fraud ~ RearEnd, data = train, method = "class", parms = list(split = 'information'), minsplit = 2, minbucket = 1)
mytree

train <- data.frame(ClaimID = c(1,2,3),  RearEnd = c(TRUE, FALSE, TRUE),  Fraud = c(TRUE, FALSE, FALSE))
train

mytree <- rpart(Fraud ~ RearEnd, data = train, method = "class", minsplit = 2, minbucket = 1)
mytree
rpart.plot(mytree)
#Once again we’re left with just a root node. Internally, rpart keeps track of something called the complexity of a tree. The complexity measure is a combination of the size of a tree and the ability of the tree to separate the classes of the target variable. If the next best split in growing a tree does not reduce the tree’s overall complexity by a certain amount, rpart will terminate the growing process. This amount is specified by the complexity parameter, cp, in the call to rpart. Setting cp to a negative amount ensures that the tree will be fully grown.

mytree <- rpart(Fraud ~ RearEnd, data = train, method = "class", minsplit = 2, minbucket = 1, cp=-1)

fancyRpartPlot(mytree)

#This is not always a good idea since it will typically produce over-fitted trees, but trees can be pruned back as discussed later in this article.

#You can also weight each observation for the tree’s construction by specifying the weights argument to rpart.

train
mytree <- rpart(Fraud ~ RearEnd, data = train, method = "class", minsplit = 2, minbucket = 1, weights = c(.4, .4, .2))
mytree
fancyRpartPlot(mytree)

#One of the best ways to identify a fraudulent claim is to hire a private investigator to monitor the activities of a claimant. Since private investigators don’t work for free, the insurance company will have to strategically decide which claims to investigate. To do this, they can use a decision tree model based off some initial features of the claim. If the insurance company wants to aggressively investigate claims (i.e. investigate a lot of claims), they can train their decision tree in a manner that will penalize incorrectly labeled fraudulent claims more than it penalizes incorrectly labeled non-fraudulent claims.

#To alter the default, equal penalization of mislabeled target classes set the loss component of the parms parameter to a matrix where the (i,j) element is the penalty for misclassifying an i as a j. (The loss matrix must have 0s in the diagonal). For example, consider the following training data.

train <- data.frame(ClaimID = c(1,2,3,4,5,6,7), RearEnd = c(TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE), Whiplash = c(TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE),Fraud = c(TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE))
train
#grow our decision tree, restricting it to one split by setting the maxdepth argument to 1.

mytree <- rpart(Fraud ~ RearEnd + Whiplash, data = train, method = "class", maxdepth = 1, minsplit = 2, minbucket = 1)
mytree
fancyRpartPlot(mytree)

#rpart has determined that RearEnd was the best variable for identifying a fraudulent claim. BUT there was one fraudulent claim in the training set that was not the case of a rear-end collision. If the insurance company wants to identify a high percentage of fraudulent claims without worrying too much about investigating non-fraudulent claims they can set the loss matrix to penalize claims incorrectly labeled as fraudulent three times less than claims incorrectly labeled as non-fraudulent.

lossmatrix <- matrix(c(0,1,3,0), byrow=TRUE, nrow=2)
lossmatrix

mytree <- rpart(Fraud ~ RearEnd + Whiplash, data = train, method = "class", maxdepth = 1, minsplit = 2, minbucket = 1,parms = list(loss = lossmatrix))
fancyRpartPlot(mytree)
#Now our model suggests that Whiplash is the best vairable to identify fraudulent claims. What I just described is known as an error measure and its up to the discretion of the insurance company to decide on it.
#http://work.caltech.edu/library/042.html


#Now let’s see how rpart interacts with factor variables. Suppose the insurance company hires an investigator to assess the activity level of claimants. Activity levels can be Very Active, Active, Inactive, or Very Inactive.

train <- data.frame(ClaimID = c(1,2,3,4,5,6,7,8,9,10),RearEnd = c(TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE), Whiplash = c(TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, TRUE),  Activity = factor(c("active", "very active", "very active", "inactive", "very inactive", "inactive", "very inactive", "active", "active", "very active"),levels=c("very inactive", "inactive", "active", "very active"), ordered=TRUE),Fraud = c(FALSE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, TRUE))
train

#Grow a full tree
mytree <- rpart(Fraud ~ RearEnd + Whiplash + Activity, data = train, method = "class", minsplit = 2, minbucket = 1, cp=-1)

fancyRpartPlot(mytree)
# view the importance of each variable in the model by calling the variable.importance attribute of the resulting rpart object. From the rpart documentation, “An overall measure of variable importance is the sum of the goodness of split measures for each split for which it was the primary variable…”
mytree$variable.importance
#When rpart grows a tree it performs 10-fold cross validation on the data. To see the cross validation results use the printcp() function.
printcp(mytree)
#The rel error of each iteration of the tree is the fraction of mislabeled elements in the iteration relative to the fraction of mislabeled elements in the root. In this example, 50% of training cases are fraudulent. The first splitting criteria is “Is the claimant very active?”, which separates the data into a set of three cases, all of which are fraudulent and a set of seven cases of which two are fraudulent. Labeling the cases at this point would produce an error rate of 20% which is 40% of the root node error rate (i.e. it’s 60% better). The cross validation error rates and standard deviations are displayed in the columns xerror and xstd respectively.

#As a rule of thumb, it’s best to prune a decision tree using the cp of smallest tree that is within one standard deviation of the tree with the smallest xerror. In this example, the best xerror is 0.4 with standard deviation .25298. So, we want the smallest tree with xerror less than 0.65298. This is the tree with cp = 0.2, so we’ll want to prune our tree with a cp slightly greater than than 0.2.

mytree <- prune(mytree, cp=.21)

fancyRpartPlot(mytree)

#use our decision tree to predict fraudulent claims on an unseen dataset using the predict() function.

test <- data.frame(ClaimID = c(1,2,3,4,5,6,7,8,9,10),RearEnd = c(FALSE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE), Whiplash = c(FALSE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, TRUE), Activity = factor(c("inactive", "very active", "very active", "inactive", "very inactive", "inactive", "very inactive", "active", "active", "very active"),levels=c("very inactive", "inactive", "active", "very active"),  ordered=TRUE))
test

test$FraudClass <- predict(mytree, newdata = test, type="class") #Returns the predicted class
test$FraudProb <- round(predict(mytree, newdata = test, type="prob"),2) #Returns a matrix of predicted probabilities
test
