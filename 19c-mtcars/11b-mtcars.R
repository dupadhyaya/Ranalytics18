#mtcars data set - base R

?mtcars #help on dataset

mtcars #print dataset
str(mtcars) #structure of dataset
#can be used a matrix
dim(mtcars)#dimensions of dataset
class(mtcars)#class
typeof(mtcars) #internal storage mode - list
mode(mtcars) #Get/set the type or storage mode of object- list
attributes(mtcars) #col and rownames
names(mtcars) #colnames
colnames(mtcars) #colnames
rownames(mtcars) #rownames

head(mtcars) #top 6 rows 
tail(mtcars) #bottom 6 rows
head(mtcars,n=3) #top 3 rows
dim(mtcars)
NROW(mtcars)
length(mtcars) #variables nos
length(mtcars$mpg)  #length of the vector
summary(mtcars)
ncol(mtcars) #matrix
nrow(mtcars)
View(mtcars)
