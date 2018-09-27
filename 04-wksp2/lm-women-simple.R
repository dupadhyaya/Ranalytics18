# Simple Linear Regression : Built in Data Set Women
# Predit Weight of heights of women - 60.5, 75.5

#Check the Data set
women 
str(women)

cov(women$height, women$weight)  #direction of relationship
#69 : which show positive relationship between height and weight

cor(women$height, women$weight)  #strength and direction of relationship
#0.995 : which shows Strong and Positive relationship betw height & weight
0.995^2 # also equal R^2 value in this case (Simple Linear Regression)

plot(x=women$height, y=women$weight)
abline(lm(weight ~ height, data=women), col='red')

names(women)  #x- IV, y -DV
fit1 = lm(weight ~ height, data=women)  # creating a model
summary(fit1)  #summary of the Model


#Predict
range(women$height)  #values to be within this range
(ndata = data.frame(height = c(60.5, 75.5)))
predictedwt = predict(fit1, newdata = ndata)
cbind(ndata, predictedwt)

#End : Simple way to predict in SLM

#Next task if check for assumptions
plot(fit1)
