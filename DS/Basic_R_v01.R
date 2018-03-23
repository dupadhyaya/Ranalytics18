

#BASICS ABOUT R =================================

x<-10+20                  # Simple Math
x


10+20 -> x                # "<-" Assignment Operator
x                         # Print the x value
y = 1:10                  # Assign values
y
1:250                     # Prints range of numbers 
print("My First Program") # Prints data in console


#R objects =================================

x <- 1:1  # put the numbers 1-10 in the variable X - Assignment operator (= or <-)
1:10 -> x1                     # you can also assign the same
x1
y <- c(11,12,13,14,15)         # concate nate function , puts the numbers into y
a<- b<- c <-3                  # multiple assignments
x+y                            # adds corresponding elements in x & y
x*2                            # Multiplication by each element with 2

a
b
c

# DATA TYPES ============================================

# Numeric -------------------------------------------
1.7                        # Decimal mark is a dot
options(scipen=999)
7.8e3                      # One can use scientific notation
-1/0                       # Infinity is marked as inf or -inf 

4/6799                     # Formatting numbers
format(4/6799, sci = TRUE) # Formatting numbers
format(4/6799, digits = 2) # Formatting numbers

round(pi, 2)                # Rounding


# Logical -----------------------------------------------

2 == 5       #is 2 equal to 5?

(2 != 2)     # ! means negation
!(2 == 2)    # ! means negation

(2 == 2) & (5 == 5)     # & - logical conjunction  
(2 == 2) | (5 != 5)     # | - logical alternative 

# Character ------------------------------------------------------

"Meeting in with  R"                                                  # strings should be enclosed with ' or "
paste("I learn R", 'and use R')    # Concatenation of strings


# Special --------------------------------------------------

1/0                    # Inf, -Inf
-1/0                   # Inf, -Inf
log(-1)                # Not a number
NA                     # NA - Missing values
NULL                   # NULL


# Factor --------------------------------------------------
f1 = c("girl", "boy", "boy", "girl", "boy")
f1
class(f1)
f <- factor(c("girl", "boy", "boy", "girl", "boy" , "child")) 
f
class(f)
# Categorical variables

# DATA STRUCTURES ===========================================

# Vectors # set of objects of the same type, one dimensional --------------------------------------------

my_vector <- c(-1, 2, 6, 6.7, 2, 0.45, 2, 4)    # defined with a c() function (c for concatenate), vectors are vertical)  # Numeric vector

mode(my_vector)
typeof(my_vector)
class(my_vector)
is.numeric(my_vector)



is.character(my_vector)

is.data.frame(my_vector)

x5 <- c(5, 4, 2, 3, 1,6,8,9)   #concatenation
x7 <- c(3, 4, 2)
x8 <- c("HA", "DL","MH","AP")  # Character Vector

x7+x5                          # sum of vectors
data <- c(x5,x7)               # concatenation of vectors
data

(my_vector2 <- 2 * my_vector)  # Computations with numeric vectors
my_vector * c(2, 3)           
my_vector + c(2, 3, 4)

# Character vector
(my_char_vector <- c(4, 2, "Hello, world!"))

mode(my_char_vector)
typeof(my_char_vector)
class(my_char_vector)
is.numeric(my_char_vector)

# Maths operations
sqrt(my_vector)        # NaN (not a number) produced as a resulting of squarting negative values
log(my_vector)         # etc.
sum(my_vector)         # sum
prod(my_vector)        # product


# Useful functions
length(my_vector)     # vector's length
unique(my_vector)     # distinct values of the vector
head(my_vector, 3)    # displays first 3 elements of my_vector
tail(my_vector, 2)    # displays last 2 elements of my_vector
sort(my_vector)       # sorts my_vector
order(my_vector)      # returns the order of my_vector
rev(my_vector)        # reverts the order of elements in my_vector
which.max(my_vector)  # return position of the max value
which.min(my_vector)  # return position of the min value
rank(my_vector)       # rank elements

