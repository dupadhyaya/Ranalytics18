# tidyr 

library(tidyr)
#devtools::install_github("garrettgman/DSR")
library(DSR)
head(table1)
head(table2)
head(table3)
head(table4)
head(table5)
head(table6)


table1$cases

#spread----
library(tidyr)
head(table2)
spread(table2, type, count)
?spread


#gather-----
head(table4)
gather(table4, "year", "cases", 2:3)
head(table4)
gather(table4, "year", "population", 2:3)

gather(table4, "year", "population", -1)

?gather
#seperate----
#turns a single character column into multiple columns by splitting the values of the column wherever a separator character appears.
?separate
head(table3)
separate(table3, rate, into = c("cases", "population"))
# specify character
separate(table3, rate, into = c("cases", "population"), sep = "/")
#integer position
head(table3)
separate(table3, year, into = c("century", "year"), sep = 2)


#unite----
head(table6)
unite(table6, "new", century, year, sep = "")
?unite
