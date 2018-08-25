#Multiple Linear Regression - mtcars

mtcars # mtcars data set
dim(mtcars); names(mtcars)

#predict mpg for following data wt=c(2.5,3.5),cyl=c(4,6)
(ndata=data.frame(wt=c(2.5,3.5),cyl=c(4,6)))
(cbind(ndata, data.frame(mpg=c('?','?'))))

#Linear Model
lmfit1 = lm(mpg ~ wt + cyl, data=mtcars)

summary(lmfit1)

#if p value of F Stats < .05 : Linear Model exists with at least one X

#both are significant variables
attributes(summary(lmfit1)) # to use output values

#adjusted R2
summary(lmfit1)$adj.r.squared
#adjs R2 = .819
#82% of variation in Y are explained by two X's in the model


#head(mtcars[c('wt','cyl')])
(ndata=data.frame(wt=c(2.5,3.5),cyl=c(4,6)))

#predict for above wt and cyl combination
predict(lmfit1,newdata=ndata, type='response')
#for wt = 2.5 and cyl =4, mpg predicted is 25.67

cbind(ndata, predicted=predict(lmfit1,newdata=ndata, type='response'))

#how to select from large number of variables
#how to select the best model - from variable combination

