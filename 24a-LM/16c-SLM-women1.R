# Simple Linear Regression : Built in Data Set Women
# Predit Weight of heights of women - 60.5, 75.5

#Check the Data set
women 
str(women)

cov(women$height, women$weight)
#69 : which show positive relationship between height and weight

cor(women$height, women$weight)
#0.995 : which shows Strong and Positive relationship betw height & weight
0.995^2 # also equal R^2 value in this case (Simple Linear Regression)

plot(x=women$height, y=women$weight)
abline(lm(weight ~ height, data=women), col='red')
names(women)  #x- IV, y -DV
fit1 = lm(weight ~ height, data=women)  # creating a model
summary(fit1)  #summary of the Model


#Predict
fit = lm(weight ~ height, data=women)
(ndata = data.frame(height = c(60.5, 75.5)))
predictedwt = predict(fit, newdata = ndata)
cbind(ndata, predictedwt)

#End : Simple way to predict in SLM