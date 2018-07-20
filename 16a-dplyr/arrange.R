#arrange

library(dplyr)
# sort in particular order
arrange(mtcars, +cyl, -disp)
arrange(mtcars, desc(disp))
