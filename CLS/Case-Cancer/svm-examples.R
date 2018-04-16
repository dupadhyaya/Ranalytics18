# SVM

# Solved Eg
## a simple example
library(MASS)
data(cats)
m <- svm(Sex~., data = cats)
head(cats) # 2dim : fix for higher dime
plot(m, cats)

## more than two variables: fix 2 dimensions
data(iris)
m2 <- svm(Species~., data = iris)
plot(m2, iris, Petal.Width ~ Petal.Length,
     slice = list(Sepal.Width = 3, Sepal.Length = 4))

#small examples on SVM
library(e1071)

day = c(0,1,2,3,4,5,6)
weather = c(1,0,0,0,0,0,0)
happy = factor(c(T,F,F,F,F,F,F))

d = data.frame(day=day, weather=weather, happy=happy)
head(d)
model = svm(happy ~ day + weather, data = d)

plot(x=d$weather, y=d$day, xlim=c(0,2))
plot(model, d,add=T, yaxt=n, xaxt=n, xlim=c(0,2))

#add another row
d1a = data.frame(day=c(7), weather=c(1), happy=c(T))
d2 = rbind(d, d1a)
d2
model2 = svm(happy ~ day + weather, data = d2)
plot(x=d2$weather, y=d2$day, xlim=c(0,2))
plot(model2, d2,add=T, yaxt=n, xaxt=n, xlim=c(0,2))

#add another row
d1b = data.frame(day=c(8), weather=c(0), happy=c(T))
d3 = rbind(d2, d1b)
d3
model3 = svm(happy ~ day + weather, data = d3)
plot(x=d3$weather, y=d3$day, xlim=c(0,2))
plot(model3, d3,add=T, yaxt=n, xaxt=n, xlim=c(0,2))

