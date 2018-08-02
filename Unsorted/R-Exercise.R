#..............................Exercise on R..............................#

# Q.1
sessionInfo()
# Clear environment
rm(list = ls())
# Q.2
abc<- 10

# Q.3
a<-c(1,2,3)
is.numeric(a)
b<-c("aa","bb","cc")
is.character(b)
c<- c(TRUE, FALSE, TRUE)
is.logical(c)

# Q.4
ls()

# Q.5
x<-c(4,6,5,4,7,2,9,3)
# Q.5.a
length(x)
mean(x)
sum(x)
max(x)
min(x)
var(x)
# Q.5.b
x[3]
x[c(1, 3, 5, 7)]
x[2:6]  

# Q.6
y<-matrix(1:24,6,4)

# Q.7
df<-data.frame(StoreID=c(111,208,113,408),
                  Tenure=c(25,34,28,52),
                  StoreType=c("Type1","Type2","Type3","Type4"),
                  Status=c("Poor","Improved","Good","Excellent"))

# Q.8.a
df[,c(1,2)]
# Q.8.b
df[,c(3,4)]
# Q.8.c
storedata$Tenure

# Q.9
category<- c("A", "B", "C", "D")
category <- factor(category)

status <- c(1, 2, 3, 4)
status <- factor(status, levels=c(1,2,3,4), labels=c("Poor", "Improved", "Excellent", "Super"))
status

outcome <- c(1, 3, 2, 4, 3, 1, 1)
outcome <- factor(outcome, ordered=TRUE,
                  levels=c(1,2,3,4), 
                  labels=c("Poor", "Average", "Good", "Excellent"))
outcome

# Q.10
h<- c(5,26,19,88)
j<- matrix(c(1:15),5,3)
k<- c("one","two","three","four")
mylist<- list(title="My First List", ages=h,j,k) 
print(mylist)

mylist[[2]]  
mylist[["ages"]]
mylist[[2]][2]
mylist[[3]][2,2]
mylist[[3]][3,2]

