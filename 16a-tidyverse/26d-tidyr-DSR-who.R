# tidyr 

library(tidyr)
#devtools::install_github("garrettgman/DSR")
library(DSR)
data(who)
#View(who)
#who data set in the DSR package contains cases of tuberculosis (TB) reported between 1995 and 2013 sorted by country, age, and gender. 

dim(who) #60 columns
names(who)
head(who[1:10])


#gather-----
head(names(who),10)
who1 <- gather(who, "code", "value", 5:60)
head(who1,10)

#seperate----
#default sep _
who2 <- separate(who1, code, c("new", "var", "sexage"))
head(who2)
table(who2$sexage)

#second pass will split sexage after the first character to create a sex column and an age column.
#split after 1st character : f014 - f and 014
who3 <- separate(who2, sexage, c("sex", "age"), sep = 1)
head(who3)


#spread----
#move the rel, ep, sn, and sp keys into their own column names with spread().
head(names(who3))
head(who3[c('var')])
table(who3$var)
who4 <- spread(who3, var, value)
head(who4)

dim(who4)
names(who4)