#()[]

# Indexing
my_vector[3]
my_vector[-2]
my_vector[1:4]
my_vector[-(1:7)]
my_vector[-c(2,4,7,5)]
my_vector[my_vector > 3]
which(my_vector > 3)
my_vector[my_vector > 0 & my_vector < 4]
my_vector[my_vector %in% 5:7]
match(my_vector, 1:3)
my_vector[c(rank(my_vector)) == 2]
my_vector[order(my_vector)]

my_vector2 = c("a", "b")
my_vector = c(1,2)
# Combining two vectors
c(my_vector, my_vector2)
cbind(my_vector, my_char_vector)
rbind(my_vector, my_char_vector)
cbind(my_char_vector,my_vector)
rbind(my_char_vector,my_vector)

# Sequences
4:7
seq(0, 1, length.out = 16)
t =seq(1, 9, by = 2)
t
seq(1, 8, by = 2) 
seq(9, 1, by = -2) 
seq(17) 

all(seq(17) == 1:17)

1:10 -> x1
x1

rep(1:4, 2)
rep(1:4, each = 2)      
rep(1:4, c(2, 1, 2, 3))
rep(1:4, each = 2, len = 10)  


rep(1:4, each = 2, times = 3)


# Matrix --------------mxn--------------------------------

# Defined with a matrix() function with 3 arguments: 
#vector of values, number of rows, number of columns

(my_matrix <- matrix(c(4, 2, 7, 9), nrow=2, ncol=2))
(my_matrix <- matrix(c(1, 2, 3, 4), 4, 1))
(my_matrix <- matrix(c(1, 2, 3, 4), 2, 2, byrow=TRUE))

#transpose
myMat_Transposed <- t(my_matrix)


my_matrix[1, 2]
my_matrix[, 1]
my_matrix[1, ]

dim(my_matrix)                # Dimesnion of matrix
det(my_matrix)                # Determinant
eigen(my_matrix)              # Eigenvalues/Eigenvectors
(t(my_matrix) %*% my_matrix)  # Transpose and multiply

rowSums(my_matrix)            # Sum of rows
colSums(my_matrix)            # Sum of colums
rowMeans(my_matrix)           # Avgs of rows
colMeans(my_matrix)           # Avgs of colums


# Array -------------------------------------------------

# Defined with a array() function with 3 arguments: 
#vector of values, dimensions, dimension names

our_dim_names <- list(dimension1 = c("A", "B", "C", "D"), 
                      dimension2 = c("a", "b", "c"),
                      dimension3 = c("1", "2"))

(my_array <- array(data = 1:24, dim = c(4,3,2), 
                   dimnames = our_dim_names))

dim(my_array)

# Indexing
my_array[3, 2, 1]
my_array[3, 2, ]
my_array[3, , ]


# List ------------------------------------------------

# Set of objects that can have different types # Defined with the list() function
(my_list <- list(name = c("Analytics", "Labs"), 
                 age = 3, 
                 club = "Bulls", 
                 matrix = my_matrix))

(my_list2 <- list(c("Analytics", "Labs"), 
                  3, "Bulls",
                  my_matrix))



mode(my_list)

typeof(my_list)
class(my_list)

# Indexing
dim(list)
my_list$name
my_list[1]
my_list[[1]]
my_list[[1]][2]
names(my_list2)      #lists all names of the list


# Data frame ---------------------------------------------

# table with the same type within a 
#column and different types between columns 
# defined with a data.frame() function

my_df <- data.frame(id = c(1, 2, 3), 
                    name = c("Analytics", "a", "b"), 
                    Goals = c(50, 49, 25))

my_df 

dim(my_df)

str(my_df)
summary(my_df)
















# Workspace & Environment -----------------------------------------------------

getwd()                       # Get working directory
setwd("C:/")                  # set working directory
ls()                          # List elements of the environment

