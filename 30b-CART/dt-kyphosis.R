#
#https://www.statmethods.net/advstats/cart.html
# Classification Tree with rpart

library(rpart)
?kyphosis
# grow tree 
fit <- rpart(Kyphosis ~ Age + Number + Start,
             method="class", data=kyphosis)
head(kyphosis)  #DV Kyphosis
summary(kyphosis)
printcp(fit) # display the results 
plotcp(fit) # visualize cross-validation results 
summary(fit) # detailed summary of splits

library(tree)
summary(tree( Kyphosis ~ Age + Number + Start, data=kyphosis))


# plot tree 
plot(fit, uniform=TRUE,  main="Classification Tree for Kyphosis")
text(fit, use.n=TRUE, all=TRUE, cex=.8)

# create attractive postscript plot of tree 
post(fit, file = "tree.ps", 
     title = "Classification Tree for Kyphosis")


# prune the tree 
#pfit <- prune(fit, cp=   fit$cptable[which.min(fit$cptable[,"xerror"]),"CP"])
pfit <- prune(fit, cp=0.01)

pfit

# plot the pruned tree 
plot(pfit, uniform=TRUE,  main="Pruned Classification Tree for Kyphosis")
text(pfit, use.n=TRUE, all=TRUE, cex=.8)
post(fit, file = "ptree.ps",   title = "Pruned Classification Tree for Kyphosis")



# Regression Tree Example
library(rpart)
?cu.summary
# grow tree 
fit <- rpart(Mileage~Price + Country + Reliability + Type,             method="anova", data=cu.summary)

printcp(fit) # display the results 
plotcp(fit) # visualize cross-validation results 
summary(fit) # detailed summary of splits

# create additional plots 
par(mfrow=c(1,2)) # two plots on one page 
rsq.rpart(fit) # visualize cross-validation results  	

# plot tree 
plot(fit, uniform=TRUE, main="Regression Tree for Mileage ")
text(fit, use.n=TRUE, all=TRUE, cex=.8)

# create attractive postcript plot of tree 
post(fit, file = "c:/tree2.ps",  title = "Regression Tree for Mileage ")


# prune the tree 
pfit<- prune(fit, cp=0.01160389) # from cptable   

# plot the pruned tree 
plot(pfit, uniform=TRUE,     main="Pruned Regression Tree for Mileage")
text(pfit, use.n=TRUE, all=TRUE, cex=.8)
post(pfit, file = "c:/ptree2.ps",  title = "Pruned Regression Tree for Mileage")



# Conditional Inference Tree for Kyphosis
library(party)
fit <- ctree(Kyphosis ~ Age + Number + Start,  data=kyphosis)
plot(fit, main="Conditional Inference Tree for Kyphosis")

# Conditional Inference Tree for Mileage
library(party)
fit2 <- ctree(Mileage~Price + Country + Reliability + Type, data=na.omit(cu.summary))


# Random Forest prediction of Kyphosis data
library(randomForest)
fit <- randomForest(Kyphosis ~ Age + Number + Start,   data=kyphosis)
print(fit) # view results 
importance(fit) # importance of each predictor
