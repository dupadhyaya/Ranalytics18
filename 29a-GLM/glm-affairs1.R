#Affairs,
#https://github.com/marianov24/RAffairsDataAnalysis/blob/master/Affairs_George_Maria.Rmd

# Loading all the required libraries
library("dplyr")
library("ggplot2")
library("car") # Contains the scatterplotMatrix function
#install.packages("boot")
library("boot") # Perform crossvalidation
#install.packages("tree")
library("tree")
library("randomForest")
library(pROC) # Useful for computing and plotting classifer metrics

# install.packages("AER")
library(AER) # Contains Affairs dataset 

# Loading the Affairs dataset of AER package and saving it into a local variable
data("Affairs")
Affairs.data <- Affairs

# Displaying the first few rows of the dataset
head(Affairs.data)
# Displaying the summary of the Affairs.data dataset 
summary(Affairs.data)
# Displaying the structure of the Affairs.data dataset 
str(Affairs.data)

# Finding the proportion of male and female respondents
Affairs.data %>%  
  group_by(gender) %>% 
  summarise(total_participants = n()) %>% 
  ungroup() %>%
  mutate(prop_gender = total_participants/sum(total_participants))

# Plotting the frequency of participants based on gender
ggplot(Affairs.data, aes(gender))  + geom_bar(width = 0.2) +
  xlab("Gender") + ylab("Frequency") + 
  ggtitle("Number of participants based on gender")

# Calculating the average age of the participants
Affairs.data %>%  
  summarise(avg_age = mean(age, na.rm = TRUE))

# Plotting the frequency of participants based on occupation
ggplot(Affairs.data, aes(occupation)) + geom_bar(width = 0.2) +
  xlab("Occupation") + ylab("Frequency") + 
  ggtitle("Number of participants based on occupation") +
  scale_x_continuous(breaks=c(1, 2, 3, 4, 5, 6, 7), 
                     labels=c("Class 1", "Class 2", "Class 3", "Class 4",
                              "Class 5", "Class 6", "Class 7"))


# Plotting the frequency of participants based on education
ggplot(Affairs.data, aes(education)) + geom_bar(width = 0.2) +
  xlab("Education") + ylab("Frequency") + 
  ggtitle("Number of participants based on education") +
  scale_x_continuous(breaks=c(9, 12, 14, 16, 17, 18, 20), 
                     labels=c("Grade School", "High School Graduate", 
                              "Some college", "College graduate",
                              "Some graduate work", "Masters degree",
                              "Advanced Degree")) + coord_flip()


# Creating a binary variable haveaffair denoting whether a participant have
# an affair or not
# If the number of affairs are greater than 0, binary variable is set to 1
Affairs.data$haveaffair[Affairs.data$affairs  > 0] <- 1
# If the number of affairs is equal to 0, binary variable is set to 0
Affairs.data$haveaffair[Affairs.data$affairs == 0] <- 0

# Converting the binary response variable to factor datatype with labels 
# No and Yes for levels 0 and 1 respectively.
Affairs$haveaffair <- factor(Affairs.data$haveaffair,
                             levels=c(0,1),
                             labels=c("No","Yes"))

# Displaying the count of the new binary variable
table(Affairs$haveaffair)

#Fitting a logistic regression model twith haveaffair as the response variable
# and all other personal characteristics as predictor variables
fit.allpredictors <- glm(haveaffair ~ gender + age + yearsmarried + children +
                           religiousness + education + occupation +rating,
                         data=Affairs.data,family=binomial())

# Loading the bestglm package
#install.packages("bestglm")
library("bestglm")

# Creating a new column y, response variable to fit bestglm
Affairs.data$y <- Affairs.data$haveaffair
# Rearranging the columns of Affairs.data dataset to fit bestglm
Affairs.for.bestglm <- Affairs.data[,c("gender","age","yearsmarried","children",
                                       "religiousness", "education",
                                       "occupation", "rating", "y")]

# Using bestglm to perform subset model selection 
set.seed(1)
fit.reduced <- bestglm(Affairs.for.bestglm, family = binomial,
                       method = "exhaustive")

# Displaying the summary statistic of the Best Model
fit.reduced$BestModel

# Displaying the summary statistics of the fitted model.
summary(fit.allpredictors)


# Creating an artificial test dataset
testdata <- data.frame(yearsmarried=mean(Affairs.data$yearsmarried),
                       religiousness=mean(Affairs.data$religiousness),
                       rating=c(1, 2, 3, 4, 5))

# Creating a new column prob to the test data containing the predicted 
# probabilities
testdata$prob <- predict(fit.reduced$BestModel, testdata, type="response")
# Displaying the test data
testdata

# Plotting rating of marriage vs probability of having an affair
ggplot(testdata, aes(rating, prob)) + geom_point() + geom_line() +
  xlab("Rating") + ylab("Probabilty of having an affair") + 
  ggtitle("Rating of marriage vs probability of having an affair") +
  scale_x_continuous(breaks=c(1, 2, 3, 4, 5), 
    labels=c("Very unhappy", "Somewhat unhappy",
    "Average", "Happier than avaerage", "Very happy"))


