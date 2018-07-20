# # Finding how people take decisions to buy products
# Creating Decision Tree
#install packages - rpart, rpart.plot, RColorBrewer

library(rpart)# doing classification
library(rpart.plot) # visualising the tree

#Students : Gender - (Male & Female) buy a product
#Rownames
rollno = paste('S',1:1000, sep='')
rollno

#Variable Gender
set.seed(100)
gender = sample(x=c('Male','Female'), size=1000, replace=T, prob=c(0.5,0.5) )
head(gender)
table(gender)

#Variable- Buy : Decision
set.seed(100)
buy = sample(x=c('Buy','NotBuy'), size=1000, replace=T, prob=c(.41,.59) )
head(buy)
table(buy)
prop.table(table(buy))

#create Data Frame
students1 = data.frame(gender, buy)
rownames(students1) = rollno
head(students1)

xtabs(~ gender + buy,data = students1)

#Table
table(students1)
prop.table(table(students1))
addmargins(prop.table(table(students1)))
(t1= table(students1$gender, students1$buy))
addmargins(t1)
prop.table(table(students1$gender, students1$buy))
addmargins(prop.table(table(students1$gender, students1$buy))
)

#Model1
head(students1)
fit = rpart(buy ~ gender, data= students1)
fit

rpart.plot(fit,nn=T)

fit1 = rpart(buy ~ gender, data=students1, minsplit=4, minbucket=2)
#'minsplit' is min 4 obsv reqd to split a node
#'minbucket' determines the minimal number of observations per leaf ('minbucket') 

fit1  #print(fit1)

table(students1$gender, students1$buy)
head(students1)
library(rpart.plot)
rpart.plot(fit1, main='Classification Tree', nn=T, type=4, extra=104)

fit1

predict(fit1, newdata = data.frame(gender='Female'))

predict(fit1, newdata = data.frame(gender='Female'), type=c('class'))
predict(fit1, newdata = data.frame(gender=c('Male','Female','Male')), type='class')

#---- Part -2 Add another column----
set.seed(1234)
married = sample(x=c('Married','Single'), size=1000, replace=T, prob=c(0.6,0.4) )
table(married)
#new data frame
students2 = data.frame(gender, married, buy)
rownames(students2) = rollno
head(students2)
str(students2)
prop.table(ftable(students2))
table(students2$buy)  # Majority - Don't Buy
addmargins(prop.table(table(students2)))
#write.csv(students2, 'dtdata.csv')

# Model2
#library(rpart)
names(students2)
fit2 = rpart(buy ~ gender + married, data=students2, minsplit=10, cp=-1)
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


#Plot----
library(RColorBrewer)
rpart.plot::rpart.plot(fit2, main='Classification Tree')
rpart.plot::rpart.plot(fit2, extra=104, box.palette="GnBu", branch.lty=3, shadow.col="gray", nn=TRUE)

rpart.plot::prp(fit2,fallen.leaves = F)
prp(fit2, type=2)


#Predict

predict(fit2, newdata = data.frame(gender='Male', married='Married'), type='prob')
predict(fit2, newdata = data.frame(gender='Male', married='Married'), type='class')
predict(fit2, newdata = data.frame(gender='Male', married='Married'), type='vector')

predict(fit2, newdata = data.frame(gender='Male', married='Married'))

testdata = data.frame(gender=c('Male','Male','Female','Female'), married=c('Married','Single','Married','Single'))
testdata

(p1 = predict(fit2, newdata = testdata, type='vector'))  #node/level 
#play=2, notplay=1
(p2 = predict(fit2, newdata = testdata, type='class')) #factor
(p3 = predict(fit2, newdata = testdata, type='prob')) # prob

cbind(testdata, p1, p2, p3)
#level number, class frequencies, probabilities
predict(fit2, newdata= testdata, type = "matrix")

head(students2)

#Parameters Setting : CP
printcp(fit2)
getOption('digits')
plotcp(fit2)
names(fit2)

fit2$where  #which row at which node no

students2[1:5,]
cbind(students2, nodeno=rownames(fit2$frame) [ fit2$where])
fit2
rpart.plot(fit2)
pfit=  prune(fit2, cp=0.02) # from cptable  
pfit
rpart.plot(pfit)

#Interactive----
new.tree <- prp(fit2, snip=TRUE)$obj # interactively trim the tree
prp(new.tree) # display the new tree
#click on quit 
