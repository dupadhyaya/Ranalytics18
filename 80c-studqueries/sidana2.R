#sidhana

bank = read.csv(file.choose())
head(bank)
bank$y = factor(bank$y)
library(rpart)
library(rpart.plot)

fit = rpart(y ~. , data= bank)
fit
library(rattle)
fancyRpartPlot(fit)
rpart.plot::prp(fit, extra=104, type=4, fallen.leaves = T)
