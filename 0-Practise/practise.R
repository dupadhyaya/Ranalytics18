#List
x; m1; a1; df1
g ="My First List"
h = c(25, 26,18,39)
j = matrix(1:10,nrow=2)
k = c('one','two','three')
mylist = list(title=g, ages=h, j, h)
mylist2 = list(k, mylist)
mylist2
mylist
mylist[1]
mylist[2]
mylist[[2]]
mylist[['ages']]
mylist$ages

#List end


#Factors
df1
# category type - ordered or unordered
#gender,  course, color - unordered
#grades, division, position,likertscale, ratings
summary(df1)
(grades = sample(c('A', 'B', 'C'),size=10, replace=T, prob=c(.4,.3,.3)))

df1$grades = grades
df1
summary(df1)
df1$gender = factor(df1$gender)
summary(df1)
df1$grades =factor(df1$grades, ordered=T)
df1$grades
aggregate(df1$age, by=list(df1$grades), mean)
aggregate(df1$age, by=list(df1$gender), mean)
aggregate(df1$age, by=list(df1$course), mean)
(df1$grades =factor(df1$grades, ordered=T, levels=c('C','B','A')))

(division = sample(c('Excellent', 'Very Good', 'Sat'),size=10, replace=T, prob=c(.4,.3,.3)))
division
summary(division)
Fdivision = factor(division)
summary(Fdivision)
Fdivision2 = factor(division, ordered=T, levels=c('Sat', 'Very Good', 'Excellent'))
summary(Fdivision2)
Fdivision2
Fdivision3 = factor(division, ordered=T)
summary(Fdivision3)
Fdivision3
#factors end


#Data Frame
(rollno = 1:10)
(sname = paste('Student',1:10,sep='-'))
(age = floor(runif(10, 20, 30)))
(gender = c(rep('M',5),rep('F',5)))
(course = sample(c('Engg','Medical','MBA'), 10, replace=T, prob=c(.3, .4, .3)))
table(course)
(married = sample(c(TRUE, FALSE), 10, replace=T))
table(married)
rollno; sname; age ; gender; course; married

(df1 = data.frame(rollno, sname, age , gender, course, married))
df1[1:2,3:4]
df1$sname
df1[df1$married==T,  ]
df1[df1$course=='Engg' & df1$age > 25,  ]
df1[df1$married==T & df1$course=='Engg' & df1$age > 25, c('sname') ]
?aggregate
aggregate(df1$age, by=list(df1$gender), FUN=mean)
aggregate(df1$age, by=list(df1$course), FUN=mean)
aggregate(df1$age, by=list(df1$course, df1$gender), FUN=mean)


df1
summary(df1)

#DF end








#Array
?array
array(data = NA, dim = length(data), dimnames = NULL)
#Coys - 5, Products-3, Locations-4
ceiling(3.2);

(salesfig = floor(runif(60, 70, 100)))
(a1 = array(data = salesfig, dim = c(4,3,5), dimnames = list(paste('Loc',1:4),paste('Prod',1:3),paste('Coy',1:5))))
apply(a1,1, sum)# sum locationwise
apply(a1,2, sum)
apply(a1,3, sum)
(ma1 = apply(a1,c(1,3), sum))
colSums(ma1)
rowSums(ma1)

apply(a1,c(2,3), sum)




#arrayend


#Matrix
#row x columns
?rnorm
set.seed(1234)
(x = trunc(runif(24,100,500)))
(m1 = matrix(data=x, nrow=4,dimnames = list(c('delhi','mumbai','noida','chennai'),paste('Prod',1:6,sep="-"))))
colMeans(m1);rowMeans(m1)
colSums(m1); rowSums(m1)
pie(x=rowMeans(m1))
barplot(rowMeans(m1))  # barplot for locations
barplot(colMeans(m1))  #barlplot for products
barplot(colMeans(m1), horiz = T)
barplot(colMeans(m1), horiz = T, col=1:6)
m1
#Subset a Matrix
m1[ , 1:2]
m1[ ,c(1,4)]
m1[c(1,3) ,c(1,4)]
m1[c('delhi','mumbai'),c('Prod-3')]
m1[m1 > 300]
m1
m1[c('delhi'),]
sd(m1[c('delhi'),])
sum(m1[c('delhi','mumbai'),c('Prod-3','Prod-4')])

#m end

(m2 = matrix(data=x, nrow=4, byrow = T))
(m3= matrix(x, ncol=4 ))
(m4 = matrix(c(1,2,3,4), nrow=2, ncol=4,byrow=T))
m1




# Vectors
snames = string (single char, multiple char)
marks1 = numeric(integer, decimal)
married - true or F
gender = categories
snames = c('student1', "student2", 'student3')
snames
class(snames)
marks = c(10, 20 ,30)
marks
class(marks)
married = c(TRUE, FALSE, TRUE)
married
class(married)
snames; marks; married
(age = c(30,35,26))
age = c(30,35,26)
age
?class

#subsetting a Vector
(x1 = 1:100)
(x2 = seq(50,100,3))
?seq
x1
x1[10]
x1[20:30]
x2[2:5]
x1[x1 > 50]
x2
x2 > 70
x2[(x2 > 70) | (x2 < 60)]
x2[c(FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,  TRUE,  TRUE,  TRUE,TRUE,  TRUE,  TRUE,  TRUE,  TRUE,  TRUE,  TRUE)]
x2
#operations on the vector
x3 = c('A','B','C')
x3[c(1,3)]
x3[c(TRUE, FALSE, TRUE)]
x3[(x3=='A') | (x3=='C')]

x2[(x2 > 60) & (x2 < 70)]
x2[x2==69]
x2==69

x2
length(x2)
length(x1)
mean(x2)
sum(x2)/length(x2)
sum(x2)
median(x2)
x2

set.seed(1)
(x4 = trunc(runif(20,5,100)))
median(x4)
(shirtcolors = c("red",'blue','green','blue','green', 'blue'))
mean(shirtcolors)
table(shirtcolors)

sort(x4)

mtcars$mpg
mean(mtcars$mpg)
women
data()
?mtcars

snames

x = rnorm(1000000, 50,10)
head(x)
mean(x)
hist(x)
