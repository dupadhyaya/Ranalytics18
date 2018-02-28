attendance1 = read.csv('./attendance/attendance1.csv')
attendance1
str(attendance1)

attendance2 = read.csv('./attendance/attendance2.csv')
head(names(attendance2))
str(attendance2)
attendance2a = attendance2[,-1]
str(attendance2a)
attendance2a$Student   = as.character(attendance2a$Student)
str(attendance2a)

#head(names(mutate(attendance2, RollNo=NULL))) 

library(tidyr)
tidyr_attend = gather(attendance2a, Item, Score, 2:41)
str(tidyr_attend)

