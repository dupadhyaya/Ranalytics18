# Data Structures
# exploring data structures, using data entry, importing data, annotating dataset
# data types - numeric, character, logical, complex, raw
# Vectors
a = c(1,2,5,6,-2,4)
b = c("one", "two", 'three')
c <- c(TRUE, FALSE, T,F,TRUE,FALSE)
a ; b; c
a[3] ; a[c(1,3,5)] ; a[c(2:6)]

# Matrices
# 2 D arrray where each element as same datatype
y = matrix(1:20,nrow=5,ncol=4)
y
cells = c(1,26,24,68)
rnames = c('R1','R2')
cnames = c('C1','C2')
# filled by coln first
mymatrix = matrix(cells,nrow=2,ncol=2,byrow=F,dimnames=list(rnames,cnames))
mymatrix
# filled by row first
mymatrix = matrix(cells,nrow=2,ncol=2,byrow=T,dimnames=list(rnames,cnames))
mymatrix
mymatrix[1,2]  # first row, second coln
x = matrix(1:10,nrow=2)
x
x[2,] ; x[,2];x[1,4] ;x[1,c(4,5)]

#Arrays
# similar to matrices but can have more than 2 dim
# myarray= array(vector,dim,dimnames)
dim1 = c('A1','A2')
dim2 = c('B1','B2','B3')
dim3 = c('C1','C2','C3','C4')
z = array(1:24,c(2,3,4))
z
z = array(1:24,c(2,3,4),dimnames=list(dim1,dim2,dim3))
z

# data frame
# different colns contain different modes of data (numeric, character)
# mydata = data.frame(col1,col2,col3)
patientid = c(1,2,3,4)
age = c(25,34,28,52)
diabetes = c('Type1','Type2','Type1','Type1')
status = c('Poor','Improved','Excellent','Poor')
patientdata = data.frame(patientid,age,diabetes,status)
patientdata
patientdata[1:2]
patientdata[c('diabetes','status')]
patientdata$age
table(patientdata$diabetes,patientdata$status)
table(patientdata$diabetes,patientdata$status,patientdata$age)

#attach, detach, with
summary(mtcars$mpg)
summary(patientdata)
plot(mtcars$mpg, mtcars$disp)
plot(mtcars$mpg, mtcars$wt)
# another way of writing
attach(mtcars)
summary(mpg)
plot(mpg, disp)
plot(mpg,wt)
detach(mtcars)
# with
with(mtcars, {
  summary(mpg,disp,wt)
  plot(mpg,disp)
  plot(mpg,wt)
} )
# special assignment : with recommended over attach
with(mtcars, {
  nokeepstats = summary(mpg)
  keepstats <<- summary(mpg)
} )
nokeepstats  # no output
keepstats

# case identifiers : identify each row with rowname option
patientdata = data.frame(patientid,age,diabetes,status,row.names = patientid)
patientdata
summary(patientdata)

# factors
diabetes = c('Type1','Type2','Type1','Type1')
diabetes = factor(diabetes)
diabetes
status = c('Poor','Improved','Excellent','Poor')
status = factor(status, ordered=T)
status
patientdata = data.frame(patientid,age,diabetes,status)

summary(patientdata)
status = factor(status, ordered=T,levels=c('Poor','Improved','Excellent'))
status

patientdata = data.frame(patientid,age,diabetes,status)
patientdata
str(patientdata)

#Lists : most complex - ordered collection of objects
# combinatino of matrices, data frames, other lists
#mylist = list(object1, object2)

g = 'My first list'
h = c(25,26,18,39)
j = matrix(1:10,nrow=5)
k = c("one",'two','Three')
mylist = list(title=g,ages=h,j,k)
mylist
mylist[[2]]
mylist[['ages']]
