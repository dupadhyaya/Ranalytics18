# Decision Tree - caret pacakage
#The caret library is really useful because you can easily apply different models and compare their performance. It can call rpart but uses a slightly different syntax to include all features.

library(caret)
library(data.table)

mt <- data.table(mtcars)

tr <- train(x=mt[,-'hp', with=FALSE], y = mt[, hp], method='rpart')
tr2 <- train(x=mt[,-'hp', with=FALSE], y = mt[, hp], method='rf')

plot(tr$finalModel)
text(tr$finalModel)
