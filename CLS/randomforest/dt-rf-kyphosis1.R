# Random Forests

Random Forest prediction of Kyphosis data
library(randomForest)
fit <- randomForest(Kyphosis ~ Age + Number + Start,   data=kyphosis)
print(fit) # view results 
importance(fit) # importance of each predictor
head(kyphosis)
?kyphosis
plot(fit)
# Importance of each predictor.
print(importance(fit,type = 2)) 

#EWg2
Load the party package. It will automatically load other
# required packages.
library(party)
library(randomForest)

# Create the forest.
output.forest <- randomForest(nativeSpeaker ~ age + shoeSize + score,   data = readingSkills)

# View the forest results.
print(output.forest) 
# Importance of each predictor.
print(importance(output.forest,type = 2)) 

