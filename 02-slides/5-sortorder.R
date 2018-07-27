#Sort Order and Rank

set.seed(123)
#Vector
(marks = ceiling(runif(11,5,10)))

sort(marks)
sort(marks, decreasing = TRUE)
rev(sort(marks))

order(marks) #index values
marks[order(marks)] #this is marks
marks[order(-marks)] #this is marks


#DF
(df1=mtcars)
df[order(mtcars$mpg),c(1:5)]
df[order(mtcars$mpg, decreasing=T),c(1:5)]
df[order(mtcars$cyl, -mtcars$mpg),c('cyl','mpg','wt','hp')]

#rank
rank(marks)
