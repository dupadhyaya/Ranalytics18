# Data
#Students : Gender - (Male & Female) play sports
rollno = paste('S',1:30, sep='')
rollno
set.seed(1)
gender = sample(x=c('Male','Female'), size=30, replace=T, prob=c(0.5,0.5) )
gender
table(gender)
set.seed(1)
play = sample(x=c('Play','NotPlay'), size=30, replace=T, prob=c(15/30,15/30) )
play
table(play)
prop.table(table(play))
students1 = data.frame(gender, play)
rownames(students1) = rollno
students1
table(students1)
prop.table(table(students1))
#Model1
library(rpart)
?rpart
fit1 = rpart(play ~ gender, data=students1)
fit1  #print(fit1)

library(rpart.plot)
rpart.plot(fit1, main='Classification Tree', nn=T)

predict(fit1, newdata = data.frame(gender='Female'))
predict(fit1, newdata = data.frame(gender=c('Male','Female','Male')))

#set.seed
set.seed(101)
x = runif(10, 1,10)
x
mean(x)



#---- Part -2 Add another column
set.seed(100)
gender = sample(x=c('Male','Female'), size=30, replace=T, prob=c(0.4,0.6) )
table(gender)

set.seed(101)
married = sample(x=c('Married','Single'), size=30, replace=T, prob=c(0.3,0.7) )
table(married)

set.seed(102)
play = sample(x=c('Play','NotPlay'), size=30, replace=T, prob=c(15/30,15/30) )
table(play)
students2 = data.frame(gender, married, play)
rownames(students2) = rollno
head(students2)
str(students2)
prop.table(ftable(students2))

# Model2
library(rpart)
fit2 = rpart(play ~ gender + married, data=students2)
summary(fit2)
fit2
rpart.plot(fit2,type=2,extra=104, tweak=1.2, under=T, shadow=c('brown', 'green','red'), nn=T)
fit2
prp(fit2)
prp(fit2, main="An Example",
    type=4, fallen=T, branch=.3, round=0, leaf.round=9,
    clip.right.labs=F, under.cex=1,
    box.palette="GnYlRd",
    prefix="Student\n", branch.col="gray", branch.lwd=2,
    extra=101, under=T, lt=" < ", ge=" >= ", cex.main=1.5)

prp(fit2, branch.type=5)
labels(fit2)
new.tree <- prp(fit2, snip=TRUE)$obj # interactively trim the tree
prp(new.tree) # display the new tree
#Plot----
library(RColorBrewer)
library(rattle)

rpart.plot::rpart.plot(fit2, main='Classification Tree')
rpart.plot::rpart.plot(fit2, extra=104, box.palette="GnBu", branch.lty=3, shadow.col="gray", nn=TRUE)

rpart.plot::prp(fit2,fallen.leaves = F)
prp(fit2, type=2)
?prp
windows()
rattle::fancyRpartPlot(model = fit2, main = "Final CART Regression Tree", cex = 0.6, sub = "Model2")

#Predict
#
predict(fit2, newdata = data.frame(gender='Male', married='Married'), type='prob')
predict(fit2, newdata = data.frame(gender='Male', married='Married'), type='class')
predict(fit2, newdata = data.frame(gender='Male', married='Married'), type='vector')



predict(fit2, newdata = data.frame(gender='Male', married='Married'))
?predict

testdata = data.frame(gender=c('Male','Male','Female','Female'), married=c('Married','Single','Married','Single'))
testdata
                               
(p1 = predict(fit2, newdata = testdata, type='vector'))  #node/level
(p2 = predict(fit2, newdata = testdata, type='class')) #factor
(p3 = predict(fit2, newdata = testdata, type='prob')) # prob

cbind(testdata, p1, p2, p3)

#level number, class frequencies, probabilities
predict(fit2, newdata= testdata, type = "matrix")

head(students2)

#Parameters Setting : CP
printcp(fit2)
printcp(fit2, digits = getOption("digits") - 5)
plotcp(fit2)

fit2$where
students2[1:5,]
rownames(fit2$frame) [ fit2$where]
#--------------------------------------------------------

#add column with 3 classes and numeric and logical
set.seed(105)
education = sample(x=c('school','graduate', 'pg'), size=30, replace=T, prob=c(0.3,0.4,.3) )
education; table(education)
set.seed(106)
hostel = sample(x=c(TRUE, FALSE), size=30, replace=T, prob=c(.3,.7))
table(hostel)
set.seed(107)
marks = floor(runif(30,50,100))
mean(marks)
students3 = data.frame(gender, married, education, hostel,marks,play)
with(students3, ftable(education, hostel, gender, married,play))

# Model3
fit3a = rpart(play ~ ., data=students3)
fit3a
rpart.plot::rpart.plot(fit3a, main='Classification Tree')

#Model3b : change some parameters minbucket, minsplit
fit3b = rpart(play ~ ., data=students3, minsplit=4, minbucket=2) #control= rpart.control(cp=0.00001))#use low cp
fit3b
rpart.plot::rpart.plot(fit3b, main='Classification Tree', cex=.6, type=3, extra=104, nn=T)
rpart.plot::prp(fit3b)
rattle::fancyRpartPlot(model = fit3b, main = "Final CART Regression Tree", cex = 0.6, sub = "Model3")
prp(fit3b,box.col=c("Grey", "Orange")[fit3$frame$yval],varlen=0,
    faclen=0, type=1,extra=4,under=TRUE, tweak=1.2)


#Lets see CP
plotcp(fit3b)
printcp(fit3b, digits = getOption("digits") - 5)
(bestcp= fit3b$cptable[which.min(fit3b$cptable[,'xerror']),'CP'])
#but this is at root node only, select next better 
bestcp = 0.01

prp(fit3b)
fit3b2 = rpart(play ~ ., data=students3, minsplit=4, minbucket=2, control= rpart.control(cp=0.001))
fit3b2
prp(fit3b2)
fit3b.pruned = prune(fit3b, cp=bestcp)
fit3b.pruned
prp(fit3b.pruned)

rpart.plot(fit3b.pruned,cex=.6, extra=101, type=1)


#Predict Model3
fit3b.pruned$where
fit3b.pruned
path.rpart(fit3b.pruned, nodes=c(1,4,10,43), pretty = 0, print.it = TRUE)
testdata1= data.frame(gender='Male', married='Married', education='school', hostel=TRUE, marks=60)
testdata1
predict(fit3b.pruned, newdata = testdata1 )



# now practise with Marketing Data
