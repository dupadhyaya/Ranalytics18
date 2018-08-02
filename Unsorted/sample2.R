#Sample
?sample

#Simple
x = c('A', 'B', 'C', 'D', 'E')
sample(x, 2)
sample(x, 2)
sample(x, 4, replace=TRUE) # repeats samples

# with Probability

probability = c(0.1, 0.15, 0.2, 0.25, 0.3  )
sum(probability)
#They need not sum to one, but they should be nonnegative and not all zero.
#probability of choosing the next item is proportional to the probabilities amongst the remaining items. The number of nonzero weights must be at least size in this case.

sample(x, 3, prob=probability)
x

# Bernoillis Trial
sample(c(0,1), 100, replace = TRUE)

# Data as Data Frame
mtcars
(mtcars1 = mtcars[c(1:4)]) # reduce the no of cols
str(mtcars1)
(mtcars2 = sample(mtcars1, 1, replace=FALSE)) # Select either colns
(mtcars3 = mtcars1[sample(1:nrow(mtcars1), 3, replace=FALSE),])  #select any 3 rows

# 
(m = matrix(1:24, nrow=6))
sample(m, 3)  # any value from the matrix cell not row
nrow(m)
m[sample(1:nrow(m), 3),]   # select any row of matrix

# Give probability to each row
pm = c(0.1, 0.15, 0.2, 0.25, 0.3, 0.2  )
sum(pm)  # incorrect but still worked
m[sample(1:nrow(m), 3, prob= pm),]
m



#Multiple Samples stored in a file
idorg = c(1,2,3,4,5)
x = c(14,20,21,16,17)
y = c(31,21,20,50,13)
dataset = cbind (idorg,x,y)
dataset

for (i in 1:4) {
  attempt = dataset[sample(1:nrow(dataset), 3, replace=FALSE),]
  print(attempt)
  }

# print to a file
for (i in 1:4)  {
  attempt <- dataset[sample(1:nrow(dataset), 3, replace=FALSE),]
  write.table(attempt, sprintf( "./data/dataset[%d].csv", i ), sep='\t')
}



# List
g ="My First List"
h = c(25, 26,18,39)
j = matrix(1:10,nrow=2)
k = c('one','two','three')
l = data.frame(formno = c(17010, 17045, 17012), 
               name=c('Achal', 'Apoorva', 'Goldie'), 
               gender=c('M','F','M'), stringsAsFactors = F)
g;h;j;k;l
mylist = list(title=g, ages=h, j, h,students=l)
mylist   # full list
sample(mylist,2)  # anytwo objects from the list
sample(mylist$students ,2 )  # any two cols of DF
mylist$students[sample(1:nrow(mylist$students),2), 1] # from col1
mylist$students[sample(1:nrow(mylist$students),2), 2] # from col2
mylist$students[sample(1:nrow(mylist$students),2), 3] # from col3

sample(mylist$ages ,2 )  # any two values of numeric vector age




# Sample based on conditional value
x = 1:10
x
sample(x[x >  8]) # length 2
sample(x[x >  9]) # oops -- length 10!  # incorrect value
sample(x[x > 10]) # error!

try(sample(x[x > 10])) #no output

?try
## This is safer:
resample <- function(x) x[sample.int(length(x))]
resample(x[x >  8]) # length 2
resample(x[x >  9]) # length 1
resample(x[x > 10]) # length 0

?sample.int
#sample.int is a bare interface in which both n and size must be supplied as integers.


sample.int(1e5, 12, replace = TRUE)
sample.int(1e5, 12) # not that there is much chance of duplicates

# Extras

library(data.table)
set.seed(10)

mtcars <- data.table(mtcars)
mtcars[sample(.N, 6)]


library(dplyr)
df= mtcars
sample_n(df, 10)



#install.packages('kimisc')

library(kimisc)
example(sample.rows)

set.seed(42)

sample.rows(data.frame(a=c(1,2,3), b=c(4,5,6),
                row.names=c('a', 'b', 'c')), 10, replace=TRUE)
sample.rows(mtcars,5)


# 
library("tibble")    
a = mtcars[sample(1:nrow(mtcars), 3),]
a


# Library kimisc
library(kimisc)
example(sample.rows)
set.seed(12)
df3= data.frame(a=c(1,2,3), b=c(4,5,6), 
      row.names = c('a','b','c'))
sample.rows(df3, 10, replace=TRUE)  # show how many times repeated
  