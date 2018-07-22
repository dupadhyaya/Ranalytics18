#Simple Linear Regression 
#Predicting on variable only  : DV


data(women)
str(women)

#Batch of 15 women students have certain weights
#Predict weight of next women 

wt = women$weight

#Plot the weight
plot(wt)
mean(wt)  #This is weight predicted of any women
text(wt+2, labels = wt, cex=.6, col='green')
abline(h=mean(wt), col='red')
text(3,mean(wt)+2,label=paste('Predicited Wt', round(mean(wt))), col='red', cex=.7)

#error in predicting
segments(x0=1:15, y0=mean(wt), x1=1:15, y=wt, col='purple')
e = mean(wt) - wt
text(1:15, wt+5, labels=round(e,1), cex=.8, col='orange')

#sum of errors
sum(e)  # approx zero

#this is why sum of squares is taken
sum(e^2)  # SSE
(rmse = sqrt(sum(e^2)/length(wt)))  #root mean square
# difference between predicted and actual values of DV
# Regression tries to minimise this error by creating a model based on best fit line
# if some indepedent variable is added there is likelihood of this error decreasing

modelwt = lm(wt ~ 1)
summary(modelwt)
attributes(modelwt)
#here the intercept is 137 which is also the mean weight


#next case- consider height(X) and weight(Y)
summary(lm(weight ~height, data=women))
#residual error has decreased to 1.53

#read this http://www.learnbymarketing.com/tutorials/explaining-the-lm-summary-in-r/
