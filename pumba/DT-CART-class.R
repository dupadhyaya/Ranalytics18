# # Finding how people take decisions to buy products
# Creating Decision Tree

library(rpart)
library(rplart.plot)
library(RColorBrewer)


#Students : Gender - (Male & Female) buy a product

#Variable Gender
set.seed(100)
gender = sample(x=c('Male','Female'), size=1000, replace=T, prob=c(0.5,0.5) )
table(gender)

#Variable- Buy : Decision
set.seed(3000)
buy = sample(x=c('Buy','NotBuy'), size=1000, replace=T, prob=c(.49,.51) )
table(buy)
prop.table(table(buy))

#create Data Frame
students1 = data.frame(gender, buy)
head(students1)

#Table
table(students1)
prop.table(table(students1))
addmargins(prop.table(table(students1)))  # read the summarisation
(t1= table(students1$gender, students1$buy))
addmargins(t1)
prop.table(t1)
addmargins(prop.table(t1))


#Model1 : Create a Decision Tree

dtree1 = rpart(buy ~ gender, data=students1, minsplit=4, minbucket=2)
#'minsplit' is 20 and determines the minimal number of observations per leaf ('minbucket') 
dtree1  #print(fit1)
addmargins(t1)

#plot the decision Tree
library(rpart.plot)
rpart.plot(dtree1, main='Classification Tree', nn=T, type=4, extra=104)
#Interpret the tree
dtree1

#Predict decision for new input values of gender
predict(dtree1, newdata = data.frame(gender='Female'))  # prob
predict(dtree1, newdata = data.frame(gender='Female'), type=c('class'))  # class - buy or not 
predict(dtree1, newdata = data.frame(gender=c('Male','Female','Male')), type='class')  # for 3 values


#---- Part -2 Add another column and see how DT chanes
set.seed(5000)
married = sample(x=c('Married','Single'), size=1000, replace=T, prob=c(0.5,0.5) )
table(married)
students2 = data.frame(gender, married, buy)
head(students2)
str(students2)
prop.table(ftable(students2))
table(students2$buy)  # Majority - Don't Buy

#write.csv(students2, 'dtdata.csv')

# Model2  : create a decision Tree
#library(rpart)
dtree2 = rpart(buy ~ gender + married, data=students2, minsplit=12)
summary(dtree2)
dtree2
rpart.plot(dtree2,type=2,extra=104, tweak=1.2, under=T, shadow=c('brown', 'green','red'), nn=T)

dtree2 # interpret the tree and output

#other methods of plot
prp(dtree2)
prp(dtree2, main="An Example",
    type=4, fallen=T, branch=.3, round=0, leaf.round=9,
    clip.right.labs=F, under.cex=1,
    box.palette="GnYlRd",
    prefix="Student\n", branch.col="gray", branch.lwd=2,
    extra=101, under=T, lt=" < ", ge=" >= ", cex.main=1.5)

prp(dtree2, branch.type=5)
labels(dtree2)

#Plot----
#library(rattle)

rpart.plot::rpart.plot(dtree2, main='Classification Tree')
rpart.plot::rpart.plot(dtree2, extra=104, box.palette="GnBu", branch.lty=3, shadow.col="gray", nn=TRUE)

#rpart.plot::prp(dtree2,fallen.leaves = F)
#prp(dtree2, type=2)


#Predict for new values of Married and Gender

predict(dtree2, newdata = data.frame(gender='Male', married='Married'), type='prob')
predict(dtree2, newdata = data.frame(gender='Male', married='Married'), type='class')
predict(dtree2, newdata = data.frame(gender='Male', married='Married'), type='vector') # class in number

# create a test data frame
testdata = data.frame(gender=c('Male','Male','Female','Female'), married=c('Married','Single','Married','Single'))
testdata
                               
(p1 = predict(dtree2, newdata = testdata, type='vector'))  #node/level Class in number 2 -not buy, 1 - buy
(p2 = predict(dtree2, newdata = testdata, type='class')) #factor
(p3 = predict(dtree2, newdata = testdata, type='prob')) # prob

cbind(testdata, p1, p2, p3)
#level number, class frequencies, probabilities
predict(dtree2, newdata= testdata, type = "matrix")

head(students2)

#Parameters Setting : CP
printcp(dtree2)
printcp(dtree2, digits = 2)
plotcp(dtree2)
names(dtree2)
?
#dtree2$frame[dtree2$where]  #which row at which nodeno
cbind(students2, nodeno=rownames(dtree2$frame) [ dtree2$where])
pfit=  prune(dtree2, cp=0.077) # from cptable  
pfit
rpart.plot(pfit)

#do some changes to pfit

#--------------------------------------------------------

#add column with 3 classes and numeric and logical
set.seed(105)
education = sample(x=c('school','graduate', 'pg'), size=1000, replace=T, prob=c(0.3,0.4,.3) )
education; table(education)
set.seed(106)
hostel = sample(x=c(TRUE, FALSE), size=1000, replace=T, prob=c(.3,.7))
table(hostel)
set.seed(107)
marks = floor(runif(1000,50,100))
mean(marks)
students3 = data.frame(gender, married, education, hostel,marks,buy)
with(students3, ftable(education, hostel, gender, married,buy))

# Model3
fit3a = rpart(buy ~ ., data=students3)
fit3a
rpart.plot::rpart.plot(fit3a, main='Classification Tree')

#Model3b : change some parameters minbucket, minsplit
fit3b = rpart(buy ~ ., data=students3, minsplit=4, minbucket=2) #control= rpart.control(cp=0.00001))#use low cp
fit3b
rpart.plot::rpart.plot(fit3b, main='Classification Tree', cex=.6, type=3, extra=104, nn=T)
rpart.plot::prp(fit3b)
#rattle::fancyRpartPlot(model = fit3b, main = "Final CART Regression Tree", cex = 0.6, sub = "Model3")
prp(fit3b,box.col=c("Grey", "Orange")[fit3b$frame$yval],varlen=0,faclen=0, type=1,extra=4,under=TRUE, tweak=1.2)


#Lets see CP
plotcp(fit3b)
printcp(fit3b, digits = 3)
(bestcp= fit3b$cptable[which.min(fit3b$cptable[,'xerror']),'CP'])
#but this is at root node only, select next better 
bestcp = 0.0146

prp(fit3b)
#fit3b2 = rpart(buy ~ ., data=students3, minsplit=4, minbucket=2, control= rpart.control(cp=bestcp))
#fit3b2
#prp(fit3b2)
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



# now practise with Sales Data

