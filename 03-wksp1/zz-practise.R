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


#iimkpv

#vectors
x = 1:100
class(x)
x = c(1,3,5.5)
class(x)
x = LETTERS[1:10]
class(x)
x = c(T,F,T,F,F)
class(x)
#matrix
m = matrix(1:24, ncol=6)
m
class(m)
#dataframes
head(mtcars)
class(mtcars)

#datastructures
#filter, sort, delete, missingvalues, stats operations
colMeans(mtcars)
colMeans(m)
?colMeans

#manipulation / summarisation
library(dplyr)
names(mtcars)
mtcars %>% group_by(cyl) %>% summarise(mean(mpg), max(wt), n())

plot(y=mtcars$mpg, x=mtcars$wt)
abline(lm(mpg ~ wt, data=mtcars))
#visualisation

#Modeling
fit = lm(mpg ~ wt + hp, data=mtcars)
summary(fit)
#linear regression, logistic regression, decision tree, clustering, market basket analysis

#Time Series 
#stock data, sales data
#Financial Analytics, Business 

#Dates are handled in the R
#create TS objects in R
#manipulate, Plot, Forecasting
#decomp

# Decision Trees

#types - Regression  & Classification
iris
head(iris)

library(rpart)
library(rpart.plot)
#regression tree
#DV - Sepal.Length
rtree = rpart(Sepal.Length ~ . , data= iris, method='anova')
rtree
rpart.plot(rtree,  nn=T, cex=.8, fallen.leaves = T)
#classification tree
#DV - Species
ctree = rpart(Species ~ . ,data = iris, method='class')
ctree
rpart.plot(ctree, cex=.8, nn=T, extra=104)
printcp(ctree)
ctreeprune1 = prune(ctree, cp=.44)
ctreeprune1
rpart.plot(ctreeprune1, cex=.8, nn=T, extra=104)
(ndata = sample_n(iris,3))
predict(ctree,newdata=ndata, type='prob')


library(gsheet)
url= "https://docs.google.com/spreadsheets/d/1FTlwpywOynI9dXbgewKCf4WhBc2PwoQmHzlqnAEisuA"
df = as.data.frame(gsheet2tbl(url))
head(df)

url2= "https://docs.google.com/spreadsheets/d/1FTlwpywOynI9dXbgewKCf4WhBc2PwoQmHzlqnAEisuA/edit#gid=1123010023"
df2 = as.data.frame(gsheet2tbl(url2))
head(df2)


df3 = read.csv('./data/iimc1.csv')
head(df3)

