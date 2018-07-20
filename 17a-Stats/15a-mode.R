#mode

mtcars
head(mtcars)
(t1= table(mtcars$cyl))

max(table(mtcars$cyl))

which.max(table(mtcars$cyl))

names(t1)[which(t1==max(t1))]

subset(mtcars, cyl==8)
subset(mtcars, cyl==names(t1)[which(t1==max(t1))])


#two modes
#Testing if there are two or more numbers with same frequncy
x <- c(8,2,7,1,2,9,8,2,10,9,8)
sort(x)
##  [1]  1  2  2  2  7  8  8  8  9  9 10
#Mode
table(x)
names(table(x))[table(x)==max(table(x))]
## [1] "2" "8"
