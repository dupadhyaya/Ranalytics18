#with by
#functions that can help write simpler and more efficient code.

#by function, as stated in the documentation can be though, 
#as a "wrapper" for tapply. The power of by arises when we want to compute a task that tapply can't handle. One example is this code:

(ct <- tapply(iris$Sepal.Width , iris$Species , summary ))
(cb <- by(iris$Sepal.Width , iris$Species , summary ))


#ct and cb, we "essentially" have the same results and the only differences are in how they are shown and 
#the different class attributes, respectively by for cb and array for ct.

tapply(iris, iris$Species, summary )
#Error in tapply(iris, iris$Species, summary) : 
#  arguments must have same length
#we want to calculate the summary of all variable in iris along the factor Species":
#but R just can't do that because it does not know how to handle.

#by function R dispatch a specific method for data frame class and
#then let the summary function works even if the length of the first argument (and the type too) are different.

#Sums the 1st elements, the 2nd elements, etc. 
mapply(sum, 1:5, 1:5, 1:5) 
[1]  3  6  9 12 15
#To do rep(1,4), rep(2,3), etc.
mapply(rep, 1:4, 4:1)   


# object of class by that along Species (say, for each of them) computes the summary of each variable.
# 
# Note that if the first argument is a data frame, 
# the dispatched function must have a method for that class of objects. 
# For example is we use this code with the mean
#function we will have this code that has no sense at all:

#if the first argument is a data frame, the dispatched function 
#must have a method for that class of objects.
#For example is we use this code with the mean function we will have this code that has no sense at all:
  
by(iris, iris$Species, mean)
# cannot have mean of all variables
split(iris, iris$Species)

(bywork <- by(iris, iris$Species, summary ))

by(iris, iris$Species, length)

iris
# with----------------------

rm(list=ls())
?with  # temp opening data
with(data=mtcars, mean(mpg)) # list, df

with(data=mtcars,c(mean(mpg), mean(wt))) # list, df
# within : modifies the data 
df2 = within(data=mtcars, c(mean(hp), mean(wt)))
df2
with(data=mtcars, aggregate(by=list(cyl), FUN=mean))
by(x=mtcars, mtcars$am, function(x) mean(x))


load('./data/du3.RData')
str(df2)
by(df2, df2$course, FUN=summary)
by(df2[,'sql'], df2$gender, FUN=function(x) mean(x))

names(df2)
#with ------
#applys an expression to a dataset. I
# with(data, expression)
# example applying a t-test to a data frame mydata 
with(mydata, t.test(y ~ group))




#by -----
#by( ) function applys a function to each level of a factor or factors. It is similar to BY processing in SAS.

# by(data, factorlist, function)
# example obtain variable means separately for
# each level of byvar in data frame mydata 
by(mydata, mydata$byvar, function(x) mean(x))
