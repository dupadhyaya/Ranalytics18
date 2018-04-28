# CART Models - HH Case Study

library(rpart)
library(rpart.plot)
library(forecast)

library(gsheet)
url='https://docs.google.com/spreadsheets/d/1PWWoMqE5o3ChwJbpexeeYkW6p4BHL9hubVb1fkKSBgA/edit#gid=1941519952'
data1 = as.data.frame(gsheet2tbl(url))
str(data1)

#data2 = read.csv(file.choose(), header = T)

Mer_Sales = data1

# Summarize the dataset
summary(Mer_Sales)
names(Mer_Sales)
# Look at the average Annual_Sales() wrt to  few columns
names(Mer_Sales)
aggregate(x=Mer_Sales$Annual_Sales,by=list(Mer_Sales[,4]),FUN=mean)  # mean sales per zone


# Make a copy of the Original Dataset
df = Mer_Sales
dim(df)
# Random Sampling
set.seed(777) # To ensure reproducibility
Index = sample(x = 1:nrow(df), size = 0.7*nrow(df))
Index  # row nos of sampled index

# Create Train dataset
dfTrain = df[Index, ]
nrow(dfTrain)

# Create Test dataset
dfTest = df[-Index, ]
nrow(dfTest)

# Modeling----

head(df)
# Build a full model with default settings
set.seed(123) # To ensure reproducibility of xerrors (cross validated errors while estimating complexity paramter for tree pruning)

RDTree1 = rpart(Annual_Sales ~ . , data = dfTrain[,-1], method = "anova")  # note method anova for regression trees
RDTree1
mean(dfTrain$Annual_Sales) # top of root mean sales
summary(dfTrain[,'Annual_Sales'])


# Plot the Regression Tree
rpart.plot(RDTree1, type = 4,fallen.leaves = T, cex = 1.0, nn=T)
title(" Regression Tree FullModel") # Enlarge the plot by clicking on Zoom button in Plots Tab on R Studio



# The CP table also shows us valueable information in terms of pruning the tree (which is explained later in the code)
 # => The complexity parameter "CP" specifies how the cost of a tree C(T) is penalized by the number of terminal nodes |T|.
 # Hence, Small "CP" results in larger trees and potential overfitting, large CP" in small trees and potential underfitting.
 # => The "rel error" is 1- RSquare, similar to linear regression. This is the error on the observations used to estimate the model. The last node value of rel error suggests the R-Square of the model, if this happens to be the model
 # => The "xerror" is is the error on the observations from cross validation data, which happens to be a 10-Fold Cross Validation. Particpants need to note that, in order to reproduce the "xerror" values, they must use the same set.seed() number each time
 # => Root Node Error is given by sum((Dependent - Mean(Dependent))^2), i.e.
 # sum((InsDataTrainUncapped$Losses-mean(InsDataTrainUncapped$Losses))^2
 
printcp(RDTree1)  # print CP values 
ptree = prune(RDTree1, cp=0.027) # select mid values and see the tree structure
rpart.plot(ptree)  #smaller tree/ pruned
plotcp(RDTree1)

# This produces a plot which may help to look for a model depending on R-Square values produced at various splits
rsq.rpart(RDTree1)

#### Using CP to expand / Prune the tree ####################
# Lets change rpart.control() to specify certain attributes for tree building
RpartControl = rpart.control(cp = 0.027)
set.seed(123)
RDTree2 = rpart(Annual_Sales ~ . ,   data = dfTest[,-1], 
      method = "anova", control = RpartControl)

RDTree2
rpart.plot(RDTree2, extra=101, box.palette="GnBu", branch.lty=3, shadow.col="gray", nn=TRUE)


# Predict on Test Data
#vector will tell mean sales
RDTree2test = predict(RDTree2, newdata = dfTest, type = "vector")
RDTree2test

# Calculate RMSE and MAPE manually
library(forecast)
# Validate RMSE and MAPE calculation with a function in R
ModelAccuarcy = accuracy(RDTree2test, x = dfTest$Annual_Sales)
ModelAccuarcy


# Conclusion
#Classification or Regression
#Method - class, anova
#split data into Train & Test
#select tree with cp
#Predict & Check accuracy
