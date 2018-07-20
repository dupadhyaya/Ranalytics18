# Slice
# does not work with DBMS

library(dplyr)
slice(mtcars, 1L)
slice(mtcars, n())
slice(mtcars, 5:n())
slice(mtcars, c(2,4,5,10))

mtcars
(by_cyl <- group_by(mtcars, cyl)) # ???
nrow(by_cyl)

slice(by_cyl, 1:2)