rm(x)                         # remove an object from workspace
rm(a,b)                       # remove multiple object from workspace
rm(list=ls())                 # clear workspace

# Ctrl - L ... Clear Console


# Installing & managing packages -------------------------------------------------------------------------------------------


install.packages("ggplot2")   # TO install packages # download packages from CRAN and install in R
library("ggplot2")            # make package available ; often used for loading in scripts
require("ggplot2")            # prefered for loading in functions; may be better
library(help="ggplot2")       # brings up documentation  in editor window
update.packages("ggplot2")    # check for pacakge updates; do it regularly
detach("package:ggplot2", unload=TRUE) # Unload/Remove  packages # by default, all loaded packges are unloaded when R quits.
remove.packages("ggplot2")    # TO permanantly remove it.   

#Datasets -----------------------------------------------------------------------------------------------------------------------
?datasets                     # Using R's built in data sets

library(help=datasets)
library(datasets)

data(mtcars)                 # Loading mtcars data set
cars <-mtcars                # Save the data into workspace
detach(package:datasets)     # To remove the datasets package

# Viewing data set
mtcars                       # Total data set in console
View(mtcars)                 # Viewing dataset in spreadsheet
head(mtcars,10)              # Viewing top-10 observations (default: top-6)
tail(mtcars)                 # Viewing bottom 10 observations
str(mtcars)                  # Viewing data dictionary
names(mtcars)                # Viewing column names

v1 = mtcars$disp
newvar <- mtcars$disp + mtcars$hp
v1 <- mtcars$mpg             # Assigning single variable from mtcars data to v1
v2 <- mtcars$cyl
v3 <- mtcars$disp
v4 <- mtcars$hp

mtcars1<-rbind(v1,v2,v3,v4) # Combined as rows #Horizontal joins
head(mtcars1)
mtcars2<-cbind(v1,v2,v3,v4) # Combined as columns # Vertical joins

# DATA IMPORT =================================================================

setwd("E:\\HHges - Mkt Anyts\\Marketing Analytics\\R Programming")




# Import from csv -------------------------------------------------------------

# Specify file
file <- paste0(path,"\\", "Car_data_cf.csv")
data_cf <- read.csv(file)


# DATA EXPORT =================================================================

# Export to csv ---------------------------------------------------------------

file <- paste0(path, "MyRClassDemo.csv")        # Specify file
write.csv(cars, file)                              # Export file
dir(path)

# Export to RData file --------------------------------------------------------

path <- getwd()                                       # Save entire environment
save.image(file = paste0(path, "environment.RData"))  
save(fpe, file = paste0(path, "data.RData"))         # Save single R objects
load(file = paste0(path, "data.RData"))               # Load RData file(s)

# Let's Import and build a function -----------------------------------

setwd("E:\\HHges - Mkt Anyts\\Marketing Analytics\\R Programming")
mydata<-read.csv("sample_file.csv")
View(mydata)
str(mydata)
modelname <- mydata$Age
modelname
# user written function for creating descriptive statistics
mystats <- function(x) {
  nmiss<-sum(is.na(x))
  a <- x[!is.na(x)]
  m <- mean(a)
  n <- length(a)
  s <- sd(a)
  min <- min(a)
  p1<-quantile(a,0.01)
  p5<-quantile(a,0.05)
  p10<-quantile(a,0.10)
  q1<-quantile(a,0.25)
  q2<-quantile(a,0.5)
  q3<-quantile(a,0.75)
  p90<-quantile(a,0.90)
  p95<-quantile(a,0.95)
  p99<-quantile(a,0.99)
  max <- max(a)
  UC <- m+3*s
  LC <- m-3*s
  outlier_flag<- max>UC | min<LC
  return(c(n=n, nmiss=nmiss, outlier_flag=outlier_flag, mean=m, stdev=s,min = min, p1=p1,p5=p5,p10=p10,q1=q1,q2=q2,q3=q3,p90=p90,p95=p95,p99=p99,max=max, UC=UC, LC=LC ))
}

