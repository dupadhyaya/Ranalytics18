# Linear Regression - Graphs for Visualise


fit = lm(weight ~ height, data=women)

#Base Package
par(mfrow=c(2,2))
plot(fit, ask=FALSE)
par(mfrow=c(1,1))


library(ggfortify)  #ggplotbased
autoplot(fit)


#Cooks Distance
#measures howm much the Predicted value of DV changes for all the obsversations in the sample when a particular observation is excluded from the sample for estimation of regression
car::avPlots(fit)
car::influencePlot(fit)
