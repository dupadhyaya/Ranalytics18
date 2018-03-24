
# Regression Tree Example
library(rpart)

# grow tree 
fit <- rpart(Mileage~Price + Country + Reliability + Type, 
             method="anova", data=cu.summary)

printcp(fit) # display the results 
plotcp(fit) # visualize cross-validation results 
summary(fit) # detailed summary of splits

# create additional plots 
par(mfrow=c(1,2)) # two plots on one page 
rsq.rpart(fit) # visualize cross-validation results  	

par(mfrow=c(1,1)) # two plots on one page 

# plot tree 
plot(fit, uniform=TRUE, 
     main="Regression Tree for Mileage ")
text(fit, use.n=TRUE, all=TRUE, cex=.8)

# create attractive postcript plot of tree 
post(fit, file = "c:/tree2.ps", 
     title = "Regression Tree for Mileage ")
# prune the tree 
pfit<- prune(fit, cp=0.01160389) # from cptable   

# plot the pruned tree 
plot(pfit, uniform=TRUE, 
     main="Pruned Regression Tree for Mileage")
text(pfit, use.n=TRUE, all=TRUE, cex=.8)
post(pfit, file = "c:/ptree2.ps", 
     title = "Pruned Regression Tree for Mileage")



#Gini and Information Gain Method

fmla = Mileage~Price + Country + Reliability + Type
data = cu.summary
gini_model<-rpart(fmla,data = data, 
                  parms = list(split = "gini"),
                  control = list(minsplit=10))

rpart.plot(gini_model,main="Gini Split Criteria")

info_model<-rpart(fmla,data = data, 
                  parms = list(split = "information"),
                  control = list(minsplit=10))

rpart.plot(info_model,main="InfoGain Split Criteria")