vars <- c("Age"	,	"Sales" )
str(mydata[vars])
stats<-t(data.frame(apply(mydata[vars], 2, mystats)))
View(stats)

## OUTLIERS

mydata$Sales[mydata$Sales>971169.4] <- 971169.4
vars <- c("Age"	,	"Sales" )
str(mydata[vars])
stats<-t(data.frame(apply(mydata[vars], 2, mystats)))
View(stats)

# Writing Summary stats to external file

write.csv(stats, file = "stats.csv")


## Missing value treatment
mydata <- mydata[!is.na(mydata$Cust_id),] # dropping obs where Gender=missing
install.packages("Hmisc")
require(Hmisc)
?apply
mydata1<-data.frame(apply(mydata[vars],2,  function(x) impute(x, mean))) #Imputing missings with mean for IV's



mydata$Location
aggdata1 <- aggregate(x=mydata[,3],
by = list( mydata$Location),
                     FUN = mean,
                     na.rm = TRUE)
aggdata1


#*************************************/

install.packages("swirl")
library(swirl)


#**********************************/


######################################## Loops & Advanced R #####################

#initialize a variable
N <- 10

#check if this variable * 5 is > 40
if (N * 5 > 40){
  print("This is easy!")
} else {
  print ("It's not easy!")
}



#initialize a vector
y <- c(99,45,34,65,76,23)

#print the first 4 numbers of this vector
for(i in 1:4){
  print (y[i])
}



for (i in seq(0, 10, 2)) print(i)


#initialize a condition
Age <- 12

#check if age is less than 17
while(Age < 17){
  print(Age)
  Age <- Age + 1 #Once the loop is executed, this code breaks the loop
}

# Creating Histogram

cars
head(cars)
cars$dist

hist(cars$speed)
plot(cars$dist)
plot(cars$speed)

hist(cars$dist, col = "Grey", border = "green")

data()

data(mtcars)

data(iris)

head(iris, 5)

head(mtcars, 5)

rm(iris)

mtcars

str(mtcars)

# Summary of the data
summary(mtcars$mpg)
hist(mtcars$wt)
hist(mtcars$hp, col = "green", main = "Histogram of HP")

mtcars

str(mtcars)


#Creating new variable basis the already existing ####
str(iris)
Iris1 <- transform(iris,
                   sumx = Sepal.Length + Sepal.Width,
                   meanx = (Sepal.Width + Sepal.Length) / 2)

iris <- transform(iris,
                  sumx = Sepal.Length - Sepal.Width,
                  meanx = (Sepal.Width + Sepal.Length) / 2)
rm(Iris)

# Converting from one data type to another ####
a <- c(1, 2, 3)
a
is.numeric(a)
is.vector(a)
a <- as.character(a)
a
is.numeric(a)
is.vector(a)
is.character(a)


# Transposing a dataset ####
cars
t(cars)


#  Aggregating data ####
options(digits = 3)
attach(mtcars)
summary(mtcars)
summary(mtcars$disp)
head(mtcars)
?aggregate
aggdata <- aggregate(mtcars,
                     by = list(cyl, gear),
                     FUN = mean,
                     na.rm = TRUE)
aggdata
detach(mtcars)

mtcars




# one way table ####
library(vcd)
Arthritis
table(Arthritis$Improved)
mytable <- with(Arthritis, table(Improved))
mytable # frequencies
prop.table(mytable) # proportions
options(digits = 3)
prop.table(mytable) * 100 # percentages
addmargins(mytable)

# two way table ####
mytable <- xtabs( ~ Treatment + Improved, data = Arthritis)
mytable # frequencies

#Two way table using CrossTable ####
install.packages("gmodels")
library(gmodels)
CrossTable(Arthritis$Treatment, Arthritis$Improved)
