# Practise Exercise - XIMB

#Create a 100 row DF with following Variables
#gender, spl, age, experience, grade, placement
head(students)
str(students)
#


(gender = sample(c('M','F'), size=100, replace=T, prob=c(.6,.4)))
(spl = sample(c('Marketing','Finance','HR'), size=100, replace=T, prob=c(.3,.4,.3)))
(age = round(runif(100, 21, 30),2))
(experience = round(rnorm(100, 4, 1),2))
(grade = sample(c('A','B','C','D'), size=100, replace=T, prob=c(.4,.3,.2,.1)))
(placement = sample(c('yes','no'), size=100, replace=T, prob=c(.7,.3)))

students = data.frame(gender, spl, age, experience, grade, placement)
str(students)
summary(students)

#summarise the data in various ways using dplyr
library(dplyr)
names(students)
students %>% group_by(placement, gender) %>% summarise(mean(experience), max(experience), mean(age))

students %>% filter(spl=='Marketing') %>% summarise(mean(age), mean(experience))
students %>% filter(spl=='Marketing') %>% group_by(spl) %>% summarise(mean(age), mean(experience))
students %>% filter(spl!='Marketing') %>% group_by(spl) %>% summarise(mean(age), mean(experience))
students %>% filter(spl=='Marketing'& gender=='F' & grade=='A') %>% group_by(spl) %>% summarise(mean(age), mean(experience))


#draw few graphs to understand the distribution of data

hist(students$age)
t1=table(students$placement)
barplot(t1, col=1:2)
boxplot(students$age)
pairs(students[,c('age','experience')])
pie(t1)

par(mfrow=c(2,2))
pie(table(students$gender))
pie(table(students$placement))
pie(table(students$grade))
pie(table(students$spl))
par(mfrow=c(1,1))
table(students$gender, students$placement, students$spl)



#find students having largest experience in each spl for each gender

students %>% group_by(spl,gender) %>% arrange(spl, gender,experience) %>% top_n(1, experience) 



#how many were placed : draw pie plot



write.csv(students, './data/ximb.csv')

students2 = read.csv('./data/ximb.csv')
head(students2)


#clustering
km3 = kmeans(students[,c('age','experience')], centers=3)
km3
km3$centers
plot(students[,c('age','experience')], col=km3$cluster)

#decision tree
library(rpart)
library(rpart.plot)

tree = rpart(placement ~ . , data=students)
tree
rpart.plot(tree, nn=T, cex=1)
printcp(tree)
prune(tree, cp=.03)

ndata = sample_n(students, 5)
ndata
predict(tree, newdata= ndata, type='class')
predict(tree, newdata= ndata, type='prob')


#logistic Regression
logitmodel1 = glm(placement ~ . , data =students, family='binomial')
summary(logitmodel1)
logitmodel1a = glm(placement ~ age , data =students, family='binomial')
summary(logitmodel1a)
logitmodel2 = glm(placement ~ age + gender , data =students, family='binomial')
summary(logitmodel2)

#linear regression
linear1 = lm(age ~ . , data=students)
summary(linear1)
