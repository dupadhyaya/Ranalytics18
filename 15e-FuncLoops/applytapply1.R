# apply TAPPLY

#tapply - For when you want to apply a function to subsets of a vector 
#and the subsets are defined by some other vector, usually a factor.

#The black sheep of the *apply family, of sorts. 
#The help file's use of the phrase "ragged array" can be a bit confusing, 
#but it is actually quite simple.


(x <- 1:20)
#A factor (of the same length!) defining groups:
(y <- factor(rep(letters[1:5], each = 4)))
#Add up the values in x within each subgroup defined by y:
cbind(x, y)

tapply(x, y, sum)  
#a  b  c  d  e  
#10 26 42 58 74 

#More complex examples can be handled where the subgroups are 
#defined by the unique combinations of a list of several factors.
#tapply is similar in spirit to the split-apply-combine
#functions that are common in R (aggregate, by, ave, ddply, etc.)
#Hence its black sheep status.

tapply(iris$Sepal.Length, iris$Species, mean)
tapply(mtcars$mpg, mtcars$cyl, sd)
