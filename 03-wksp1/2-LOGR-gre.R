#Logistic Regresion : GRE
#https://stats.idre.ucla.edu/r/dae/logit-regression/
#A researcher is interested in how variables, such as GRE (Graduate Record Exam scores), GPA (grade point average) and prestige of the undergraduate institution, effect admission into graduate school. The response variable, admit/don’t admit, is a binary variable


inputData <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
## view the first few rows of the data
head(inputData)
inputData
summary(inputData)
sapply(inputData, sd)
str(inputData)
data= inputData  # make a copy for futher analysis

data$rank = factor(data$rank)
data$admit = factor(data$admit)

## 2way contingency table of cat outcome and predictors we want
## to make sure there are not 0 cells
xtabs(~admit + rank, data = data)

#create Logistic Model
mylogit <- glm(admit ~ gre + gpa + rank, data = data, family = "binomial")

summary(mylogit)
#gre,gpa, rank are statistically significant, 
#For every one unit change in gre, the log odds of admission (versus non-admission) increases by 0.002.
#For a one unit increase in gpa, the log odds of being admitted to graduate school increases by 0.804.
#The indicator variables for rank have a slightly different interpretation. For example, having attended an undergraduate institution with rank of 2, versus an institution with a rank of 1, changes the log odds of admission by -0.675.

## odds ratios only
exp(coef(mylogit))

#Predict admit for input data
prob=predict(mylogit,type=c("response"))
cbind(data, prob)

#cutoff value
library(InformationValue)
(optCutOff <- optimalCutoff(data$admit, prob)[1] ) #.46
confusionMatrix(data$admit, prob, threshold = optCutOff)
(accuracy = (247+38)/ (sum(247+38+89+26))) # .715
confusionMatrix(data$admit, prob, threshold = .7)
(accuracy = (272+2)/ (sum(272+2+125+1))) #.685

confusionMatrix(data$admit, prob, threshold = .2)


## view data frame
library(dplyr)
sample_n(data,size=1)
(newdata1 = data.frame(gre=450, gpa=3.7, rank=factor(3) ))
(newdata1$admitPredicted <- predict(mylogit, newdata = newdata1, type = "response"))
(newdata1$admitClass = ifelse(newdata1$admitPredicted > .46,1,0))
newdata1  #b=not admitted to institute

#End of Logistic Regression
#also check for assumptions of residues, VIF, Multi-collinearity
#Parition the data into train and test



library(caret)
Index <- createDataPartition(y=data$admit, p=0.70, list=FALSE)
head(Index)
nrow(data)
trainData = data[Index ,]
testData = data[-Index, ]
table(data$admit); prop.table(table(data$admit))
summary(trainData$admit); summary(testData$admit)
nrow(trainData) ; nrow(testData); nrow(trainData) + nrow(testData)
prop.table(table(trainData$admit))
prop.table(table(testData$admit))
#same promotion of admit in test and train
str(testData)
#now construct a model with train and then test on testdata

