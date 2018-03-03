# CART Models - HH Case Study

library(rpart)
library(rpart.plot)
library(forecast)
#install.packages("https://cran.r-project.org/bin/windows/contrib/3.3/RGtk2_2.20.31.zip", repos=NULL)
library(RGtk2)
#install.packages("rattle")
library(rattle)


# Set the working directory to folder where you have placed the Input Data

Mer_Sales = read.csv(file = "./data/Predict Merchant_Sales v01.csv", header = T)

# Summarize the dataset
summary(object = Mer_Sales)

# Look at the average Annual_Sales()
for(i in 2:ncol(Mer_Sales))
{
  if(length(unique(Mer_Sales[,i])) <= 5)
  {
    Annual_Sales=aggregate(x=Mer_Sales$Annual_Sales,by=list(Mer_Sales[,i]),FUN=mean)
    print(colnames(Mer_Sales)[i])
    print(Annual_Sales)
    print("****************************************")
  }
}


# Make a copy of the Original Dataset
Mer_SalesUncapped = Mer_Sales

# Random Sampling
set.seed(777) # To ensure reproducibility
Index = sample(x = 1:nrow(Mer_SalesUncapped), size = 0.7*nrow(Mer_SalesUncapped))

# Create Train dataset
Mer_SalesTrainUncapped = Mer_SalesUncapped[Index, ]
nrow(Mer_SalesTrainUncapped)
summary(object = Mer_SalesTrainUncapped)

# Create Test dataset
Mer_SalesTestUncapped = Mer_SalesUncapped[-Index, ]
nrow(Mer_SalesTestUncapped)
summary(object = Mer_SalesTestUncapped)


########################### Modeling #################################

# Build a full model with default settings
set.seed(123) # To ensure reproducibility of xerrors (cross validated errors while estimating complexity paramter for tree pruning)
CartFullModel = rpart(formula = Annual_Sales ~ . , data = Mer_SalesTrainUncapped[,-1], method = "anova")
CartFullModel
summary(object = CartFullModel)
summary(Mer_SalesTestUncapped[,'Annual_Sales'])

# Plot the Regression Tree
rpart.plot(x = CartFullModel, type = 4,fallen.leaves = T, cex = 0.6)
title("CartFullModel") # Enlarge the plot by clicking on Zoom button in Plots Tab on R Studio

# fancyRpartPlot() function to plot the same model
# Expand the plot window in R Studio to see a presentable output
fancyRpartPlot(model = CartFullModel, main = "CartFullModel", cex = 0.6) 

# The following code also produces the same output, but in a windowed form
windows()
fancyRpartPlot(model = CartFullModel, main = "CartFullModel", cex = 0.6)


# The CP table also shows us valueable information in terms of pruning the tree (which is explained later in the code)
 # => The complexity parameter "CP" specifies how the cost of a tree C(T) is penalized by the number of terminal nodes |T|.
 # Hence, Small "CP" results in larger trees and potential overfitting, large CP" in small trees and potential underfitting.
 # => The "rel error" is 1- RSquare, similar to linear regression. This is the error on the observations used to estimate the model. The last node value of rel error suggests the R-Square of the model, if this happens to be the model
 # => The "xerror" is is the error on the observations from cross validation data, which happens to be a 10-Fold Cross Validation. Particpants need to note that, in order to reproduce the "xerror" values, they must use the same set.seed() number each time
 # => Root Node Error is given by sum((Dependent - Mean(Dependent))^2), i.e.
 # sum((InsDataTrainUncapped$Losses-mean(InsDataTrainUncapped$Losses))^2
 
printcp(x = CartFullModel)
plotcp(CartFullModel)

# This produces a plot which may help particpants to look for a model depending on R-Square values produced at various splits
rsq.rpart(x = CartFullModel)

#### Using CP to expand / Prune the tree ####################
# Lets change rpart.control() to specify certain attributes for tree building
RpartControl = rpart.control(cp = 0.005)
set.seed(123)
CartModel_1 = rpart(formula = Annual_Sales ~ . , 
                    data = Mer_SalesTrainUncapped[,-1], 
                    method = "anova", control = RpartControl)

CartModel_1
summary(CartModel_1)
rpart.plot(x = CartModel_1, type = 4,fallen.leaves = T, cex = 0.6)
printcp(x = CartModel_1)
plotcp(CartModel_1)
rsq.rpart(x = CartModel_1)




####### Some Extra pointers in R #####################


# Model Evaluation Measures on test dataset using the finalized (pruned model)
# Use predict() the get the predicted values for the testset using the finalized model

# Intermediate Model: Finalize CartFullModel (Based on Tree size i.e. Depth, Variables included as well as the R-Square produced)
# Predict on testset
CartFullModelPredictTest = predict(object = CartFullModel, newdata = Mer_SalesTestUncapped, type = "vector")

# Calculate RMSE and MAPE manually
# Participants can calculate RMSE and MAPE using various available functions in R, but that may not
# communicate effectively the mathematical aspect behind the calculations

# RMSE
Act_vs_Pred = CartFullModelPredictTest - Mer_SalesTestUncapped$Annual_Sales # Differnce
Act_vs_Pred_Square = Act_vs_Pred^2 # Square
Act_vs_Pred_Square_Mean = mean(Act_vs_Pred_Square) # Mean
Act_vs_Pred_Square_Mean_SqRoot = sqrt(Act_vs_Pred_Square_Mean) # Square Root
Act_vs_Pred_Square_Mean_SqRoot

# MAPE
Act_vs_Pred_Abs = abs(CartFullModelPredictTest - Mer_SalesTestUncapped$Annual_Sales) # Absolute Differnce
Act_vs_Pred_Abs_Percent = Act_vs_Pred_Abs/Mer_SalesTestUncapped$Annual_Sales # Percent Error
Act_vs_Pred_Abs_Percent_Mean = mean(Act_vs_Pred_Abs_Percent)*100 # Mean
Act_vs_Pred_Abs_Percent_Mean

# Validate RMSE and MAPE calculation with a function in R
UncappedModelAccuarcy = accuracy(f = CartFullModelPredictTest, x = Mer_SalesTestUncapped$Annual_Sales)
UncappedModelAccuarcy



windows()
fancyRpartPlot(model = CartModel_1, main = "Final CART Regression Tree", cex = 0.6, sub = "Model 12")
