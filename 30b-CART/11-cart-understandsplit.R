#Understanding Splitting and selection of variables

library(rpart)
library(rpart.plot)
#---

(gender = c(rep('M', 60), rep('F', 40)))
(play = c(rep(c('Yes','No'), c(30,30)), rep(c('Yes','No'), c(20,20))))
students = data.frame(gender, play)  
head(students)  
(t1=table(students$gender, students$play))
prop.table(t1)

dtree1 = rpart(play ~ gender, data=students, control = list(cp=-1, minsplit=5))
dtree1
rpart.plot(dtree1)
#no decision tree as proportion is 50%

#----------------------
(gender2 = c(rep('M', 60), rep('F', 40)))
(play2 = c(rep(c('Yes','No'), c(40,20)), rep(c('Yes','No'), c(20,20))))
students2 = data.frame(gender2, play2)  
head(students2)  
(t2=table(students2$gender2, students2$play2))
addmargins(t2)
prop.table(t2)  #more % of males play
prop.table(t1)
addmargins(prop.table(t2))
#how many play - .6, 60% from 100% values

dtree2 = rpart(play2 ~ gender2, data=students2, control = list(cp=-1, minsplit=5))
dtree2
rpart.plot(dtree2)
rpart.plot(dtree2, extra=104)
rpart.plot(dtree2, extra=104, yesno=2, left=F, xflip=T, yflip=T,faclen=3, cex=1.5)
#explore below document
#https://cran.r-project.org/web/packages/rpart.plot/rpart.plot.pdf
prop.table(t2,1) #40/60
#majority play (at root node)

#Eg3----------------------

(gender3 = c(rep('M', 60), rep('F', 40)))
(play3 = c(rep(c('Yes','No'), c(40,20)), rep(c('Yes','No'), c(20,20))))
(married3 = c(rep(c('Md','Sg'), c(50,10)), rep(c('Md','Sg'), c(10,30))))


students3 = data.frame(gender3, play3, married3)  
head(students3)  
(t3a= table(students3$play3, students3$gender3))
(t3b= table(students3$play3, students3$married3))
addmargins(t3a)
addmargins(t3b)

dtree3 = rpart(play3 ~ gender3 + married3, data=students3, control = list(cp=-1, minsplit=5))
dtree3
rpart.plot(dtree3)
addmargins(prop.table(table(students3$play3, students3$married3)))

#decision tree as proportion of M is not 50%
table(students3$play3)
#majority play (at root node)

#rpart(y~x+z, data=df, parms=list(split='gini'))


#Variable with lower Gini Index value, should be chosen as a variable that gives best split. The next step would be to take the results from the split and further partition.  
table(students3$play3)

table(students3$married3)
#married Variable : Gini Index
table(students3$play3, students3$married3)
(gini_md_sg = 1 - (30/40)^2 - (10/40)^2)
(gini_md_md = 1 - (10/60)^2 - (50/60)^2)
(gini_md = gini_md_sg + gini_md_md)

#gender Variable : Gini Index
table(students3$play3, students3$gender3)
(gini_gd_m = 1 - (20/60)^2 - (40/60)^2)
(gini_gd_f = 1 - (20/40)^2 - (20/40)^2)
(gini_gd = gini_gd_m + gini_gd_f)
gini_md < gini_gd
#gini_md is lower hence should be selected as split variable

#After Splitting : look at left tree ie. Single students
#singles = split(students3, married3="Sg")
