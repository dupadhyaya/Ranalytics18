# Apply Family - by
# used for DF split by factors
mtcars
# we can take am, gear or carb as factors
by(data, INDICES, FUN, ..., simplify = TRUE)
split(mtcars, mtcars$am)
mtcars$am; mtcars$mpg
by(mtcars$mpg,mtcars$am, FUN=mean )

# wrapper for tapply
by(warpbreaks[, 1:2], warpbreaks[,"tension"], summary)
by(warpbreaks[, 1:2], warpbreaks[,"tension"], mean)  # will not work


# what works and what not
by(iris$Sepal.Width , iris$Species , summary )
by(iris, iris$Species, length)
by(x=mtcars, mtcars$am, function(x) mean(x))  # will not work
by(iris, iris$Species, mean) # will not work
by(iris$Sepal.Width, iris$Species, mean)


# DF or matrix
df=data.frame(a=c(1:15),b=c(1,1,2,2,2,2,3,4,4,4,5,5,6,7,7))
#sum of all values of a grouped by values of b. 
#That is, sum of all values of a where b=1, sum of all values of a where b is 2 and so on
by(df,factor(df$b),sum) # by(df,df$b,sum) also works
df
df2=data.frame(a=c(1:15),k=c(1:15),b=c(1,1,2,2,2,2,3,4,4,4,5,5,6,7,7))
by(df2,factor(df2$b),sum)
df2

?by
# mtcars
bo1 = by(data= mtcars[,'mpg'], INDICES=mtcars[,'cyl'], summary)
#bo2 = by(data= mtcars[,'mpg'], INDICES=mtcars[,'cyl'], summary, simplify=T)
str(bo1)
#str(bo2);
by(data= mtcars[,'mpg'], INDICES=mtcars[,'cyl'], max)
by(data= mtcars[,'disp'], INDICES=mtcars[,c('vs','am')], mean)

by(data= mtcars[,c('disp','wt')], INDICES=mtcars[,c('vs','am')], mean)  # not work
aggregate(mtcars[,c('disp','wt')], mtcars[,c('vs','am')], mean)

by(data= mtcars[,c('disp','wt')], INDICES=mtcars[,c('vs','am')], summary)
