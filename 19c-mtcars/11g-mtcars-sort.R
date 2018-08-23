#sort, rank, order, sample

head(mtcars)

#sort by mpg
sort(mtcars$mpg) # one column
sort(mtcars$mpg, decreasing = T) # one column

mtcars[order(mtcars$mpg),][1:5] #Sort DF by mpg

mtcars[order(mtcars$cyl, mtcars$mpg), c('cyl','mpg','wt')] #Sort DF by cyl, mpg

mtcars[order(mtcars$cyl, -mtcars$mpg), c('cyl','mpg','wt')] # desc mpg

rank(mtcars$mpg, ties.method = 'min')
x=c(1,2,36,3)
rank(x)

rorder =cbind(mtcars$mpg, rank(mtcars$mpg, ties.method = 'min'))

rorder[order(rorder[,2]),1:2]
