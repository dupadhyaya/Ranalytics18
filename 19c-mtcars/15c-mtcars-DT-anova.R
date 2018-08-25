#Classification - Regression Tree- mtcars

library(rpart)
library(rpart.plot)

df = mtcars
mean(df$mpg)

#predict likelihood of car mileage using DT

fit.anova = rpart(mpg ~ wt + cyl + am + hp + gear, data=df, minsplit=7, cp=-1, method='anova')
fit.anova


rpart.plot(fit.anova, cex=1, nn=T)

library(dplyr)
ndata = sample_n(df,5)
(ndata = ndata[c('am','wt','cyl','mpg','hp','gear')])
ndata

predict(fit.anova, newdata=ndata, type='vector')

cbind(ndata, predicted=predict(fit.anova, newdata=ndata, type='vector') )

# Prune
printcp(fit.anova)
ptree2 = prune(fit.anova, cp=0.01)
#ideally .0051, but for testing select 
ptree2
rpart.plot(ptree2,nn=T, cex=.8, roundint = F)
