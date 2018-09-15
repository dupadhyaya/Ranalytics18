#Vector

x = c(1,2,3)
x1 = 1:10000000
length(x1)
x
x1

x2 = seq(10, 100, 2)
seq(from = 1, to = 1, by = ((to - from)/(length.out - 1)),
    length.out = NULL, along.with = NULL, ...)
x2
x3 = seq(from=10, to=100, by=3)
x3
?seq


#numeric vector----

(marks = rnorm(n=30, mean=60, sd=10))
mean(marks)
median(marks)
mode(marks)  #no mode
sd(marks)
var(marks)
summary(marks)
range(marks)

#Properties of DS
length(marks)
str(marks)
class(marks)
#
hist(marks)
plot(density(marks))

#character Vector ----

(names = c('Ram','Shyam', 'Robin'))
names
length(names)
mean(names)
class(names)
summary(names)
#
gender = c('M','F','M')
summary(gender)
genderF = factor(gender)
summary(genderF)

(grades = c('A','B','C','D','A','D','A'))
gradesF = factor(grades, ordered=T)
summary(gradesF)
gradesF

gradesF1 = factor(grades, ordered=T, levels=c('D','B','A','C'))
summary(gradesF1)
gradesF1
table(gradesF1)
table(gender)

barplot(table(gradesF1))
pie(table(gradesF1))
mean(gradesF1)


#logical Vector -----

(married = c(TRUE, FALSE, T, F, T, F,T,T))
married
sum(married)
table(married)
class(married)
summary(married)
#

#subset of marks
marks
trunc(marks); round(marks,1); floor(marks); ceiling(marks)
marks1 = trunc(marks)
marks1
marks1[1]
marks1[18]
marks1[1:5]
marks1[-c(10:15)]
marks1[c(1,5,10,30)]
mean(marks1[c(1,5,10,30)])
marks1[marks1 > 60]
marks1 > 60
marks1[marks1 > 60 & marks1 < 80]

#
set.seed(1234)
gender2 = sample(c('M', 'F'), size=1000000, replace=T, prob=c(.6,.4))
gender2
table(gender2)#M-600087
prop.table(table(gender2))
