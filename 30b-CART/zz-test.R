

#method = one of "anova", "poisson", "class" or "exp". 
#If method is missing then the routine tries to make an intelligent guess. If y is a survival object, then method = "exp" is assumed, if y has 2 columns then method = "poisson" is assumed, if y is a factor then method = "class" is assumed, otherwise method = "anova" is
#x

#Different Control Parameters
#cp, minsplit, minbucket, maxdepth, maxcompete, xval,
control_1 = rpart.control(cp = 0.005, minsplit=3, minbucket = 2)
control_1 = rpart.control(cp = 0.005, minsplit=10, minbucket = 5)

m1 = rpart(play ~ . , data=game, x=T, model=T, control=control_1)
m1
m1$frame
rpart.plot(m1, nn=T)
m1$model
class(m1$model)

summary(m1)
print(m1)

#
library(rattle)
library(RColorBrewer)
fancyRpartPlot(m1)
