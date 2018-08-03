#mtcars data set - base R

?mtcars #help on dataset

mtcars #print dataset
str(mtcars) #structure of dataset
dim(mtcars)#dimensions of dataset
class(mtcars)#class
?mode
typeof(mtcars) #internal storage mode - list
mode(mtcars) #Get/set the type or storage mode of object- list
attributes(mtcars) #col and rownames
names(mtcars) #colnames
colnames(mtcars) #colnames
rownames(mtcars) #rownames

head(mtcars) #top 6 rows 
tail(mtcars) #bottom 6 rows
head(mtcars,n=3) #top 3 rows

NROW(mtcars)
length(mtcars)
length(mtcars$mpg)
summary(mtcars)
