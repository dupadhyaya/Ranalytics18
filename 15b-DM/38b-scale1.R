# Scale
#standardization of the data
#scale is generic function whose default method centers and/or scales the columns of a numeric matrix.
#https://t4tutorials.com/decimal-scale-normalization-in-data-mining/

x = c(1,3,5,7,9,2,4,6,8,10)
(x1 = scale(x, scale=F, center=F))
as.vector(x1)
(xc = scale(x, scale=F, center=T))
as.vector(xc)
(xc = scale(x, scale=F, center=5.5))
xc1 = scale(x, scale=F, center=4)
as.vector(xc1)

(xs = scale(x, scale=T, center=F))
as.vector(round(xs,2))
(xs1 = (x - mean(x)/ sd(x)))
(rmse = sqrt(sum(x^2)/(length(x)-1)))
round((xs2 = (x/ rmse)),2)
(xs3 = (x))

(xsc = scale(x, scale=T, center=T))
as.vector(round(xsc,2))

cbind(x, round(x1,2), round(xc,2), round(xs,2),round(xsc,2))
x
(x2 = x - mean(x))
round((x2 - mean(x2))/ sd(x2),2)


as.vector(xs)
round((zscore = (x - mean(x))/ sd(x)),2)

as.vector(round(xsc,2))

(xc= scale(x, scale=F, center=4))
cbind(x,-4,xc)
(xs = scale(x, scale=T, center=F))
x
(xs = scale(x, scale=T, center=F))
(xsm = sqrt(sum(x^2)/(length(x)-1)))

cbind(x,round(xs,2), round(xsm,2))


round(scale(x,center=min(x),scale=diff(range(x)))[,1],2)
round((x - min(x))/ (max(x) - min(x)),2)
(xC = x - mean(x))
round((xS = xC / sqrt(sum(xC^2)/(length(xC)-1))),2)

#Scale by SD - if there are 2 columns

scale(x, center = FALSE, scale = apply(x, 2, sd, na.rm = TRUE))

data(women)
women
scale(women)
#Scale by SD - if there are 2 columns
scale(women, center = TRUE, scale = apply(women, 2, sd, na.rm = TRUE))

(ws = scale(women, center = T, scale = c(max(women$height), max(women$weight))))
cbind(women, round(ws,2))

(ws2 = scale(women, center = T, scale = c(100, 200)))
cbind(women, round(ws2,2))









x

set.seed(1234)
x = rnorm(100,50,10)
scale(x)
hist(x)

hist(scale(x))

scale(x, center=T)
scale(x, center=2)
plot(scale(x, center=2))  # irrelevant

(marks1 = ceiling(runif(10,50,100)))
(marks2 = ceiling(runif(10,50,150)))
scale(marks1)
scale(marks1)[,1]
round(scale(marks1)[,1],2)
round(scale(marks2)[,1],2)

round(scale(marks1)[,1],2)

round(scale(marks1, center=F)[,1],2)
round(scale(marks2, center=F)[,1],2) 

round(scale(marks1, center=c(0,1))[,1],2)




#
s = sort(rexp(100))
s
range01 <- function(x){(x-min(x))/(max(x)-min(x))}
range01(s)


#
library("scales")
s=marks1
rescale(s)

rescale(marks1)
rescale(s, to=c(0,10))
rescale(s, from=c(0, max(s)))

x=marks1
round(scale(x,center=min(x),scale=diff(range(x)))[,1],3)



# Example Data
x = sample(-100:100, 50)

#Normalized Data
normalized = (x-min(x))/(max(x)-min(x))

# Histogram of example data and normalized data
par(mfrow=c(1,2))
hist(x,          breaks=10, xlab="Data",            col="lightblue", main="")
hist(normalized, breaks=10, xlab="Normalized Data", col="lightblue", main="")
par(mfrow=c(1,1))


x <- matrix(1:10, ncol = 2)
x
(centered.x <- scale(x, scale = FALSE))
centered.scaled.x <- scale(x, center = TRUE, scale = TRUE)
cov(centered.scaled.x)
