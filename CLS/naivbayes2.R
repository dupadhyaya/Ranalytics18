# Naive Bayes 
#https://www.r-bloggers.com/understanding-naive-bayes-classifier-using-r/


#Getting started with Naive Bayes
#Install the package
#install.packages(“e1071”)
#Loading the library
library(e1071)
?naiveBayes #The documentation also contains an example implementation of Titanic dataset
#Next load the Titanic dataset
data('Titanic')
#Save into a data frame and view it
Titanic_df=as.data.frame(Titanic)

#Creating data from table
repeating_sequence=rep.int(seq_len(nrow(Titanic_df)), Titanic_df$Freq) #This will repeat each combination equal to the frequency of each combination
rep.int(c(1,2,3),c(5,6,7))
repeating_sequence

#Create the dataset by row repetition created
Titanic_dataset=Titanic_df[repeating_sequence,]
#We no longer need the frequency, drop the feature

#Fitting the Naive Bayes model
Naive_Bayes_Model=naiveBayes(Survived ~., data=Titanic_dataset)
#What does the model say? Print the model summary
Naive_Bayes_Model


#Prediction on the dataset
NB_Predictions=predict(Naive_Bayes_Model,Titanic_dataset)
#Confusion matrix to check accuracy
table(NB_Predictions,Titanic_dataset$Survived)


#improvement
Getting started with Naive Bayes in mlr
#Install the package
#install.packages(“mlr”)
#Loading the library
library(mlr)

#Create a classification task for learning on Titanic Dataset and specify the target feature
task = makeClassifTask(data = Titanic_dataset, target = "Survived")
#Initialize the Naive Bayes classifier
selected_model = makeLearner("classif.naiveBayes")
#Train the model
NB_mlr = train(selected_model, task)

#Read the model learned  
NB_mlr$learner.model


#Predict on the dataset without passing the target feature
predictions_mlr = as.data.frame(predict(NB_mlr, newdata = Titanic_dataset[,1:3]))

##Confusion matrix to check accuracy
table(predictions_mlr[,1],Titanic_dataset$Survived)
Titanic_dataset$Freq=NULL
