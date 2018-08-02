student = read.csv("student.csv",stringsAsFactors = F)
student
library("dplyr")
mutate(student, avgmarks = JAVA/2)
str(student)
my_data <- as_data_frame(student)
str(my_data)
student = read.csv("student.csv", header=T, na.strings=c("","NA"), stringsAsFactors = F)
student$ser = NULL
head(student)
row.names(student) = student$rollno
#------------
x <- c(a = 1, b = 2,c=3,d=4)
class(x)
str(x)
x
y=c(1,2,3)
seq(5,11,along.with = y)

# first code --------------------------------------------------------------

# second code ------------------------------------------

# abc ---------------------------------------------------------------------



# 19 Nov 16 Split and combine

cyl=c(4,4,8,6,8,4,6,4)
mpg=c(36,38,21,28,19,35,25,32)
hp=c(100,93,340,258,365,97,240,103)
brand=c("Ford","Honda","Nissan","Nissan","Honda","Honda","Ford","Ford")

myCars = data.frame(cyl,mpg,hp,brand)
myCars$cyl = factor(myCars$cyl)
# str(myCars)
myCars
# split on factors
splitCars = split(myCars, myCars$cyl)
splitCars

#Linear Problems
res <- c(2,2,3,3)
mat <- matrix (c(14, 8, 16, 6, 5, 3, 7, 6, 5, 4, 3, 1, 2, 4, 7, 9), ncol=4)
solve (mat)

# 20 Nov 16
our.data = scan()
