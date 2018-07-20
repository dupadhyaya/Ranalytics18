# Day 1

library(ISLR)
data('Default')
str(Default)
LR1 = glm(default ~ ., family='binomial', data=Default)
summary(LR1) #leave income
LR2 = glm(default ~ student + balance, family='binomial', data=Default)
summary(LR2)
#
range(Default$balance)

ndata3 = Default[c(1,60,700),]
predict(LR2,newdata=ndata3, type='response' )

#mtcars
str(mtcars)






#vectors, arrays, matrix, list, factor, dataframe

x = 1:5
x1 = c('a','b')
m1 = matrix(1:24, nrow=6)
m1
list1 = list(x, x1, m1)
list1
class(women)
women
str(women)
?women
women
head(women)
tail(women,n=3)
head(women, n=3)
names(women)
summary(women)
dim(women)
data()
library(MASS)
x = women$height
x
plot(x)
mean(x)
sd(x) ; var(x)
max(x)
median(x)
x
sort(x, decreasing = T)
table(x)
quantile(x)
x
seq(0,1,.1)
quantile(x, c(.1, .5, .8))
quantile(x,seq(0,1,.1) )
summary(x)
min(x); max(x)
boxplot(x)
abline(h= c(min(x), max(x),mean(x)+1, median(x)), col=1:5, lwd=4)
#


# LM
head(women)
names(women)
model1 = lm(weight ~ height, data=women)
plot(women)
?lm
#options(scipen=999)
summary(model1)
model1
#y = mx + c
y = 3.45 * x + - 87
women$height
fitted(model1)
cbind(women, fitted(model1))
residuals(model1)
cbind(women, fitted(model1), residuals(model1), diff= fitted(model1) - women$weight)
sqrt(sum(residuals(model1)^2)/nrow(women))
cbind(women, fitted(model1))
range(women$height)
new1= data.frame(height=c(57, 60.5,70))
p1=predict(model1, newdata = new1)
cbind(new1, p1)

#mtcars----
names(mtcars)
?mtcars
mtmodel_1 = lm(mpg ~ wt, data=mtcars )
mtmodel_2 = lm(mpg ~ wt + disp, data=mtcars )
mtmodel_3 = lm(mpg ~ wt + disp + cyl, data=mtcars )
mtmodel_4 = lm(mpg ~ ., data=mtcars )
summary(mtmodel_1)  #.745
summary(mtmodel_2)  #.766
summary(mtmodel_3)  #.766
summary(mtmodel_4)  #.807
AIC(mtmodel_1, mtmodel_2,mtmodel_3,mtmodel_4)
summary(mtmodel_4)  #.807
step(lm(mpg ~ ., data=mtcars ))
mtmodel_5= lm(mpg ~ wt + qsec + am, data=mtcars)
summary(mtmodel_5) #Adjusted R-squared:  0.834 


#

attendance = 1:20
marks = 1:20
summary(lm(marks ~ attendance))
cbind(attendance, marks)
cor(attendance, marks)
#





















#y = mx + c
x
y = 3.45 * x + - 87
x
head(women)
(y = 4.45 * 58 - 87)
plot(women)
abline(model1, col='red', lwd=4)
abline(v=64) ; abline(h=150)



x2 = floor(runif(1000, 50, 100))
x2
x2a= sort(x2)
x2a[1000/2]
median(x2)
sort(x)

t1= table(x2)
sort(t1, decreasing = T)

x1 = rep(10,10)
x1
sd(x1)




dim(mtcars)
mtlogmodel = glm(am ~ hp + wt, family='binomial', data=mtcars)
summary(mtlogmodel)
p1=predict(mtlogmodel, newdata=mtcars, type='response')
p2= round(p1, 3)
p3 = ifelse(p2<0.5,0,1)
cbind(mtcars$am, mtcars$hp, mtcars$wt, p2,p3, truefalse= mtcars$am == p3)


