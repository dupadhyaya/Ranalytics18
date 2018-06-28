# Read only selected columns from csv file

student = read.csv("./data/student.csv")
str(student)
names(student)
# [1] "rollno"     "sname"      "feepaid"    "gender"     "cat"        "dob"       
# [7] "age"        "class10"    "class12"    "sem1"       "sem2"       "attnd"     
# [13] "batch"      "batchyr"    "br"         "city"       "java"       "dbms"      
# [19] "dwm"        "vlsi"       "cpp"        "cbnst"      "btechmarks" "finalgrade"
# [25] "btechfinal" "cgpa" 


student = read.csv("./data/student.csv", stringsAsFactors = F)
str(student)
names(student)

student = read.csv("./data/student.csv" , row.names = 1)
head(student)[1:5]
str(student)
dim(student)
row.names(student) == 102001 # check for particular rowname/rollno

colcls = c(NA,'character','numeric','factor', 'factor', rep('NULL',21))
student = read.csv("./data/student.csv" , colClasses = colcls)
dim(student)
head(student)
str(student)

setAs("character","myDate", function(from) as.Date(from, format="%d-%b-%y") )
#ignore error from above line output
colcls = c(NA,'character','integer','factor', 'factor', 'myDate', 
           rep('NULL',17))
student <- read.csv("./data/student.csv", colClasses=colcls, header=T)
str(student)
head(student)

# [1] "rollno"     "sname"      "feepaid"    "gender"     "cat"        "dob"       
# [7] "age"        "class10"    "class12"    "sem1"       "sem2"       "attnd"     
# [13] "batch"      "batchyr"    "br"         "city"       "java"       "dbms"      
# [19] "dwm"        "vlsi"       "cpp"        "cbnst"      "btechmarks" "finalgrade"
# [25] "btechfinal" "cgpa" 
# 
colcls = c(NA,'character','integer','factor', 'factor', 'myDate',
           'integer','numeric', 'factor','numeric', 'numeric','numeric',
           'factor','integer','factor','factor',rep('numeric',7),
           'factor','factor','integer')

student <- read.csv("./data/student.csv", colClasses=colcls, header=T)
str(student)
head(student)
summary(student)
student$br = trimws(student$br, which = c("both", "left", "right"))
student$br = factor(student$br)
head(student)

# save only DF student
saveRDS(student, "student1.rds")
# save all R Objects
#save.image(file="1.RData")
#save only 1 object 
#save(student, country, file="1.RData")
# read object by same or different name
student1 <- readRDS("student1.rds")
str(student1)
