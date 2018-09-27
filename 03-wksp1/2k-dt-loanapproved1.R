# Decision Tree # loanapproved = age + job + house + credit
loanapproved = sample(x=c('Yes','No'), size=50, replace=T)
age = runif(50,30,60)
house = sample(x=c('Yes','No'), size=50, replace=T, prob=c(.4,.6))
job = sample(x=c('Yes','No'), size=50, replace=T, prob=c(.6,.4))
credit = ceiling(rnorm(50,100, 10))
loan = data.frame(loanapproved, age,job,house, credit)
head(loan)
ctree = rpart(loanapproved ~ ., data=loan)
ctree
rpart.plot(ctree, cex=1)
ndata = data.frame(age=c(45,55), house=c("No",'Yes'), job=c("Yes",'No'), credit=c(90,100))
ndata
(p1=predict(ctree, newdata=ndata,type='class'))

(p2=predict(ctree, newdata=ndata,type='prob'))
(p3=predict(ctree, newdata=ndata,type='matrix'))
cbind(ndata, p1, p2, p3)




loan_tree = rpart(loanapproved ~ ., data=loan, method='class', control=rpart.control(minsplit=5, cp=-1))
loan_tree
rpart.plot(loan_tree)
rpart.plot(loan_tree,  type = 4,fallen.leaves = T, cex = 0.6)
rpart.plot(loan_tree,type=2, extra=104, cex=1, tweak=1, under=T, shadow=c('brown', 'green','red'), nn=T)

printcp(loan_tree)





plot(loan_tree)
text(loan_tree)