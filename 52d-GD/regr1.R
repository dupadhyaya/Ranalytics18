# Regression

#Load Train and Test datasets
#Identify feature and response variable(s) and values must be numeric and numpy arrays
#x_train <- input_variables_values_training_datasets
#y_train <- target_variables_values_training_datasets
#x_test <- input_variables_values_test_datasets

x <- data.frame(cbind(x_train,y_train))
# Train the model using the training sets and check score
linear <- lm(y_train ~ ., data = x)
summary(linear)
layout(matrix(c(1,2,3,4),2,2))
plot(linear)
head(x_test)

#Predict Output
#newdata = data.frame(waiting=80) # wrap the parameter
#predict(eruption.lm, newdata)    # apply predict 
newdate = data.frame()
predicted= predict(linear,x_test) 
?predict
