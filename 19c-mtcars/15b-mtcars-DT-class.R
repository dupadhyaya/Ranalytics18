#Classification - mtcars

library(rpart)
library(rpart.plot)

df = mtcars
df$am = factor(df$am)
#predict likelihood of car being auto or manual using DT

fit.class = rpart(am ~ wt + cyl + mpg + hp + gear, data=df, minsplit=7, cp=-1)
fit.class
printcp(fit.class)

rpart.plot(fit.class, cex=1, nn=T)

library(dplyr)
ndata = sample_n(df,5)
(ndata = ndata[c('am','wt','cyl','mpg','hp','gear')])

predict(fit.class, newdata=ndata, type='prob')
predict(fit.class, newdata=ndata, type='class')

cbind(ndata, predicted=predict(fit.class, newdata=ndata, type='class') )



fit2.class = rpart(am ~ wt + cyl + mpg + hp + gear, data=df, minsplit=7)
fit2.class
rpart.plot(fit2.class)


