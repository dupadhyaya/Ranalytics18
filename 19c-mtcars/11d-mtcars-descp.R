#mtcars - descriptive values

head(mtcars)

#check for data type
str(mtcars)
lapply(mtcars, class)
unlist(lapply(mtcars, class)) 
#all numeric, can also be used as matrix

#sums & means of columns
head(mtcars)
colSums(mtcars)
rowSums(mtcars)
colMeans(mtcars)
rowMeans(mtcars)

#groupwise
aggregate(mtcars$mpg, by=list(mtcars$cyl), FUN=mean)
aggregate(mtcars$mpg, by=list(mtcars$cyl), FUN=min)
?aggregate
aggregate(mpg ~ cyl, data=mtcars, FUN=mean)
aggregate(mpg ~ cyl + am, data=mtcars, FUN=mean)
aggregate(cbind(mpg,wt) ~ cyl + am, data=mtcars, FUN=sum)
aggregate(. ~ am, data=mtcars, FUN=length)

aggregate(cbind(mpg,wt) ~ cyl + am, data=mtcars, FUN=function(x) c(meann = mean(x), medn = median(x) ) )


#another way
x.mean <- aggregate(cbind(mpg,wt) ~ cyl+am, mtcars, FUN=mean)
x.mean
x.max  <- aggregate(cbind(mpg,wt) ~ cyl+am, mtcars, FUN=max)
x.max
merge(x.mean, x.max, by = c("cyl", "am"))
