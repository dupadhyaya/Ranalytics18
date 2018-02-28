# Data
#Students of Class IX & X (M & F) play sports
rollno = paste('S',1:30, sep='')
rollno
set.seed(1)
gender = sample(x=c('Male','Female'), size=30, replace=T, prob=c(0.5,0.5) )
gender
table(gender)
set.seed(1)
play = sample(x=c('Yes','No'), size=30, replace=T, prob=c(15/30,15/30) )
play
table(play)
students1 = data.frame(gender, play)
rownames(students1) = rollno
students1
table(students1)

#Model1
library(rpart)
?rpart
fit1 = rpart(play ~ gender, data=students1)
fit1
print(fit1)

library(rpart.plot)
rpart.plot(fit1, main='Classification Tree')

predict(fit1, newdata = data.frame(gender='Male'))
predict(fit1, newdata = data.frame(gender='Female'))


#---- Part -2 Add another column
set.seed(1)
gender = sample(x=c('Male','Female'), size=30, replace=T, prob=c(0.5,0.5) )
gender; table(gender)

set.seed(1)
married = sample(x=c('Yes','No'), size=30, replace=T, prob=c(0.5,0.5) )
married; table(married)

set.seed(1)
play = sample(x=c('Yes','No'), size=30, replace=T, prob=c(15/30,15/30) )
play; table(play)
students2 = data.frame(gender, married, play)
rownames(students2) = rollno
students2
table(students2)

# Model2
library(rpart)
fit2 = rpart(play ~ gender + married, data=students2)
fit2

library(rpart.plot)
rpart.plot(fit2, main='Classification Tree')

predict(fit2, newdata = data.frame(gender='Male', married='Yes'))
predict(fit2, newdata = data.frame(gender='Male', married='No'))

predict(fit2, newdata = data.frame(gender='Female', married='Yes'))
predict(fit2, newdata = data.frame(gender='Female', married='No'))

head(students2)
printcp(fit2)
plotcp(fit2)
printcp(fit2, digits = getOption("digits") - 2)
fit2$where
rownames(fit2$frame) [ fit2$where]

#---- Part -3 Change Probabilities and size
set.seed(1)
gender = sample(x=c('Male','Female'), size=100, replace=T, prob=c(0.5,0.5) )
gender; table(gender)

set.seed(1)
married = sample(x=c('Yes','No'), size=100, replace=T, prob=c(0.3,0.7) )
married; table(married)

set.seed(2)
play = sample(x=c('Yes','No'), size=100, replace=T, prob=c(.4,.6) )
play; table(play)
students3 = data.frame(gender, married, play)


#rownames(students3) = rollno
students3
table(students3)

# Model2
library(rpart)
fit3 = rpart(play ~ gender + married, data=students3)
fit3

library(rpart.plot)
rpart.plot(fit3, main='Classification Tree')

predict(fit3, newdata = data.frame(gender='Male', married='Yes'))
predict(fit3, newdata = data.frame(gender='Male', married='No'))

predict(fit3, newdata = data.frame(gender='Female', married='Yes'))
predict(fit3, newdata = data.frame(gender='Female', married='No'))

head(students3)
printcp(fit3)
plotcp(fit3)
printcp(fit3, digits = getOption("digits") - 2)
fit3$where
students3


#add another column
set.seed(5)
education = sample(x=c('school','graduate', 'pg'), size=100, replace=T, prob=c(0.3,0.4,.3) )
education; table(education)
students4 = data.frame(gender, married, education, play)

# Model4
fit4 = rpart(play ~ ., data=students4)
fit4

rpart.plot::rpart.plot(fit4, main='Classification Tree')

predict(fit4, newdata = data.frame(gender='Male', married='Yes', education='school'))
predict(fit4, newdata = data.frame(gender='Male', married='No', education='pg'))

head(students4)
printcp(fit4)
plotcp(fit4)
printcp(fit4, digits = getOption("digits") - 2)
fit4$where
students4

prp(fit4,box.col=c("Grey", "Orange")[fit4$frame$yval],varlen=0,
    faclen=0, type=1,extra=4,under=TRUE, tweak=1.2)
?rpart.plot::prp


fit4b <-rpart(play ~ ., method="class",
                   data=students4,control=rpart.control(minsplit=4))
fit4b

printcp(fit4b)
prp(fit4b,box.col=c("Grey", "Orange")[fit4b$frame$yval],varlen=0,
    faclen=0, type=1,extra=4,under=TRUE)

fit4c <-rpart(play ~ ., method="class", 
        data=students4,control=rpart.control(minsplit=2, cp=0.001))
fit4c
printcp(fit4c)
prp(fit4c,box.col=c("Grey", "Orange")[fit4c$frame$yval],varlen=0,
    faclen=0, type=2,extra=4,under=TRUE)


