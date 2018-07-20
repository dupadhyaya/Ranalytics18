library(caret)
library(rpart.plot)

data_url <- c("https://archive.ics.uci.edu/ml/machine-learning-databases/car/car.data")
download.file(url = data_url, destfile = "car.data")

car_df <- read.csv("car.data", sep = ',', header = FALSE)

str(car_df)
dim(car_df)
head(car_df)
#all are categories, no normalisation required
set.seed(3033)
intrain = createDataPartition(y=car_df$V7, p=0.7, list=F)
intrain
training = car_df[intrain,]
testing = car_df[-intrain,]

dim(training)
dim(testing)
#---------------
anyNA(car_df)
summary(car_df)

#---- Training DT classifier with criterion as information gain
#Training DT classifier with criterion as Info Gain

trctrl = trainControl(method ='repeatedcv', number = 10, repeats=3)
set.seed(333)
dtree_fit = train(V7 ~ ., data= training, method='rpart', parms= list(split='information'), trControl=trctrl, tuneLength = 10)

dtree_fit

#Plot DT
prp(dtree_fit$finalModel, box.palette = 'Reds', tweak=1.2)


#---- Prediction
testing[1,]
predict(dtree_fit, newdata = testing[1,])

test_pred = predict(dtree_fit, newdata = testing)
test_pred
confusionMatrix(test_pred, testing$V7)

#---- Gini Index
set.seed(3333)
dtree_fit_gini = train(V7 ~ . , data = training, method = 'rpart', 
                       parms = list(split='gini'), trControl=trctrl, tuneLength=10)
dtree_fit_gini
prp(dtree_fit_gini$finalModel, box.palette = 'Blues', tweak=1.2)

#Prediction
test_pred_gini = predict(dtree_fit_gini, newdata=testing)
confusionMatrix(test_pred_gini, testing$V7)
