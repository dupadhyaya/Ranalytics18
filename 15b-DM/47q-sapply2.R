# SAPPLY

#List
list2 = list(num=1:10, vec=c(1:5, 4:5, 6:8, NA, 9, 12, 17), lg=log(1:5))
list2

sapply(list2, FUN=mean, na.rm=T)

# DF
str(student1)
sapply(draws, mean)
dim(student1)
s1 = student1[,c('java','dbms', 'dwm','vlsi', 'cpp', 'cbnst')]
sapply(s1,mean)
mode(sapply(s1,mean))
class(sapply(s1,mean))

mode(s1)
class(s1)
str(s1)

#List
l <- list(a = 1:100, b = 11:20)
l
l.mean <- sapply(l, mean)
l.mean

#difference with lapply?
#lapply always returns a list. 
#sapply (if it can) simplifies the results
lapply(draws,mean)
#get same result as sapply
unlist(lapply(draws,mean))
