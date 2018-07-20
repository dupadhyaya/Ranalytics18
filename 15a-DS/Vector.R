#Datatypes:  string- name, location, department
# Number--- age, salary, weight, height
# Boolean/Logical---- TRUE/FALSE



snames = c('student1', "student2", 'student3')
class(snames)
marks = c(10, 20 ,30,50 ,60,40)
marks
class(marks)
married = c(TRUE, FALSE, TRUE)
married
class(married)
snames; marks; married
(age = c(30,35,26))
age = c(30,35,26)
age



#subsetting a Vector
(x1 = 1:100)
(x2 = seq(50,100,3))
?seq
?class
x3 = seq(from= 100, to= 200, by=2)

x1
x1[10]
x1[20:30]
x2[2:5]
x1[x1 > 50]
x2
x2 > 70
x2[(x2 > 70) | (x2 < 60)]
x2[c(FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,  TRUE,  TRUE,  TRUE,TRUE,  TRUE,  
     TRUE,  TRUE,  TRUE,  TRUE,  TRUE)]
x2
#operations on the vector
x3 = c('A','B','C')
x3[c(1,3)]
x3[c(TRUE, FALSE, TRUE)]
x3[(x3=='A') | (x3=='C')]

x2[(x2 > 60) & (x2 < 70)]
x2[x2==69]
x2==69

x2
length(x2)
length(x1)
mean(x2)
sum(x2)/length(x2)
sum(x2)
median(x2)
x2

set.seed(1)

X5 <- sample(1:10,50,replace = TRUE )
(x4 = trunc(runif(20,5,100)))
median(x4)
(shirtcolors = c("red",'blue','green','blue','green', 'blue'))
mean(shirtcolors)
table(shirtcolors)

sort(x4)





test_matrix <- matrix(data=marks,nrow = 3, byrow = TRUE)

test_list <- list(snames, marks, married)

class(test_list)

qt <- c("Time", 24, "October", TRUE, 3.33) 

class(qt)

