# Graph Practise
?text

plot(mtcars$wt, mtcars$mpg, main=' MPG vs Weight',
     xlab='Weight' , ylab='Miles per Gallon', pch=18, col='blue', las=1)
text(mtcars$wt, mtcars$mpg, cex=0.6, pos=4, col='red')
text(mtcars$wt, mtcars$mpg, rownames(mtcars), cex=0.6, pos=4, col='red')
text(mtcars$wt, mtcars$mpg, 1:length(mtcars), cex=0.6, pos=2, col='blue')

plot(1:10, pch=10)
text(1:10, 1:10, 1:10)
text(1:10, 1:10, 1:10, pos=1, col='blue')
text(1:10, 1:10, 1:10, pos=2, cex=0.75, col='green')
text(1:10, 1:10, 1:10, pos=3, cex=1.25, col='red')
text(1:10, 1:10, 1:10, pos=4, cex=0.8, col='purple')


?plot
?text
?legend

# Data
x <- c(1,2,3,4,5)
y <- 2*x

# Plot
plot(x,y)

# Grid
grid(10,10)

data(iris)
str(iris)
iris[iris$Species=='setosa',]
dfsetosa = iris[iris$Species=='setosa',][1:2]
dfsetosa
plot(y=dfsetosa$Sepal.Length, x=dfsetosa$Sepal.Width)
fit=lm(Sepal.Length ~ Sepal.Width, data=dfsetosa)
summary(fit)
plot(fit, which=1)
