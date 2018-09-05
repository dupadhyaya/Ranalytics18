#Multiple Models
#
#A model with a binary response.
library(titanic)
data("Titanic")
str(Titanic)
titanic = data.frame(Titanic)

library(rpart)
library(rpart.plot)
binary.model <- rpart(Survived∼., data=titanic, cp=.02)

rpart.plot(binary.model)
rpart.plot(binary.model, type=1)
rpart.plot(binary.model, type=2)
rpart.plot(binary.model, extra=1)
rpart.plot(binary.model, extra=2)
rpart.plot(binary.model, extra=100)




#A model with a continuous response (an anova model).
str(cu.summary)
anova.model <- rpart(Mileage∼., data=cu.summary)
rpart.plot(anova.model, extra=0)
rpart.plot(anova.model, extra=1)
rpart.plot(anova.model, extra=100)
rpart.plot(anova.model, extra=101)

#Each node shows- the predicted value,
#- the percentage of observations in the node.

#A model with a multi-class response.
multi.class.model <- rpart(Reliability ~ ., data=cu.summary)
rpart.plot(multi.class.model)
rpart.plot(multi.class.model, extra=0)

#Each node shows
#- the predicted class (Much worse, worse, ..., Much better),
#- the predicted probability of each class,
#- the percentage of observations in the node.

