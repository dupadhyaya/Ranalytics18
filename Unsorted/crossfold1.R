#Steps
library(MASS, quietly=T)
library(caret)
set.seed(123)
df = iris
help(iris)
str(df)
dim(df)
head(df)
summary(df)
apply(df, 2, function(x) length(unique(x)))

#Create train & test data
library(caTools)
library(caret)
(ind = createDataPartition(df$Species, p = 2/3, list=F))
(trainDF = df[ind,])  
(testDF = df[-ind,])  

ControlParameters = trainControl(method='cv', number=5,
    savePredictions =T, classProbs=T)
ControlParameters

(parameterGrid = expand.grid(mtry= c(2,3,4)))
method='cv'
number=5
classProbs=T

modelRandom = train(Species ~ . , data = trainDF, 
      method='rf', trControl = ControlParameters, 
      tuneGrid = parameterGrid)  
#preProcess = c('center', 'scale')
modelRandom

names(getModelInfo())

(predictions = predict(modelRandom, testDF))

(t = table(predictions= predictions, actual=testDF$Species))

modelRandom = train(Species ~ . , data = trainDF, 
      method='rf', trControl = ControlParameters, 
      tuneGrid = parameterGrid) 

