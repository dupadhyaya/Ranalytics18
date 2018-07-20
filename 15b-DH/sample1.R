# Sample Methods

#Base Package
letters[1:5]
(L1 = letters[1:26])
(L2 = LETTERS[1:26])
(M1 = month.abb[1:12])
(M2 = month.name[1:12])

sample(L1, 2)
sample(L1, 30)  #error
sample(L1, 30, replace=T)  
sample(M1)
sample(M1, 5)

set.seed(10)
sample(M1,5)
set.seed(10)
sample(M1,5)
sample(M1,5)  # diff output w/o same seeding

(grades= LETTERS[1:5])
(sgrades = sample(grades, 20, replace=T, prob=c(0.4,0.2,0.2,0.1,0.1)))
table(sgrades)



prop.table(table(sgrades))
(sgrades = sample(grades, 20, replace=T, prob=c(0.4,0.2,0.2,0.1,0.1)))
table(sgrades)
prop.table(table(sgrades))


#Different Concept
sample(2, nrow(mtcars), replace=T, prob=c(0.8,0.2))

#Dplyr
library(dplyr)
dim(mtcars)
sample_frac(mtcars, 0.2)
sample_n(mtcars,5)




library(caTools)
set.seed(1000)
split = sample.split(mtcars$mpg, SplitRatio = 0.80)
train = subset(mtcars, split==TRUE)
test = subset(mtcars, split==FALSE)
head(train)
head(test)
