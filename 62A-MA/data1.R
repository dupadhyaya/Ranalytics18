# Data
#Students of Class IX & X (M & F) play sports
student = paste('S',1:30, sep='')
student
set.seed(1234)
gender = sample(x=c('Male','Female'), size=30, replace=T, prob=c(20/30,10/30) )
gender
set.seed(1234)
class = sample(x=c('IX','X'), size=30, replace=T, prob=c(14/30,16/30) )
class
set.seed(1234)
play = sample(x=c('Yes','No'), size=30, replace=T, prob=c(15/30,15/30) )
play
studentsplay = data.frame(student, gender, class, play)
studentsplay
t1= table(studentsplay$gender,studentsplay$play)
prop.table(t1)

studentsplay

# Pruning only on the basis of Gender
playmodel1 <-rpart(play ~ gender , method="class", data=studentsplay,control=rpart.control(minsplit=2))
playmodel1
printcp(playmodel1)
prp(playmodel1,box.col=c("Grey", "Orange")[playmodel1$frame$yval],varlen=0,
    faclen=0, type=1,extra=4,under=TRUE)

playmodel2 <-rpart(play ~ class + gender, method="class", data=studentsplay,control=rpart.control(minsplit=4))
playmodel2
printcp(playmodel2)
prp(playmodel2,box.col=c("Grey", "Orange")[playmodel2$frame$yval],varlen=0,
    faclen=0, type=1,extra=4,under=TRUE)

playmodel3 <-rpart(play ~ class + gender, method="class", 
          data=studentsplay,control=rpart.control(minsplit=2, cp=0.001))
playmodel3
printcp(playmodel3)
prp(playmodel3,box.col=c("Grey", "Orange")[playmodel3$frame$yval],varlen=0,
    faclen=0, type=1,extra=4,under=TRUE)

Sample_tree<-rpart(play~gender+class, method="class", data=studentsplay, control=rpart.control(minsplit=2, cp=0.001))
Sample_tree

