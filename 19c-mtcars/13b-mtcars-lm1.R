#Multiple Linear Regression - mtcars

mtcars # mtcars data set
dim(mtcars); names(mtcars)

#predict mpg for following data wt=c(2.5,3.5),cyl=c(4,6)

lmfit1 = lm(mpg ~ wt + cyl, data=mtcars)
summary(lmfit1)
#both are significant variables
attributes(summary(lmfit1))
summary(lmfit1)$adj.r.squared
#adjs R2 = .819

#head(mtcars[c('wt','cyl')])
(ndata=data.frame(wt=c(2.5,3.5),cyl=c(4,6)))

predict(lmfit1,newdata=ndata, type='response')
cbind(ndata, predicted=predict(lmfit1,newdata=ndata, type='response'))

