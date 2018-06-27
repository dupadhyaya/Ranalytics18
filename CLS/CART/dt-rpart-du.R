# Decision Tree - DU Example

#Student Data  Create Data
(rollno = paste('S',1:30, sep=''))
set.seed(1234)
(gender = sample(x=c('Male', 'Female'), size=30, replace=T, prob=c(0.5,0.5) ))
table(gender)
set.seed(1234)
(play = sample(x=c('Play','NotPlay'), size=30, replace=T, prob=c(17/30,13/30) ))
table(play)
prop.table(table(play))

students1 = data.frame(gender, play)
rownames(students1) = rollno
students1
table(students1)

#Model1
set.seed(1234)
fit1 = rpart(play ~ gender, data=students1, minsplit=5, cp=-1)
print(fit1)
options(digits=4)
rpart.plot(fit1, nn=T)
(t1=table(students1$play))
prop.table(t1)

(t2= table(students1$gender, students1$play))
prop.table(t2)
prop.table(t2,1)


#Predict
predict(fit1, newdata = data.frame(gender=c('Female')))
predict(fit1, newdata = data.frame(gender=c('Male', 'Female','Male')))
predict(fit1, newdata = data.frame(gender=c('Male', 'Female','Male')), type='class')

#Case-2----
#Create Dataset
set.seed(1234)
gender = sample(x= c('Male','Female'), size=30, replace=T, prob=c(0.4,0.6) )
table(gender)
set.seed(1234)
married = sample(x= c('Married','Single'), size=30, replace=T, prob=c(0.3,0.7) )
table(married)

set.seed(1234)
play = sample(x= c('Play','NotPlay'), size=30, replace=T, prob=c(15/30,15/30) )
table(play)

students2 = data.frame(gender, married, play)
rownames(students2) = rollno
head(students2)

ftable(students2)

#Model2
set.seed(1234)
fit2 = rpart(play ~ gender +   married, data=students2, minsplit=5, cp=-1)
fit2
summary(fit2)
#Plot
rpart.plot::rpart.plot(fit2, main='Classification Tree')

rpart.plot::rpart.plot(fit2, extra=104, box.palette="GnBu", branch.lty=3, shadow.col="gray", nn=TRUE)

rpart.plot::prp(fit2, extra=104, box.palette="GnBu", branch.lty=3, shadow.col="gray", nn=TRUE, fallen.leaves = T)


#Predict

predict(fit2, newdata = data.frame(gender='Male', married='Married'))
testdata = data.frame(gender=c( 'Male','Male','Female','Female'), married=c('Married', 'Single','Married','Single'))
testdata

(p1 = predict(fit2, newdata = testdata, type='vector'))
(p2 = predict(fit2, newdata = testdata, type='class'))
(p3 = predict(fit2, newdata = testdata, type='prob'))
cbind(testdata, p1, p2, p3)
predict(fit2, newdata= testdata, type = "matrix")

#Location of each data point
fit2$where
rownames(fit2$frame) [fit2$where]
?fit2$frame
?rpart
path.rpart(fit2, c(2,3), pretty = 0, print.it = TRUE)
residuals(fit2, type = c("usual"))
#reduce/ snip the nodes
rpart.plot(snip.rpart(fit2, c(2,3,4,5)))

#Pruning
printcp(fit2)
plotcp(fit2)
fit2a = prune(fit2, cp=0)
fit2a
rpart.plot(fit2a)


#Case-4 : DV is numeric CV
#Create Dataset
set.seed(1234)
gender = sample(x= c('Male','Female'), size=30, replace=T, prob=c(0.4,0.6) )
table(gender)
set.seed(1234)
married = sample(x= c('Married','Single'), size=30, replace=T, prob=c(0.3,0.7) )
table(married)

set.seed(1234)
play = sample(x= c('Play','NotPlay'), size=30, replace=T, prob=c(10/30,25/30) )
table(play)

set.seed(1234)
income = ceiling(runif(30, 50,100) )
mean(income)

students4 = data.frame(income,gender, married, play)
rownames(students4) = rollno
head(students4)
str(students4)

#Model4
fit4 = rpart(income ~ gender + married + play, data=students4, minsplit=5, cp=-1, method='anova')
fit4
rpart.plot(fit4)

#complexity Parameter
printcp(fit4)
rsq.rpart(fit4)

#Predict
(ndata= data.frame(gender='Male', married='Single', play='Play'))
predict(fit4, newdata=ndata, type='vector')
round(residuals(fit4),2)
students4b = cbind(head(students4), predicted=predict(fit4, newdata=head(students4)))
diff = round(students4b$income - students4b$predicted,2)
cbind(rownames(students4b), diff)

      