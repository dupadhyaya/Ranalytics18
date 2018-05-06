# R Programming
?mean
x <- c(0:10, 50)
x
x[c(seq(1,12,2))]
?c
seq(2,100,2)

?seq
xm <- mean(x)
xm
mean(x, trim = 0.10)

# Scalar
(x <- 1)
x = 1
# Vector
c(1:5)
x = c(1,2,3,4,10,5,5,3,2,5,7,7,8,9)
mean(x); median(x)
sort(x)

table(x)

library(modeest)
mlv(x, method = "lientz", bw = 0.2)

ratings =c(rep('Good',5), rep('Poor',3))
ratings
table(ratings)
barplot(table(ratings))



rollno = c(10,22,44,23)
sales = runif(12, 50, 100)
sales
plot(sales, type='b')
?plot

?runif


str(x)
y = c('abhinav', 'Rishi', 'Shreya')
str(y)
z = c(TRUE, FALSE, TRUE, FALSE)
str(z)


abinav=c(1,3,6,8,6,3,100,rep(NA,5))
abinav
str(abinav)
is.na(abinav)
anyNA(abinav)
mean(abinav,na.rm=T)

mean(x=abinav)
mean(x=abinav,trim=0.4, na.rm=T)
x = c(TRUE, FALSE, TRUE)
mean(x)
mean(c(1,0,1))

#Categorical Data
product = c('maggi', 'topramen', 'hakka')
product
shirtcolor = c('green', 'red', 'blue', 'black')
shirtcolor
rating = c('Excellent', 'Very Good', 'Good', 'Average', 'Poor' )
rating
str(rating)
performance = c( 1, 2, 3, 4, 5)
str(performance)

decision = c('buy', 'sell')
decisionTF = c(TRUE, FALSE )
str(decision); str(decisionTF)
grades = c('A','C','B','D','E','B')
grades
grades1 = factor(grades, ordered=T, levels=c('E','D','A','B','C'))
grades1
itemssold = c(10, 20, 30, 25)


#Nominal Data
product

#Ordinal Data
performance
#need to create order
performance=c(1,2,5,2,5,2,5,2,5)
length(performance)
performance
str(performance)
performance[9] = 100
performance

performance1 = factor(performance, ordered=TRUE, levels=c(4,2,5,1,3,8,100))
performance1[1] = 100

table(performance1)
performance1



rating
rev(rating)
rating1 = factor(rating, ordered=T, levels=rev(rating))
rating1

grades
grades1 = factor(grades, ordered=T, levels=c('F','E','D','C','B', 'A'))
grades1
summary(grades1)

# -----
#vectors, factors
#list matrix
?matrix
mdat <- matrix(c(1,2,3,11,12,13), nrow = 2, ncol = 3)
mdat[1,1] ='dhiraj'              
mdat               
(x = 1:24)               
(matx = matrix(x, nrow=6, byrow=TRUE))               
?data.frame



(salemon = month.abb[1:12])
salemon = factor(salemon, ordered=T,levels=month.abb[1:12])
salemon
(sales1 = runif(12, min=50, max=100))
salemon; sales1
(adamt = runif(12, min=12, max=25))
(salesmonthwise = data.frame(salemon, sales, adamt))
rownames(salesmonthwise) = month.abb[1:12]
salesmonthwise
colnames(salesmonthwise) = c('col1','col2','col3')

salesmonthwise[1:5,1:3]
?head
head(salesmonthwise,n=3)
head(salesmonthwise[c(1,3)],n=3)
head(salesmonthwise[c('col1','col2')],n=3)
salesmonthwise[c('Jan'),c('col1','col2')]
salesmonthwise[salesmonthwise$col3 < 20,c(1,2,3)]

colSums(salesmonthwise[-1])
rowSums(salesmonthwise[-1])

# Day3

# Data Properties
set.seed(10)
?rnorm
sales1 = rnorm(100, mean=50, sd=10)
sales1
range(sales1)
hist(sales1)
plot(density(sales1))
abline(v=50)

set.seed(1)
sales3 = runif(10,1,5)
sales3
mean(sales3)
set.seed(1)
sales4 = runif(10,1,5)
sales4
mean(sales4)


names = c('A', 'B', 'C')
?sample
v1= sample(x=names, size=4, replace = FALSE, prob = c(.2,.3,.5))
v1
table(v1)


sales2 = rnorm(100, mean=60, sd=12)
sales2
plot(density(sales2))
abline(v=60)
sales3= c(1,5,2,5,2,3,6,7,8,4,5)
sales3
#


shirtcolor = c('green', 'red', 'blue', 'black')
sellitems = sample(shirtcolor, 20, replace=T, prob=c(.4,.3,.2,.1)) 
sellitems
summary(sellitems)
table(sellitems)

grades = c('A','C','B', 'D','E', 'B', 'A', 'B', 'A', 'C','F')
grades1 = factor(grades, ordered=T, levels=c('F','E','D','C','B', 'A'))
grades1


#Location / Central Tendency
mean(sales1)
mean(sales2)
mean(sellitems)
mean(grades)
mean(sales3)

#Middle Values
median(sales1)
median(sales2)
median(sales3)
sort(sales3)
quantile(sales3)

median(sellitems)
median(grades1)


#Mode
mode(sales1)  # error
library(modeest)
mlv(sales1, method='mfv')
mlv(sales2, method='mfv')
mlv(sales3, method='mfv')
mlv(sellitems, method='mfv')
mlv(grades1, method='mfv')
table(sale3)
table(sellitems)
table(grades1)
which.max(table(grades1))



# Graphical Way
mean(sales1)
hist(sales1)
plot(density(sales1))
abline(v=50)

sales2 = rnorm(100, mean=60, sd=12)

sales2
range(sales2)
hist(sales2, prob=T)
?hist
lines(density(sales2), col='red')
abline(v=60, col="green")
abline(h=.02, col="red")

# Combine Plots
plot(density(sales1), col='green', ylim=c(0,0.05))
lines(density(sales2), col="blue", lwd=2)
abline(v=c(50,60), col=c('green', 'blue'), lwd=3)
