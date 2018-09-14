#Logistic Regression : Predict Probability of Selection 

df =  read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")

## view the first few rows of the data
head(df)
sum(is.na(df))

## two-way contingency table of categorical outcome and predictors we want to make sure there are no empty cells
xtabs(~admit + rank, data = df)

#convert rank into factors
df$rank = factor(df$rank)
fit3 = glm(admit ~ gre + gpa + rank, data=df,family="binomial")
summary(fit3)

#predict probabilities of original values
(prob=predict(fit3,type=c("response")))
cbind(df, prob)

#Test with new data
(newdata1 = data.frame(gre = mean(df$gre), gpa = mean(df$gpa), rank = factor(1)))
cbind(newdata1, predictProb=predict(fit3, newdata = newdata1, type="response"))
#if prob > 0.5, we say select = 1

#another set of data for prediction
range(df$gre); range(df$gpa);levels(df$rank)
(newdata2 = data.frame(gre = c(200, 300, 400, 500), gpa = c(2.5, 3, 3.3, 3.75), rank = factor(c(1,2,3,4))))
str(newdata2)
newdata2b = cbind(newdata2, predictProb2=predict(fit3, newdata = newdata2, type = "response"))
newdata2b


#this way you predict Probabilites 
